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

    public function create($name, $user, $address, $phone_number, $audit_history)
    {
        $name = mysql_real_escape_string($name);
        $user = (int) $user;
        $address = mysql_real_escape_string($address);
        $phone_number = mysql_real_escape_string($phone_number);
        $audit_history = mysql_real_escape_string($audit_history);
        $sql = "INSERT INTO `suppliers`
            (
            `name`,
            `user`,
            `address`,
            `phone_number`,
            `audit_history`
            )
            VALUES
            (
            '$name',
            $user,
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

    public function update($id, $name, $user, $address, $phone_number, $audit_history)
    {
        $id = (int) $id;
        $name = mysql_real_escape_string($name);
        $user = (int) $user;
        $address = mysql_real_escape_string($address);
        $phone_number = mysql_real_escape_string($phone_number);
        $audit_history = mysql_real_escape_string($audit_history);
        $sql = "UPDATE `suppliers`
            SET
            `name` = '$name',
            `user` = $user,
            `address` = '$address',
            `phone_number` = '$phone_number',
            `audit_history` = '$audit_history'
            WHERE `ID` = $id";
        $upd = mysql_query($sql);
        if($upd){
            return true;
        }else{
            return false;
        }
    }

    public function delete($id)
    {
        $id = (int) $id;
        $sql = "update `suppliers` set valid = 0 where ID = $id ";
        $upd = mysql_query($sql);
        if($upd){
            return true;
        }else{
            return false;
        }
    }


    public function getSuppliers()
    {
        $sql = "SELECT
              supplier.*,
              user.name     AS username,
              supplier.name AS supplier_name
            FROM suppliers supplier, user user
            WHERE supplier.user = user.ID AND supplier.valid = 1;";
        $ret = $this->jUtils->Query($sql);
        return $ret;
    }




    public function _getSupplierInfo($supplier)
    {
        $supplier = $this->getProjects($supplier);
        $supplier = $this->getQualities($supplier);// alias SCA
        $supplier = $this->getOrders($supplier);
        return $supplier;
    }

    public function getSupplierById($id)
    {
        $id = (int) $id;
        $sql = "SELECT
              supplier.*,
              user.name     AS username,
              supplier.name AS supplier_name
            FROM suppliers supplier, user user
            WHERE supplier.user = user.ID AND supplier.valid = 1 and supplier.ID = $id";
        $ret = array();
        $sel = mysql_query($sql);
        while($row = mysql_fetch_array($sel)){
            $info = $this->_getSupplierInfo($row);
            array_push($ret,$info);
        }
        return $ret;

    }

    /**
     * @param $supplier
     */
    private function getProjects($supplier)
    {
        $Project = new project();
        $supplierUserId = $supplier['username'];
        $sql = "select * from projekte where project_leader='$supplierUserId'";
        $projects = $this->jUtils->Query($sql);
        $ret = array();
        foreach ($projects as $project) {
            $projectStatus = $Project->getProgress($project['ID']);
            $project['project_status'] = $projectStatus;
            array_push($ret,$project);
        }
        $supplier["projects"] = $ret;
        return $supplier;
    }

    private function getQualities($supplier)
    {
        $projectIds = array();
        foreach ($supplier["projects"] as $project) {
            array_push($projectIds,$project['ID']);
        }
        $strProjectids = implode(',',$projectIds);
        $sql = "select * from quality where project in ($strProjectids)";
        $scas = $this->jUtils->Query($sql);
        $supplier['SCA'] = $scas;
        return $supplier;
    }

    private function getOrders($supplier)
    {
        $projectIds = array();
        foreach ($supplier["projects"] as $project) {
            array_push($projectIds,$project['ID']);
        }
        $strProjectids = implode(',',$projectIds);
        $sql = "select * from `order` where valid!=0 and project in ($strProjectids)";
        $scas = $this->jUtils->Query($sql);
        $supplier['orders'] = $scas;
        return $supplier;

    }

} 