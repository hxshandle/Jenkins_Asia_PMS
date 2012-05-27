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
  
  function add($project,$actionNo,$issueDate,$productNo,$productDesc,$shipNo,$lotQuantity,$sampleSize,$defects,$rejectRate,$quantityInInventory,$quantityInProcess,$containmentDesc,$acknowledgeBy,$acknowledgeDate,$verifiedForClosureBy,$verificationDate,$valid=1){
    $actionNo = mysql_escape_string($actionNo);
    $productNo = mysql_escape_string($productNo);
    $productDesc = mysql_escape_string($productDesc);
    $shipNo = mysql_escape_string($shipNo);
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

    $sql = "
            INSERT INTO `quality`
            (
            `action_no`,
            `issue_date`,
            `product_no`,
            `product_desc`,
            `ship_no`,
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
            `project`)
            VALUES
            (
            '$actionNo',
            '$issueDate',
            '$productNo',
            '$productDesc',
            '$shipNo',
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
            $project
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
    $sql = "update `quality` set `status` = $status where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }
  
  function update($id,$actionNo,$issueDate,$productNo,$productDesc,$shipNo,$lotQuantity,$sampleSize,$defects,$rejectRate,$quantityInInventory,$quantityInProcess,$containmentDesc,$acknowledgeBy,$acknowledgeDate,$verifiedForClosureBy,$verificationDate,$valid=1){
    $id = (int) $id;
    $actionNo = mysql_escape_string($actionNo);
    $productNo = mysql_escape_string($productNo);
    $productDesc = mysql_escape_string($productDesc);
    $shipNo = mysql_escape_string($shipNo);
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
            `issue_date` = '$issueDate',
            `product_no` = '$productNo'},
            `product_desc` = '$productDesc',
            `ship_no` = '$shipNo',
            `lot_quantity` = lotQuantity,
            `Sample_size` = sampleSize,
            `defects` = defects,
            `reject_rate` = rejectRate,
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
}



?>
