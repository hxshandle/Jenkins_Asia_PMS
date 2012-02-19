<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of order
 *
 * @author huanghandle
 */
class Order {
  //put your code here
  private $myLog;
  
  function __construct() {
    $this->myLog = new mylog;
  }
  
  function add($name,$desc,$endTime,$status,$valid=1){
    $name = mysql_escape_string($name);
    $desc = mysql_escape_string($desc);
    $sql = "insert into order (`name`,`desc`,`submit_time`,`end_time`,`status`,`valid`) values ('$name','$desc',NOW(),'$endTime',$status,$valid)";
    $ins = mysql_query($sql);
    if($ins){
      $id = mysql_insert_id();
      return $id;
    }else{
      return FALSE;
    }
  }
  
  function accept($id){
    $status = Status::getId("order", "accept");
    return $this->updateStatus($id, $status);
  }
  
  function close($id){
    $status = Status::getId("order", "close");
    return $this->updateStatus($id, $status);  
  }
  private function updateStatus($id,$status){
    $id = (int) $id;
    $sql = "update order set status = $status where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }
  
  
  function update($id,$desc,$endTime,$status,$valid){
    $id = (int) $id;
    $desc = mysql_escape_string($desc);
    $sql = "update order `desc`='$desc',`end_time`='$endTime',`status`=$status,`valid`=$valid where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return TRUE;
    }else{
      return FALSE;
    }
  }
  function getOrders($projectId){
    $sql = "select * from order where `project`=$projectId and `valid`=1";
    $query = mysql_query($sql);
    $arrOrder = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arrOrder, $row);
    }
    return $arrOrder;
  }
}

?>
