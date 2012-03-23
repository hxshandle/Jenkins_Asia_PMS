<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Purchase
 *
 * @author MSJ
 */
class Purchase {
    //put your code here
  private $myLog;
  
  function __construct() {
    $this->myLog = new mylog;
  }
  
  function add($name,$project,$quantity,$desc,$status,$valid=1){
    $project = (int) $project;
    $quantity = (int) $quantity;
    $name = mysql_escape_string($name);
    $desc = mysql_escape_string($desc);
    $sql = "INSERT INTO `purchase`
            (`name`,
            `project`,
            `quantity`,
            `desc`,
            `submit_time`,
            `status`,
            `valid`)
            VALUES
            (
            '$name',
            $project,
            $quantity,
            '$desc',
            NOW(),
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
    $status = Status::getId("purchase", "accepted");
    return $this->updateStatus($id, $status);
  }
  
  function agree($id){
    $status = Status::getId("purchase", "in_progress");
    return $this->updateStatus($id, $status);
  } 
  function reject($id){
    $status = Status::getId("purchase", "rejected");
    return $this->updateStatus($id, $status);  
  }
  private function updateStatus($id,$status){
    $id = (int) $id;
    $sql = "update `purchase` set `status` = $status where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }
  

  
 function updatePrice($id,$endTime,$priceCost,$priceCurrency){
    $status = Status::getId("purchase", "in_progress");
    $id = (int) $id;
    $desc = mysql_escape_string($desc);
    $sql = "update `purchase` set `price_currency`='$priceCurrency',`price`=$priceCost,`end_time`='$endTime',`status`=$status where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return TRUE;
    }else{
      return FALSE;
    }
  }

  function getPurchasesBySupplier($projectId,$supplierId){
    $sql = "select o.ID,o.name,o.quantity,p.supplier_leader as supplierlead,o.price,o.price_currency,(select value from status s where o.status = s.ID) as status,o.status as statusId from `projekte` p,`purchase` o  where o.project = p.ID and o.valid = 1 and p.supplier_leader = $supplierId and o.project=$projectId ";
    $query = mysql_query($sql);
    $arrPurchase = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arrPurchase, $row);
    }
    return $arrPurchase;
  }
  function getPurchasesByProjectId($projectId){
    $sql = "select o.ID,o.name,o.quantity,p.supplier_leader as supplierlead,o.price,o.price_currency,(select value from status s where o.status = s.ID) as status,o.status as statusId from `projekte` p,`purchase` o  where o.project = p.ID and o.valid = 1 and  `project`=$projectId ";
    $query = mysql_query($sql);
    $arrPurchase = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arrPurchase, $row);
    }
    return $arrPurchase;
  }
  
  function get($id){
    $id = (int) $id;
    $sql = "select * from  `purchase`  where `id` = '$id'";
    $query = mysql_query($sql);
    $ret = array();
    if(!empty($query)){
      $ret = mysql_fetch_array($query);
    }
    return $ret;
  }
}

?>
