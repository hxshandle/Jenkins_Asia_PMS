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
  
  function add($project,$actionNo,$qualityNo,$issueDate,$productNo,$productDesc,$shipNo,$statusUpdate,$lotQuantity,$sampleSize,$defects,$rejectRate,$quantityInInventory,$quantityInProcess,$containmentDesc,$acknowledgeBy,$acknowledgeDate,$verifiedForClosureBy,$verificationDate,$valid=1,$orderId = -1){
    $actionNo = mysql_escape_string($actionNo);
    $qualityNo = mysql_escape_string($qualityNo);
    $productNo = mysql_escape_string($productNo);
    $productDesc = mysql_escape_string($productDesc);
    $shipNo = mysql_escape_string($shipNo);
    $statusUpdate = mysql_escape_string($statusUpdate);
    $quantityInInventory = mysql_escape_string($quantityInInventory);
    $quantityInProcess = mysql_escape_string($quantityInProcess);
    $containmentDesc = mysql_escape_string($containmentDesc);
    $acknowledgeBy = mysql_escape_string($acknowledgeBy);
    $verifiedForClosureBy = mysql_escape_string($verifiedForClosureBy);
    $actionNo = mysql_escape_string($actionNo);
    $actionNo = mysql_escape_string($actionNo);
    $actionNo = mysql_escape_string($actionNo);
    $actionNo = mysql_escape_string($actionNo);
    $actionNo = mysql_escape_string($actionNo);

    $project = (int) $project;
    $lotQuantity = (int) $lotQuantity;
    $sampleSize = (int) $sampleSize;
    $defects = (int) $defects;
    $rejectRate = (double) $rejectRate;
    $valid = (int) $valid;
    $orderId = (int) $orderId;

    $sql = "
            INSERT INTO `quality`
            (
            `action_no`,
            `quality_no`,
            `issue_date`,
            `product_no`,
            `product_desc`,
            `ship_no`,
            `status_update`,
            `lot_quantity`,
            `Sample_size`,
            `defects`,
            `reject_rate`,
            `quantity_in_inventory`,
            `quantity_in_process`,
            `containment_desc`,
            `acknowledge_by`,
            `acknowledge_date`,
            `verified_for_closure_by`,
            `verification_date`,
            `valid`,
            `project`,
            `order`)
            VALUES
            (
            '$actionNo',
            '$qualityNo',
            '$issueDate',
            '$productNo',
            '$productDesc',
            '$shipNo',
            '$statusUpdate',
            $lotQuantity,
            $sampleSize,
            $defects,
            $rejectRate,
            '$quantityInInventory',
            '$quantityInProcess',
            '$containmentDesc',
            '$acknowledge_by',
            '$acknowledgeDate',
            '$verifiedForClosureBy',
            '$verificationDate',
            $valid,
            $project,
            $orderId
            )
            ";
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
    $sql = "update `quality` set `valid` = 0 where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      $qDeetails = new QualityDetails();
      $qDeetails->closeByQualityId($id);
      return true;
    }else{
      return false;
    }
  }
  
  function filterQuality($projectId,$orderId,$customerName){
    $projectId = (int)$projectId;
    $orderId = (int) $orderId;
    $customerName = mysql_escape_string($customerName);
    $sql = "select q.* from quality q, projekte p ";
    $userRole = $_SESSION['userRole'];
    $userId = $_SESSION['userid'];
    if($userRole == '8' || $userRole == '9'){
      $sql .= ",quality_notify qn where q.id = qn.qualityId and qn.userId = $userId and q.project=p.id " ;
    }else{
      $sql .=" where q.project = p.id";  
    }
    
    if($projectId != -1){
      $sql .= " and p.id = ".$projectId;
    }
    if($customerName != "-1"){
      $sql .=" and p.customer_name = '$customerName' ";
    }
    
    $sql .=" and q.valid = 1";
    
    
    $sel = mysql_query($sql);
    $arrRet = array();
    while($row = mysql_fetch_array($sel)){
      array_push($arrRet,$row);
    }
    return $arrRet;
  }
  
  function update($id,$actionNo,$qualityNo,$issueDate,$productNo,$productDesc,$shipNo,$statusUpdate,$lotQuantity,$sampleSize,$defects,$rejectRate,$quantityInInventory,$quantityInProcess,$containmentDesc,$acknowledgeBy,$acknowledgeDate,$verifiedForClosureBy,$verificationDate,$valid=1){
    $id = (int) $id;
    $actionNo = mysql_escape_string($actionNo);
    $qualityNo = mysql_escape_string($qualityNo);
    $productNo = mysql_escape_string($productNo);
    $productDesc = mysql_escape_string($productDesc);
    $shipNo = mysql_escape_string($shipNo);
    $statusUpdate = mysql_escape_string($statusUpdate);
    $quantityInInventory = mysql_escape_string($quantityInInventory);
    $quantityInProcess = mysql_escape_string($quantityInProcess);
    $containmentDesc = mysql_escape_string($containmentDesc);
    $acknowledgeBy = mysql_escape_string($acknowledgeBy);
    $verifiedForClosureBy = mysql_escape_string($verifiedForClosureBy);
    $actionNo = mysql_escape_string($actionNo);
    $actionNo = mysql_escape_string($actionNo);
    $actionNo = mysql_escape_string($actionNo);
    $actionNo = mysql_escape_string($actionNo);
    $actionNo = mysql_escape_string($actionNo);

    $lotQuantity = (int) $lotQuantity;
    $sampleSize = (int) $sampleSize;
    $defects = (int) $defects;
    $rejectRate = (double) $rejectRate;
    $valid = (int) $valid;

    $sql = "UPDATE `quality`
            SET
            `action_no` = '$actionNo',
            `quality_no` = '$qualityNo',
            `issue_date` = '$issueDate',
            `product_no` = '$productNo',
            `product_desc` = '$productDesc',
            `ship_no` = '$shipNo',
            `status_update` = '$statusUpdate',
            `lot_quantity` = $lotQuantity,
            `Sample_size` = $sampleSize,
            `defects` = $defects,
            `reject_rate` = $rejectRate,
            `quantity_in_inventory` = '$quantityInInventory',
            `quantity_in_process` = '$quantityInProcess',
            `containment_desc` = '$containmentDesc',
            `acknowledge_by` = '$acknowledgeBy',
            `acknowledge_date` = '$acknowledgeDate',
            `verified_for_closure_by` = '$verifiedForClosureBy',
            `verification_date` = '$verificationDate',
            `valid` = $valid
            WHERE  ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }
  
  function clearNotify($qualityId){
    $qualityId = (int) $qualityId;
    $sql = "DELETE FROM `quality_notify`
            WHERE qualityId = $qualityId;";
    $sel = mysql_query($sql);
  }
  
