<?php

/**
 * Created by Handle.
 * User: I073349
 * Date: 9/2/14
 * Time: 2:14 PM
 */
class Supplier
{

    private $jUtils;

    function __construct()
    {
        $this->jUtils = new JUtils();
    }

    public function create($name, $users, $address, $phone_number, $audit_history)
    {
        $name = mysql_real_escape_string($name);
        $users = mysql_real_escape_string($users);
        $address = mysql_real_escape_string($address);
        $phone_number = mysql_real_escape_string($phone_number);
        $audit_history = mysql_real_escape_string($audit_history);
        $sql = "INSERT INTO `suppliers`
            (
            `name`,
            `users`,
            `address`,
            `phone_number`,
            `audit_history`
            )
            VALUES
            (
            '$name',
            '$users',
            '$address',
            '$phone_number',
            '$audit_history'
            )
    ";
        $sel = mysql_query($sql);
        if ($sel) {
            return mysql_insert_id();
        } else {
            return false;
        }
    }

    public function update($id, $name, $users, $address, $phone_number, $audit_history)
    {
        $id = (int)$id;
        $name = mysql_real_escape_string($name);
        $users = mysql_real_escape_string($users);
        $address = mysql_real_escape_string($address);
        $phone_number = mysql_real_escape_string($phone_number);
        $audit_history = mysql_real_escape_string($audit_history);
        $sql = "UPDATE `suppliers`
            SET
            `name` = '$name',
            `users` = '$users',
            `address` = '$address',
            `phone_number` = '$phone_number',
            `audit_history` = '$audit_history'
            WHERE `ID` = $id";
        $upd = mysql_query($sql);
        if ($upd) {
            return true;
        } else {
            return false;
        }
    }

    public function delete($id)
    {
        $id = (int)$id;
        $sql = "update `suppliers` set valid = 0 where ID = $id ";
        $upd = mysql_query($sql);
        if ($upd) {
            return true;
        } else {
            return false;
        }
    }


    public function getSuppliers()
    {
        /*$sql = "SELECT
              supplier.*,
              user.name     AS username,
              supplier.name AS supplier_name
            FROM suppliers supplier, user user
            WHERE supplier.user = user.ID AND supplier.valid = 1;";*/
        $sql = "select * from suppliers where valid = 1";
        $ret = $this->jUtils->Query($sql);
        $arr = array();
        foreach ($ret as $item) {
            $item['tag_str'] = $this->getTagStr($item['ID']);
            array_push($arr, $item);
        }
        return $arr;
    }


    public function _getSupplierInfo($supplier)
    {
        $supplier = $this->getProjects($supplier);
        $supplier = $this->getQualities($supplier);// alias SCA
        $supplier = $this->getOrders($supplier);
        $supplier = $this->getFiles($supplier);
        $supplier = $this->getTags($supplier);
        return $supplier;
    }

    public function getAllSystemSupplierUsers()
    {
        $sql = "select * from user where role_type in (8,9)";
        $ret = $this->jUtils->Query($sql);
        return $ret;
    }

    public function getSupplierById($id)
    {
        $id = (int)$id;
        $sql = "SELECT
              supplier.*,
              supplier.name AS supplier_name
            FROM suppliers supplier
            WHERE supplier.valid = 1 and supplier.ID = $id";
        $ret = array();
        $sel = mysql_query($sql);
        while ($row = mysql_fetch_array($sel)) {
            $info = $this->_getSupplierInfo($row);
            array_push($ret, $info);
        }
        return $ret;
    }


    private function getSupplierLeaderUserIdsStr($supplier)
    {
        $userStr = $supplier['users'];
        $userNames = explode(',', $userStr);
        $sqlName = "";

        foreach ($userNames as $name) {
            $sqlName .= "'" . $name . "',";
        }
        $sqlName = rtrim($sqlName, ',');
        $sql = "select * from `user` where `name` in ($sqlName)";
        $ret = $this->jUtils->Query($sql);
        $arrID = array();
        foreach ($ret as $item) {
            array_push($arrID, $item['ID']);
        }

        return join(',', $arrID);
    }

    /**
     * @param $supplier
     */
    private function getProjects($supplier)
    {
        $Project = new project();
        $leaderIDsStr = $this->getSupplierLeaderUserIdsStr($supplier);
        $sql = "select * from projekte where supplier_leader in ($leaderIDsStr)";
        $projects = $this->jUtils->Query($sql);
        $ret = array();
        foreach ($projects as $project) {
            $projectStatus = $Project->getProgress($project['ID']);
            $project['project_status'] = $projectStatus;
            array_push($ret, $project);
        }
        $supplier["projects"] = $ret;
        return $supplier;
    }

    private function getQualities($supplier)
    {
        $projectIds = array();
        foreach ($supplier["projects"] as $project) {
            array_push($projectIds, $project['ID']);
        }
        $strProjectids = implode(',', $projectIds);
        $sql = "select * from quality where project in ($strProjectids)";
        $scas = $this->jUtils->Query($sql);
        $supplier['SCA'] = $scas;
        return $supplier;
    }

    private function getOrders($supplier)
    {
        $projectIds = array();
        foreach ($supplier["projects"] as $project) {
            array_push($projectIds, $project['ID']);
        }
        $strProjectids = implode(',', $projectIds);
        $sql = "select * from `order` where valid!=0 and project in ($strProjectids)";
        $scas = $this->jUtils->Query($sql);
        $supplier['orders'] = $scas;
        return $supplier;

    }

    public function uploadFile($data, $file_path)
    {
        $supplierId = (int)getArrayVal($data, 'id');
        $fileType = getArrayVal($data, 'filetype');
        $description = getArrayVal($data, 'description');
        $description = mysql_real_escape_string($description);
        $uploadedBy = $_SESSION['userid'];

        $sql = "INSERT INTO `supplier_files`
                    (
                    `file_type`,
                    `file_path`,
                    `description`,
                    `uploaded_by`,
                    `supplier_id`
                    )
                    VALUES
                    (
                    '$fileType',
                    '$file_path',
                    '$description',
                    $uploadedBy,
                    $supplierId
                    )
                  ";
        $ins = mysql_query($sql);
        if ($ins) {
            return mysql_insert_id();
        }
        return false;

    }

    private function getFiles($supplier)
    {
        $id = (int)$supplier['ID'];
        $sql = "select * from supplier_files where supplier_id = $id order by file_type";
        $files = $this->jUtils->Query($sql);
        $supplier['files'] = $files;
        return $supplier;
    }

    private function getTags($supplier)
    {
        $id = (int)$supplier['ID'];
        $sql = "select t.name from supplier_tag st, tags t where st.supplier_id = $id and t.ID = st.tag_id";
        $tags = $this->jUtils->Query($sql);
        $supplier['tags'] = $tags;
        $tagStr = "";
        foreach ($tags as $tag) {
            $tagStr .= $tag['name'] . ",";
        }
        $tagStr = rtrim($tagStr, ',');
        $supplier['tag_str'] = $tagStr;
        return $supplier;
    }

    private function getTagStr($id)
    {
        $id = (int)$id;
        $sql = "select t.name from supplier_tag st, tags t where st.supplier_id = $id and t.ID = st.tag_id";
        $tags = $this->jUtils->Query($sql);
        $tagStr = "";
        foreach ($tags as $tag) {
            $tagStr .= $tag['name'] . ",";
        }
        $tagStr = rtrim($tagStr, ',');
        return $tagStr;
    }

} 