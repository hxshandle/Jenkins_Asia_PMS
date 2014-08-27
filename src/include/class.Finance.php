<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Finance
 *
 * @author huanghandle
 */
class Finance{
  //put your code here
  private $myLog;
  
  function __construct() {
    $this->myLog = new mylog;
  }
  
  function get($id){
    $id = (int) $id;
    $sql = "select * from finance2 where `id` = '$id'";
    $query = mysql_query($sql);
    $ret = array();
    if(!empty($query)){
      $ret = mysql_fetch_array($query);
    }
    return $ret;
  }
  
  function add($projectId,$incoming_payment_amount,$incoming_payment_amount_currency,$customer_source,$outgoing_payment_amount,$outgoing_payment_amount_currency,$beneficiary,$project_number,$PO_number,$invoice_number,$reason,$planned_incoming_payment_date,$actual_incoming_payment_date,$difference1,$incoming_payment_status,$actual_incoming_payment_amount_received,$planned_outgoing_payment_date,$actual_outgoing_payment_date,$difference2,$outgoing_payment_status,$actual_outgoing_payment_amount_paid){
    $projectId = (int)$projectId; 
    $incoming_payment_amount = (int)$incoming_payment_amount; 
    $incoming_payment_amount_currency = mysql_escape_string($incoming_payment_amount_currency); 
    $customer_source = mysql_escape_string($customer_source); 
    $outgoing_payment_amount = (int)$outgoing_payment_amount; 
    $outgoing_payment_amount_currency = mysql_escape_string($outgoing_payment_amount_currency); 
    $beneficiary = mysql_escape_string($beneficiary); 
    $project_number = mysql_escape_string($project_number); 
    $PO_number = mysql_escape_string($PO_number); 
    $invoice_number = mysql_escape_string($invoice_number); 
    $reason = mysql_escape_string($reason); 
    $planned_incoming_payment_date = mysql_escape_string($planned_incoming_payment_date); 
    $actual_incoming_payment_date = mysql_escape_string($actual_incoming_payment_date); 
    $difference1 = mysql_escape_string($difference1);
    //status
    $incoming_payment_status = (int)$incoming_payment_status; 
    $actual_incoming_payment_amount_received = (int)$actual_incoming_payment_amount_received; 
    $planned_outgoing_payment_date = mysql_escape_string($planned_outgoing_payment_date); 
    $actual_outgoing_payment_date = mysql_escape_string($actual_outgoing_payment_date); 
    $difference2 = mysql_escape_string($difference2); 
    $outgoing_payment_status = (int)$outgoing_payment_status; 
    $actual_outgoing_payment_amount_paid = (int)$actual_outgoing_payment_amount_paid;
    $sql="INSERT INTO `finance2`
          (
          `project`,
          `incoming_payment_amount`,
          `incoming_payment_amount_currency`,
          `customer_source`,
          `outgoing_payment_amount`,
          `outgoing_payment_amount_currency`,
          `beneficiary`,
          `project_number`,
          `PO_number`,
          `invoice_number`,
          `reason`,
          `planned_incoming_payment_date`,
          `actual_incoming_payment_date`,
          `difference1`,
          `incoming_payment_status`,
          `actual_incoming_payment_amount_received`,
          `planned_outgoing_payment_date`,
          `actual_outgoing_payment_date`,
          `difference2`,
          `outgoing_payment_status`,
          `actual_outgoing_payment_amount_paid`)
          VALUES
          (
          $projectId,
          $incoming_payment_amount,
          '$incoming_payment_amount_currency',
          '$customer_source',
          $outgoing_payment_amount,
          '$outgoing_payment_amount_currency',
          '$beneficiary',
          '$project_number',
          '$PO_number',
          '$invoice_number',
          '$reason',
          '$planned_incoming_payment_date',
          '$actual_incoming_payment_date',
          '$difference1',
          $incoming_payment_status,
          $actual_incoming_payment_amount_received,
          '$planned_outgoing_payment_date',
          '$actual_outgoing_payment_date',
          '$difference2',
          $outgoing_payment_status,
          $actual_outgoing_payment_amount_paid
          )";
    $ins = mysql_query($sql);
    if($ins){
      $id = mysql_insert_id();
      return $id;
    }else{
      return FALSE;
    }
    
  }
  
