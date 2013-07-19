<?php
/**
 * Created by JetBrains PhpStorm.
 * User: handle
 * Date: 7/15/13
 * Time: 2:36 PM
 * To change this template use File | Settings | File Templates.
 */

class AuditTrail
{
  function create($table_name, $ref_id, $action, $comments)
  {
    $table_name = mysql_escape_string($table_name);
    $ref_id = (int)$ref_id;
    $user_id = $_SESSION['userid'];
    $action = mysql_escape_string($action);
    $comments = mysql_escape_string($comments);
    $sql = "INSERT INTO `audit_trail` 
    (`table_name`,
      `ref_id`,
      `user_id`,
      `action`,
      `comments`) 
    values 
    (
      '$table_name',
      $ref_id,
      $user_id,
      '$action',
      '$comments'
      ) ";
    $ins = mysql_query($sql);
    if ($ins) {
      $id = mysql_insert_id();
      return $id;
    } else {
      return false;
    }
  }

  function get($id)
  {
    $id = (int)$id;
    $sql = "select * from audit_trail where ID = $id";
    $sel = mysql_query($sql);
    $ret = array();
    $user = new user();
    if ($sel) {
      $ret = mysql_fetch_array($sel);
      $u = $user->getProfile($ret['user_id']);
      $ret['user_name'] = $u['name'];
    }
    return $ret;
  }

  function getAuditTrails($table_name, $ref_id)
  {
    $table_name = mysql_escape_string($table_name);
    $ref_id = (int)$ref_id;
    $sql = "select ID from audit_trail where table_name = '$table_name' and ref_id = $ref_id order by create_at DESC";
    $sel = mysql_query($sql);
    $ret = array();
    while ($row = mysql_fetch_array($sel)) {
      $data = $this->get($row['ID']);
      array_push($ret, $data);
    }
    return $ret;
  }
}