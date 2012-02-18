<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Status
 *
 * @author huanghandle
 */
class Status {

  //put your code here
  private $myLog;

  function __construct() {
    $this->myLog = new mylog;
  }

  function add($type, $value) {
    $type = mysql_real_escape_string($type);
    $value = mysql_real_escape_string($value);

    $ins = mysql_query("insert into status (type,value) values ('$type','$value')");
    if ($ins) {
      $insid = mysql_insert_id();
      return $insid;
    } else {
      return FALSE;
    }
  }

  function update($id,$type,$value) {
    $id = (int) $id;
    $type = mysql_real_escape_string($type);
    $value = mysql_real_escape_string($value);
    
    $upd = mysql_query("update status set `type`='$type' `value`='$value' where ID=$id");
    if($upd){
      return TRUE;
    }else{
      return FALSE;
    }
  }

  function del($id) {
    $id = (int) $id;
    $del = mysql_query("delete from status where ID = $id");
    if($del){
      return TRUE;
    }else{
      return FALSE;
    }
  }

}

?>