  function update($id,$incoming_payment_amount,$incoming_payment_amount_currency,$customer_source,$outgoing_payment_amount,$outgoing_payment_amount_currency,$beneficiary,$project_number,$PO_number,$invoice_number,$reason,$planned_incoming_payment_date,$actual_incoming_payment_date,$difference1,$incoming_payment_status,$actual_incoming_payment_amount_received,$planned_outgoing_payment_date,$actual_outgoing_payment_date,$difference2,$outgoing_payment_status,$actual_outgoing_payment_amount_paid){
    $id = (int)$id; 
    $incoming_payment_amount = (int)$incoming_payment_amount; 
    $incoming_payment_amount_currency = mysql_escape_string($incoming_payment_amount_currency); 
    $customer_source = mysql_escape_string($customer_source); 
    $outgoing_payment_amount = (int)$outgoing_payment_amount; 
    $outgoing_payment_amount_currency = mysql_escape_string($outgoing_payment_amount_currency); 
    $beneficiary = mysql_escape_string($beneficiary); 
    $project_number = mysql_escape_string($project_number); 
    $PO_number = mysql_escape_string($PO_number); 
    $invoice_number = mysql_escape_string($invoice_number); 
    $reason = mysql_escape_string($reason); 
    $planned_incoming_payment_date = mysql_escape_string($planned_incoming_payment_date); 
    $actual_incoming_payment_date = mysql_escape_string($actual_incoming_payment_date); 
    $difference1 = mysql_escape_string($difference1);
    //status
    $incoming_payment_status = (int)$incoming_payment_status; 
    $actual_incoming_payment_amount_received = (int)$actual_incoming_payment_amount_received; 
    $planned_outgoing_payment_date = mysql_escape_string($planned_outgoing_payment_date); 
    $actual_outgoing_payment_date = mysql_escape_string($actual_outgoing_payment_date); 
    $difference2 = mysql_escape_string($difference2); 
    $outgoing_payment_status = (int)$outgoing_payment_status; 
    $actual_outgoing_payment_amount_paid = (int)$actual_outgoing_payment_amount_paid;
    $sql="UPDATE `finance2`
            SET
            `incoming_payment_amount` = $incoming_payment_amount,
            `incoming_payment_amount_currency` = '$incoming_payment_amount_currency',
            `customer_source` = '$customer_source',
            `outgoing_payment_amount` = $outgoing_payment_amount,
            `outgoing_payment_amount_currency` = '$outgoing_payment_amount_currency',
            `beneficiary` = '$beneficiary',
            `project_number` = '$project_number',
            `PO_number` = '$PO_number',
            `invoice_number` = '$invoice_number',
            `reason` = '$reason',
            `planned_incoming_payment_date` = '$planned_incoming_payment_date',
            `actual_incoming_payment_date` = '$actual_incoming_payment_date',
            `difference1` = '$difference1',
            `incoming_payment_status` = $incoming_payment_status,
            `actual_incoming_payment_amount_received` = $actual_incoming_payment_amount_received,
            `planned_outgoing_payment_date` = '$planned_outgoing_payment_date',
            `actual_outgoing_payment_date` = '$actual_outgoing_payment_date',
            `difference2` = '$difference2',
            `outgoing_payment_status` = $outgoing_payment_status,
            `actual_outgoing_payment_amount_paid` = $actual_outgoing_payment_amount_paid 
            WHERE ID= $id";
    $upd = mysql_query($sql);
    if($upd){
      return TRUE;
    }else{
      return FALSE;
    }
  }
   function getFinanceDetailsByProjectId($id){
    $finances = $this->getFinanceByProjectId($id);
    $ret = array();
    foreach ($finances as $finance) {
      array_push($ret, $finance);
    }
    return $ret;
  }
  
  function getFinanceByProjectId($projectId){
    $projectId = (int) $projectId;
    $sql = "select * from `finance2` where `project` = $projectId";
    $query = mysql_query($sql);
    $arr = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arr, $row);
    }
    return $arr;
  }
  function del($id){
    $sql = "update `finance` set valid = 0 where ID = $id";
    $del = mysql_query($sql);
    if($del){
      return true;
    }else{
      return false;
    }
  }
}

?>