function addNotifyList($qualityId,$userId){
  $qualityId = (int) $qualityId;
  $userId =(int) $userId;
  $sql = "INSERT INTO `quality_notify`
            (
            `qualityId`,
            `userId`)
            VALUES
            (
            $qualityId,
            $userId
            )";
  $ins = mysql_query($sql);
  if($ins){
    return mysql_insert_id();
  }else{
    return false;
  }
  
}
  
function getQualityByProjectId($projectId){
  $projectId = (int) $projectId;
  $sql = "select * from quality where project=$projectId";
  $sel = mysql_query($sql);
  $arr = array();
  while ($row = mysql_fetch_array($sel)) {
    array_push($arr, $row);
  }
  return $arr;
}

function del($id){
    return $this->close($id);
  }
  
  function getNotifyList($id){
    $id = (int) $id;
    $sql = "select * from quality_notify where qualityId = $id";
    $sel = mysql_query($sql);
    $ret = array();
    while($row  = mysql_fetch_array($sel)){
      array_push($ret, $row["userId"]);
    }
    return $ret;
  }
  
  function get($id){
     $id = (int) $id;
    $sql = "select * from  `quality`  where id = '$id'";
    $query = mysql_query($sql);
    $ret = array();
    if(!empty($query)){
      $ret = mysql_fetch_array($query);
    }
    return $ret;
  }
  
}



?>
