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

} 