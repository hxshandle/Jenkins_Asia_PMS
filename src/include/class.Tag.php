<?php

class Tag
{

    protected $jutil;

    function __construct()
    {
        $this->jutil = new JUtils();
    }

    private function precessTagName($name)
    {
        return mysqli_real_escape_string($name);
    }

    public function splitTagStr($tagstr)
    {
        $tags = explode(",", $tagstr);
        if (!empty($tags)) {
            return $tags;
        } else {
            return false;
        }
    }

    private function saveNewTag($arrTagNames)
    {
        $newIds = array();
        foreach ($arrTagNames as $tagName) {
            //$tagName = mysqli_real_escape_string($tagName);
            $sql = "insert into tags (`name`) values ('$tagName')";
            $ins = mysql_query($sql);
            if ($ins) {
                $id = mysql_insert_id();
                array_push($newIds, $id);
            }
        }
        return $newIds;
    }

    public function saveSupplierTags($id, $tagStr)
    {
        $id = (int)$id;
        $tags = $this->splitTagStr($tagStr);
        if (!$tags) {
            return;
        }
        $names = " '" . implode("', '", $tags) . "'";
        $sql = "select * from tags where name in ($names)";
        $sel = mysql_query($sql);
        $existedTags = array();
        $existedTagIds = array();
        while ($tag = mysql_fetch_row($sel)) {
            array_push($existedTags, $tag[1]);
            array_push($existedTagIds, $tag[0]);
        }
        $newTags = array_filter($tags, function ($tag) use (&$existedTags) {
            $isExisted = !in_array($tag, $existedTags);
            return $isExisted;
        });
        // 找出新添加的标签
        $newTagIds = $this->saveNewTag($newTags);
        // 合并所有需要关联的tagID
        // 更新Tag的关联
        $sql2 = "delete from supplier_tag where supplier_id = $id";
        mysql_query($sql2);
        $allIDs = array_merge($newTagIds, $existedTagIds);
        $sql3 = 'INSERT INTO supplier_tag (`supplier_id`, `tag_id`) VALUES ';
        foreach ($allIDs as $tagId) {
            $sql3 .= '(' . $id . "," . $tagId . "),";
        }
        $sql3 = rtrim($sql3, ',');
        $sel3 = mysql_query($sql3);
        return !! $sel3;
    }

    public function getAllTags()
    {
        $sql = "select name from tags";
        $ret = $this->jutil->Query($sql);
        return $ret;
    }
}