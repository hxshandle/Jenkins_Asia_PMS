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
  
  function add($name,$project,$quantity,$desc,$endTime,$status,$customerPoNumber,$attachment1,$deliveryDateOne,$deliveryDateTwo,$valid=1){
    $project = (int) $project;
    $quantity = (int) $quantity;
    $name = mysql_escape_string($name);
    $desc = mysql_escape_string($desc);
    $customerPoNumber = mysql_escape_string($customerPoNumber);
    $attachment1 = mysql_escape_string($attachment1);
    $deliveryDateOne = mysql_escape_string($deliveryDateOne);
    $deliveryDateTwo = mysql_escape_string($deliveryDateTwo);
    $sql = "INSERT INTO order
            (name,
            project,
            quantity,
            desc,
            submit_time,
            end_time,
            status,
            valid,
            customer_po_number,
            attachment1,
            delivery_date_one,
            delivery_date_two)
            VALUES
            (
            '$name',
            $project,
            $quantity,
            '$desc',
            NOW(),
            '$endTime',
            $status,
            $valid,
            '$customerPoNumber',
            '$attachment1',
            '$deliveryDateOne',
            '$deliveryDateTwo');";
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
    $sql = "update order set desc='$desc',end_time='$endTime',status=$status,valid=$valid where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return TRUE;
    }else{
      return FALSE;
    }
  }
  
 function updatePrice($id,$endTime,$innercost,$innercostcurrency,$externalcost,$externalcostcurrency,$published){
    $status = Status::getId("order", "submitted");
    if($published==1){
      $status= Status::getId("order", "in_progress");
    }
    $id = (int) $id;
    $desc = mysql_escape_string($desc);
    $sql = "update order set inner_cost_currency='$innercostcurrency',inner_cost=$innercost,external_cost_currency='$externalcostcurrency',external_cost='$externalcost',published='$published',end_time='$endTime',status=$status where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return TRUE;
    }else{
      return FALSE;
    }
  }
  
  
  
  function getOrders($projectId){
    $sql = "select * from order where project=$projectId and valid=1";
    $query = mysql_query($sql);
    $arrOrder = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arrOrder, $row);
    }
    return $arrOrder;
  }
  
  function getOrdersByCustomer($projectId,$customerId){
    $sql = "select o.ID,o.name,o.quantity,(select u.name from user u where p.customer_leader = u.ID) as customerlead,
      (select u.name from user u where p.supplier_leader = u.ID) as supplierlead,o.inner_cost,o.inner_cost_currency,
      o.external_cost,o.external_cost_currency,(select value from status s where o.status = s.ID) as status,
      o.status as statusId,o.published,o.customer_po_number,o.attachment1,o.jenkins_po_number,o.attachment2,
      o.factory,o.terms,o.account_payment,o.customer_model_number,o.customer_part_number,o.jenkins_model_number,
      o.jenkins_part_number,o.payment_one_schedule,o.payment_one_status,o.payment_one_attachment,o.payment_two_schedule,
      o.payment_two_status,o.payment_two_attachment,o.payment_three_schedule,o.payment_three_status,
      o.payment_three_attachment,o.final_total_amount_received,o.delivery_date_one,o.delivery_date_two,o.delivery_status_one,
      o.delivery_status_two from `projekte` p,`order` o  where o.project = p.ID and o.valid = 1 and p.customer_leader = $customerId and o.project=$projectId ";
    $query = mysql_query($sql);
    $arrOrder = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arrOrder, $row);
    }
    return $arrOrder;
  }
  function getOrdersByManager($projectId){
    $sql = "select o.ID,o.name,o.quantity,(select u.name from user u where p.customer_leader = u.ID) as customerlead,
      (select u.name from user u where p.supplier_leader = u.ID) as supplierlead,o.inner_cost,o.inner_cost_currency,
      o.external_cost,o.external_cost_currency,(select value from status s where o.status = s.ID) as status,
      o.status as statusId,o.customer_po_number,o.attachment1,o.jenkins_po_number,o.attachment2,
      o.factory,o.terms,o.account_payment,o.customer_model_number,o.customer_part_number,o.jenkins_model_number,
      o.jenkins_part_number,o.payment_one_schedule,o.payment_one_status,o.payment_one_attachment,o.payment_two_schedule,
      o.payment_two_status,o.payment_two_attachment,o.payment_three_schedule,o.payment_three_status,
      o.payment_three_attachment,o.final_total_amount_received,o.delivery_date_one,o.delivery_date_two,o.delivery_status_one,
      o.delivery_status_two from `projekte` p,`order` o where o.project = p.ID and o.valid = 1 and  o.project=$projectId ";
    $query = mysql_query($sql);
    $arrOrder = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arrOrder, $row);
    }
    return $arrOrder;
  }
  
  function get($id){
    $id = (int) $id;
    $sql = "select * from  order  where id = '$id'";
    $query = mysql_query($sql);
    $ret = array();
    if(!empty($query)){
      $ret = mysql_fetch_array($query);
    }
    return $ret;
  }
  function updateOrder($orderId, $orderTime, $orderDesc,
                        $attachment1, $jenkinsPoNumber, $attachment2,$factory,$terms,$accountPayment,
                        $customerModelNumber,$customerPartNumber,$jenkinsModelNumber,$jenkinsPartNumber,
                        $paymentOneSchedule,$paymentOneStatus,$paymentOneAttachment,$paymentTwoSchedule,
                        $paymentTwoStatus,$paymentTwoAttachment,$paymentThreeSchedule,$paymentThreeStatus,
                        $paymentThreeAttachment,$finalTotalAmountReceived,$deliveryDateOne,$deliveryStatus1,
                        $deliveryDateTwo,$deliveryStatus2){
    $id = (int) $orderId;
    $desc = mysql_escape_string($orderDesc);
    $attachment1 = mysql_escape_string($attachment1);
    $jenkinsPoNumber = mysql_escape_string($jenkinsPoNumber);
    $attachment2 = mysql_escape_string($attachment2);
    $factory = mysql_escape_string($factory);
    $terms = mysql_escape_string($terms);
    $accountPayment = mysql_escape_string($accountPayment);
    $customerModelNumber = mysql_escape_string($customerModelNumber);
    $customerPartNumber = mysql_escape_string($customerPartNumber);
    $jenkinsModelNumber = mysql_escape_string($jenkinsModelNumber);
    $jenkinsPartNumber = mysql_escape_string($jenkinsPartNumber);
    $paymentOneSchedule = mysql_escape_string($paymentOneSchedule);
    $paymentOneStatus = (int)$paymentOneStatus;
    $paymentOneAttachment = mysql_escape_string($paymentOneAttachment);
    $paymentTwoSchedule = mysql_escape_string($paymentTwoSchedule);
    $paymentTwoStatus = (int)$paymentTwoStatus;
    $paymentTwoAttachment = mysql_escape_string($paymentTwoAttachment);
    $paymentThreeSchedule = mysql_escape_string($paymentThreeSchedule);
    $paymentThreeStatus = (int)$paymentThreeStatus;
    $paymentThreeAttachment = mysql_escape_string($paymentThreeAttachment);
    $finalTotalAmountReceived = mysql_escape_string($finalTotalAmountReceived);
    $deliveryDateOne = mysql_escape_string($deliveryDateOne);
    $deliveryDateTwo = mysql_escape_string($deliveryDateTwo);
    $deliveryStatusOne = (int)$deliveryStatus1;
    $deliveryStatusTwo = (int)$deliveryStatus2;
    $sql = "update order set desc='$desc',attachment1='$attachment1',end_time='$orderTime',jenkins_po_number='$jenkinsPoNumber',
            attachment2='$attachment2',factory='$factory',terms='$terms',account_payment='$accountPayment',
            customer_model_number='$customerModelNumber',customer_part_number='$customerPartNumber',
            jenkins_model_number='$jenkinsModelNumber',jenkins_part_number='$jenkinsPartNumber',
            payment_one_schedule='$jenkinsPartNumber',payment_one_status=$paymentOneStatus,
            payment_one_attachment='$paymentOneAttachment',payment_two_schedule='$paymentTwoSchedule',
            payment_two_status=$paymentTwoStatus,payment_two_attachment='$paymentTwoAttachment',
            payment_three_schedule='$paymentThreeSchedule',payment_three_status=$paymentThreeStatus,
            payment_three_attachment='$paymentThreeAttachment',final_total_amount_received='$finalTotalAmountReceived',
            delivery_date_one='$deliveryDateOne',delivery_date_two='$deliveryDateTwo',
            delivery_status_one=$deliveryStatusOne,delivery_status_two=$deliveryStatusTwo where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return TRUE;
    }else{
      return FALSE;
    }
  }
  
  
  
  
  
}

?>
