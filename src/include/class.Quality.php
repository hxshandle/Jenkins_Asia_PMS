<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Quality
 *
 * @author huanghandle
 */
class Quality {
  //put your code here
  
  private $myLog;
  
  function __construct() {
    $this->myLog = new mylog;
  }
  
  function add($name,$desc,$project,$submitter,$submitter_comments,$type,$status){
    $name = mysql_escape_string($name);
    $desc = mysql_escape_string($desc);
    $submitter_comments = mysql_escape_string($submitter_comments);
    $sql = "";
    $ins = mysql_query($sql);
    if($ins){
      return mysql_insert_id();
    }else{
      return false;
    }
  }
  function close($id){
    $id = (int) $id;
    $status = Status::getId("quality", "closed");
    $sql = "update `quality` set `status` = $status where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }
  
  function update($id,$desc,$status){
    $id = (int) $id;
    $desc = mysql_escape_string($desc);
    $sql = "update `quality` set `desc`='$desc',`status` = $status where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }
  
  function del($id){
    return $this->close($id);
  }
}

?>
