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
            return array_map($this->precessTagName);
        } else {
            return false;
        }
    }

    public function saveTags($tagStr)
    {
        $tags = $this->splitTagStr($tagStr);
        if (!$tags) {
            return;
        }
        $names = " `".implode("`, `", array_keys($tags))."`";
        $sql = "select ID from tags where name in ($names)";
        $ins = mysql_query($sql);
        if($ins){
            return mysql_insert_id();
        }else{
            return false;
        }
    }
}