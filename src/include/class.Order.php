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
  
  function add($name,$project,$quantity,$desc,$endTime,$status,$valid=1){
    $project = (int) $project;
    $quantity = (int) $quantity;
    $name = mysql_escape_string($name);
    $desc = mysql_escape_string($desc);
    $sql = "INSERT INTO `order`
            (`name`,
            `project`,
            `quantity`,
            `desc`,
            `submit_time`,
            `end_time`,
            `status`,
            `valid`)
            VALUES
            (
            '$name',
            $project,
            $quantity,
            '$desc',
            NOW(),
            '$endTime',
            $status,
            $valid
            );";
    $ins = mysql_query($sql);
    if($ins){
      $id = mysql_insert_id();
      return $id;
    }else{
      return FALSE;
    }
  }
  
  function accept($id){
    $status = Status::getId("order", "accepted");
    return $this->updateStatus($id, $status);
  }
  
  function agree($id){
    $status = Status::getId("order", "in_progress");
    return $this->updateStatus($id, $status);
  } 
  function reject($id){
    $status = Status::getId("order", "rejected");
    return $this->updateStatus($id, $status);  
  }
  private function updateStatus($id,$status){
    $id = (int) $id;
    $sql = "update `order` set `status` = $status where ID = $id";
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
    $sql = "update `order` set `desc`='$desc',`end_time`='$endTime',`status`=$status,`valid`=$valid where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return TRUE;
    }else{
      return FALSE;
    }
  }
  
 function updatePrice($id,$endTime,$innercost,$innercostcurrency,$externalcost,$externalcostcurrency,$published){
    $status = Status::getId("order", "in_progress");
    $id = (int) $id;
    $desc = mysql_escape_string($desc);
    $sql = "update `order` set `inner_cost_currency`='$innercostcurrency',`inner_cost`=$innercost,`external_cost_currency`='$externalcostcurrency',`external_cost`='$externalcost',`published`='$published',`end_time`='$endTime',`status`=$status where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return TRUE;
    }else{
      return FALSE;
    }
  }
  
  
  
  function getOrders($projectId){
    $sql = "select * from `order` where `project`=$projectId and `valid`=1";
    $query = mysql_query($sql);
    $arrOrder = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arrOrder, $row);
    }
    return $arrOrder;
  }
  
  function getOrdersByCustomer($projectId,$customerId){
    $sql = "select o.ID,o.name,o.quantity,(select u.name from user u where p.customer_leader = u.ID) as customerlead,p.supplier_leader as supplierlead,o.inner_cost,o.inner_cost_currency,o.external_cost,o.external_cost_currency,(select value from status s where o.status = s.ID) as status,o.status as statusId,o.published from `projekte` p,`order` o  where o.project = p.ID and o.valid = 1 and p.customer_leader = $customerId and o.project=$projectId ";
    $query = mysql_query($sql);
    $arrOrder = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arrOrder, $row);
    }
    return $arrOrder;
  }
  function getOrdersByManager($projectId){
    $sql = "select o.ID,o.name,(select u.name from user u where p.customer_leader = u.ID) as customerlead,p.supplier_leader as supplierlead,f.inner_cost,f.inner_cost_currency,f.external_cost,f.external_cost_currency,o.status from `projekte` p,`order` o left join finance f on o.ID = f.order where o.project = p.ID and o.valid = 1 and  `project`=$projectId ";
    $query = mysql_query($sql);
    $arrOrder = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arrOrder, $row);
    }
    return $arrOrder;
  }
  
  function get($id){
    $id = (int) $id;
    $sql = "select * from  `order`  where `id` = '$id'";
    $query = mysql_query($sql);
    $ret = array();
    if(!empty($query)){
      $ret = mysql_fetch_array($query);
    }
    return $ret;
  }
}

?>
