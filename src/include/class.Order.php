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
  function deleteDocuments($orderId,$type=0){
    $sql = "delete from order_attached where orderId = $orderId and type=$type";
    mysql_query($sql);
    
  }
  
  function addQuality($orderId,$qualityIssueNote){
    $orderId =(int) $orderId;
    foreach($qualityIssueNote as $note){
      $note = (int)$note;
      $sql = "
        INSERT INTO `order_qualitys`
        (
        `orderId`,
        `qualityId`
        )
        VALUES
        (
        $orderId,
        $note
        )";
      mysql_query($sql);
    }
  }
  
  function addCompliance($orderId,$compliance){
    $orderId = (int) $orderId;
    foreach($compliance as $c){
      $c = mysql_escape_string($c);
      $sql = "INSERT INTO `order_compliance`
              (
              `orderId`,
              `complianceType`)
              VALUES
              (
              $orderId,
              '$c'
              )";
      mysql_query($sql);
    }
  }
  
  function addECN($orderId,$ECNNote){
    $orderId =(int) $orderId;
    foreach($ECNNote as $note){
      $note = (int)$note;
      $sql = "INSERT INTO `order_ecn`
            (
            `orderId`,
            `ecnId`)
            VALUES
            (
            $orderId,
            $note
            )
            ";
       mysql_query($sql);
    }
  }
  /**
   *
   * @param type $orderId
   * @param type $files
   * @param type $type 0-normal,1-paymentfile1,2-paymentfile2,3-paymentfile3 
   */
  function attachDocument($orderId,$files,$type=0){
    $orderId = (int) $orderId;
    foreach ($files as $fileId){
      $fileId = (int) $fileId;
      $sql = "INSERT INTO `order_attached`
            (
            `orderId`,
            `fileId`,
            `type`)
            VALUES
            (
            $orderId,
            $fileId,
            $type
            )";
      $ins = mysql_query($sql);
    }
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
    $sql = "INSERT INTO `order`
            (name,
            project,
            quantity,
            `desc`,
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
    $sql = "update `order` set status = $status where ID = $id";
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
    $sql = "update `order` set desc='$desc',end_time='$endTime',status=$status,valid=$valid where ID = $id";
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
    $sql = "update `order` set inner_cost_currency='$innercostcurrency',inner_cost=$innercost,external_cost_currency='$externalcostcurrency',external_cost='$externalcost',published='$published',end_time='$endTime',status=$status where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return TRUE;
    }else{
      return FALSE;
    }
  }
  
  
  
  function getOrders($projectId){
    $sql = "select * from `order` where project=$projectId and valid=1";
    $query = mysql_query($sql);
    $arrOrder = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arrOrder, $row);
    }
    return $arrOrder;
  }
  
  function getOrdersByCustomer($projectId,$customerId){
    $sql = "select o.ID,o.name,o.quantity,o.desc,(select u.name from user u where p.customer_leader = u.ID) as customerlead,
     p.customer_name as customerName,
      (select u.name from user u where p.supplier_leader = u.ID) as supplierlead,o.inner_cost,o.inner_cost_currency,
      o.external_cost,o.external_cost_currency,(select value from status s where o.status = s.ID) as status,
      o.status as statusId,o.published,o.customer_po_number,o.jenkins_po_number,
      o.attachment1 as attachmentId1,(select datei from `files` where ID = o.attachment1) as attachment1,(select name from `files` where ID = o.attachment1) as filename1,
      o.attachment2 as attachmentId2,(select datei from `files` where ID = o.attachment2) as attachment2,(select name from `files` where ID = o.attachment2) as filename2,
      o.factory,o.terms,o.account_payment,o.customer_model_number,o.customer_part_number,o.jenkins_model_number,
      o.jenkins_part_number,o.payment_one_schedule,(select value from status s where o.payment_one_status = s.ID) as payment_one_status,o.payment_one_status as payment_one_status_id,
      o.payment_one_attachment as payment_one_attachment_id,(select datei from `files` where ID = o.payment_one_attachment) as payment_one_attachment,(select name from `files` where ID = o.payment_one_attachment) as paymentfilename1, 
      o.payment_two_schedule,
      (select value from status s where o.payment_two_status = s.ID) as payment_two_status,o.payment_two_status as payment_two_status_id,
      o.payment_two_attachment as payment_two_attachment_id,(select datei from `files` where ID = o.payment_two_attachment) as payment_two_attachment,(select name from `files` where ID = o.payment_two_attachment) as paymentfilename2, 
      o.payment_three_schedule,
      o.payment_three_status as payment_three_status_id,(select value from status s where o.payment_three_status = s.ID) as payment_three_status,
      o.payment_three_attachment as payment_three_attachment_id,(select datei from `files` where ID = o.payment_three_attachment) as payment_three_attachment,(select name from `files` where ID = o.payment_three_attachment) as paymentfilename3,
      o.final_total_amount_received,o.delivery_date_one,o.delivery_date_two,
      o.delivery_status_one as delivery_status_one_id,(select value from status s where o.delivery_status_one = s.ID) as delivery_status_one,
      o.delivery_status_two as delivery_status_two_id,(select value from status s where o.delivery_status_two = s.ID) as delivery_status_two from `projekte` p,`order` o  where o.project = p.ID and o.valid = 1 and p.customer_leader = $customerId and o.project=$projectId ";
    $query = mysql_query($sql);
    $arrOrder = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arrOrder, $row);
    }
    return $arrOrder;
  }
  function getOrdersByManager($projectId){
 $sql = "select o.ID,o.name,o.quantity,o.desc,(select u.name from user u where p.customer_leader = u.ID) as customerlead,
     p.customer_name as customerName,
      (select u.name from user u where p.supplier_leader = u.ID) as supplierlead,o.inner_cost,o.inner_cost_currency,
      o.external_cost,o.external_cost_currency,(select value from status s where o.status = s.ID) as status,
      o.status as statusId,o.published,o.customer_po_number,o.jenkins_po_number,
      o.attachment1 as attachmentId1,(select datei from `files` where ID = o.attachment1) as attachment1,(select name from `files` where ID = o.attachment1) as filename1,
      o.attachment2 as attachmentId2,(select datei from `files` where ID = o.attachment2) as attachment2,(select name from `files` where ID = o.attachment2) as filename2,
      o.factory,o.terms,o.account_payment,o.customer_model_number,o.customer_part_number,o.jenkins_model_number,
      o.jenkins_part_number,o.payment_one_schedule,(select value from status s where o.payment_one_status = s.ID) as payment_one_status,o.payment_one_status as payment_one_status_id,
      o.payment_one_attachment as payment_one_attachment_id,(select datei from `files` where ID = o.payment_one_attachment) as payment_one_attachment,(select name from `files` where ID = o.payment_one_attachment) as paymentfilename1, 
      o.payment_two_schedule,
      (select value from status s where o.payment_two_status = s.ID) as payment_two_status,o.payment_two_status as payment_two_status_id,
      o.payment_two_attachment as payment_two_attachment_id,(select datei from `files` where ID = o.payment_two_attachment) as payment_two_attachment,(select name from `files` where ID = o.payment_two_attachment) as paymentfilename2, 
      o.payment_three_schedule,
      o.payment_three_status as payment_three_status_id,(select value from status s where o.payment_three_status = s.ID) as payment_three_status,
      o.payment_three_attachment as payment_three_attachment_id,(select datei from `files` where ID = o.payment_three_attachment) as payment_three_attachment,(select name from `files` where ID = o.payment_three_attachment) as paymentfilename3,
      o.final_total_amount_received,o.delivery_date_one,o.delivery_date_two,
      o.delivery_status_one as delivery_status_one_id,(select value from status s where o.delivery_status_one = s.ID) as delivery_status_one,
      o.delivery_status_two as delivery_status_two_id,(select value from status s where o.delivery_status_two = s.ID) as delivery_status_two from `projekte` p,`order` o  where o.project = p.ID and o.valid = 1 and  o.project=$projectId ";
    $query = mysql_query($sql);
    $arrOrder = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arrOrder, $row);
    }
    return $arrOrder;
  }
  function generateAttachFileStr($data){
    $arrRet = array();
    foreach($data as $d){
      $str = $d['documentId'].":".$d["name"].":".$d["revision"];
      array_push($arrRet,$str);
    }
    $retStr = implode(",", $arrRet);
    return $retStr;
  }
  function get($id){
    $id = (int) $id;
    $sql = "select * from  `order`  where id = '$id'";
    $query = mysql_query($sql);
    $ret = array();
    if(!empty($query)){
      $ret = mysql_fetch_array($query);
      $attachs = $this->getOrderAttachment($ret['ID']);
      $ret['attachedFiles'] = $attachs[0];
      $ret['attachedFilesStr'] = $this->generateAttachFileStr($attachs[0]);
      $ret['paymentfiles1'] = $attachs[1];
      $ret['paymentfiles1Str'] = $this->generateAttachFileStr($attachs[1]);
      $ret['paymentfiles2'] = $attachs[2];
      $ret['paymentfiles2Str'] = $this->generateAttachFileStr($attachs[2]);
      $ret['paymentfiles3'] = $attachs[3];
      $ret['paymentfiles3Str'] = $this->generateAttachFileStr($attachs[3]);
      $ret['compliancefiles'] = $attachs[4];
      $ret['compliancefileStr'] = $this->generateAttachFileStr($attachs[3]);
      $ret['qualities'] = $this->getOrderQualities($ret['ID']);
      $ret['ecns'] = $this->getECNs($ret['ID']);
    }
    return $ret;
  }
  function getECNs($id){
    $id = (int) $id;
    $sql = "select ecn.*,f.datei,di.name as documentName,di.revision,di.id as documentId from engineering_change_note ecn, document_info di, files f where ecn.id = di.ecn and f.id = di.file and ecn.`order` =$id";
    $sel = mysql_query($sql);
    $arrRet = array();
    while($row = mysql_fetch_array($sel)){
      array_push($arrRet,$row);
    }
    return $arrRet;
  }
  function updateOrderQualityNotes($orderId,$orderQualityNotes){
    if(!$orderQualityNotes){
      return;
    }
    $orderId = (int) $orderId;
    foreach($orderQualityNotes as $note){
      $qualityId = (int) $note;
      $sql = "update order_qualitys set isFinish = 1 where orderId = $orderId and qualityId = $qualityId";
      $upd = mysql_query($sql);
    }
  }
  

  function updateOrderECNs($orderId,$orderECNs){
    if(!$orderECNs){
      return;
    }
    $orderId = (int) $orderId;
    foreach($orderECNs as $note){
      $ecnId = (int) $note;
      $sql = "update order_ecn set isFinished = 1 where orderId = $orderId and ecnId = $ecnId";
      $upd = mysql_query($sql);
    }
  }


  function updateOrder($orderId, $orderTime, $orderDesc,
                        $attachment1, $jenkinsPoNumber, $attachment2,$factory,$terms,$accountPayment,
                        $customerModelNumber,$customerPartNumber,$jenkinsModelNumber,$jenkinsPartNumber,
                        $paymentOneSchedule,$paymentOneStatus,$paymentOneAttachment,$paymentTwoSchedule,
                        $paymentTwoStatus,$paymentTwoAttachment,$paymentThreeSchedule,$paymentThreeStatus,
                        $paymentThreeAttachment,$complianceAttachment,$finalTotalAmountReceived,$deliveryDateOne,$deliveryStatus1,
                        $deliveryDateTwo,$deliveryStatus2,$waiverDesc = "",$isFulfilled=-1){
    $id = (int) $orderId;
    $desc = mysql_escape_string($orderDesc);
    $jenkinsPoNumber = mysql_escape_string($jenkinsPoNumber);
    $factory = mysql_escape_string($factory);
    $terms = mysql_escape_string($terms);
    $accountPayment = mysql_escape_string($accountPayment);
    $customerModelNumber = mysql_escape_string($customerModelNumber);
    $customerPartNumber = mysql_escape_string($customerPartNumber);
    $jenkinsModelNumber = mysql_escape_string($jenkinsModelNumber);
    $jenkinsPartNumber = mysql_escape_string($jenkinsPartNumber);
    $paymentOneSchedule = mysql_escape_string($paymentOneSchedule);
    $paymentOneStatus = (int)$paymentOneStatus;
    $paymentTwoSchedule = mysql_escape_string($paymentTwoSchedule);
    $paymentTwoStatus = (int)$paymentTwoStatus;
    $paymentThreeSchedule = mysql_escape_string($paymentThreeSchedule);
    $paymentThreeStatus = (int)$paymentThreeStatus;
    $finalTotalAmountReceived = mysql_escape_string($finalTotalAmountReceived);
    $deliveryDateOne = mysql_escape_string($deliveryDateOne);
    $deliveryDateTwo = mysql_escape_string($deliveryDateTwo);
    $deliveryStatusOne = (int)$deliveryStatus1;
    $deliveryStatusTwo = (int)$deliveryStatus2;
    $waiverDesc = mysql_escape_string($waiverDesc);
    $isFulfilled = (int) $isFulfilled;
    $sql = "update `order` set `desc`='$desc',end_time='$orderTime',jenkins_po_number='$jenkinsPoNumber',
            factory='$factory',terms='$terms',account_payment='$accountPayment',
            customer_model_number='$customerModelNumber',customer_part_number='$customerPartNumber',
            jenkins_model_number='$jenkinsModelNumber',jenkins_part_number='$jenkinsPartNumber',
            payment_one_schedule='$jenkinsPartNumber',payment_one_status=$paymentOneStatus,
            payment_two_schedule='$paymentTwoSchedule',
            payment_two_status=$paymentTwoStatus,
            payment_three_schedule='$paymentThreeSchedule',payment_three_status=$paymentThreeStatus,
            final_total_amount_received='$finalTotalAmountReceived',
            delivery_date_one='$deliveryDateOne',delivery_date_two='$deliveryDateTwo',
            waiverDesc = '$waiverDesc',
            isFulfilled = $isFulfilled,
            delivery_status_one=$deliveryStatusOne,delivery_status_two=$deliveryStatusTwo  where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      if(!empty($attachment1)){
       $this->deleteDocuments($id);
       $this->attachDocument($id, $attachment1);
      }
      if(!empty($paymentOneAttachment)){
        $this->deleteDocuments($id,1);
        $this->attachDocument($id, $paymentOneAttachment,1);
      }
      if(!empty($paymentTwoAttachment)){
        $this->deleteDocuments($id,2);
        $this->attachDocument($id, $paymentTwoAttachment,2);
      }
      if(!empty($paymentThreeAttachment)){
        $this->deleteDocuments($id,3);
        $this->attachDocument($id, $paymentThreeAttachment,3);
      }
      if(!empty($complianceAttachment)){
        $this->deleteDocuments($id,4);
        $this->attachDocument($id, $complianceAttachment,4);
      }
      return TRUE;
    }else{
      return FALSE;
    }
  }
  
  
  function getOrdersByUser(){
     $userRole = $_SESSION['userRole'];
     if($userRole == "7" || $userRole == "9"){
      return array();
     }
     $sql = "select o.ID,o.name,o.quantity,o.desc,(select u.name from user u where p.customer_leader = u.ID) as customerlead,
        p.customer_name as customerName,
      (select u.name from user u where p.supplier_leader = u.ID) as supplierlead,o.inner_cost,o.inner_cost_currency,
      o.external_cost,o.external_cost_currency,(select value from status s where o.status = s.ID) as status,
      o.status as statusId,o.published,o.customer_po_number,o.jenkins_po_number,
      o.factory,o.terms,o.account_payment,o.customer_model_number,o.customer_part_number,o.jenkins_model_number,
      o.jenkins_part_number,o.payment_one_schedule,(select value from status s where o.payment_one_status = s.ID) as payment_one_status,o.payment_one_status as payment_one_status_id,
      o.payment_one_attachment as payment_one_attachment_id,(select datei from `files` where ID = o.payment_one_attachment) as payment_one_attachment,(select name from `files` where ID = o.payment_one_attachment) as paymentfilename1, 
      o.payment_two_schedule,
      (select value from status s where o.payment_two_status = s.ID) as payment_two_status,o.payment_two_status as payment_two_status_id,
      o.payment_two_attachment as payment_two_attachment_id,(select datei from `files` where ID = o.payment_two_attachment) as payment_two_attachment,(select name from `files` where ID = o.payment_two_attachment) as paymentfilename2, 
      o.payment_three_schedule,
      o.payment_three_status as payment_three_status_id,(select value from status s where o.payment_three_status = s.ID) as payment_three_status,
      o.payment_three_attachment as payment_three_attachment_id,(select datei from `files` where ID = o.payment_three_attachment) as payment_three_attachment,(select name from `files` where ID = o.payment_three_attachment) as paymentfilename3,
      o.final_total_amount_received,o.delivery_date_one,o.delivery_date_two,
      o.delivery_status_one as delivery_status_one_id,(select value from status s where o.delivery_status_one = s.ID) as delivery_status_one,
      o.delivery_status_two as delivery_status_two_id,(select value from status s where o.delivery_status_two = s.ID) as delivery_status_two from `projekte` p,`order` o  where o.project = p.ID and o.valid = 1";
    if($userRole == "4" || $userRole == "6" || $userRole == "8"){
      $project = new project();
      $projects = $project->getMyProjectIds($_SESSION['userid']);
      $str = "";
      foreach($projects as $p){
        $str .= $p['ID']+",";
      }
      $str = substr($str,0,-1);
      $str = " and p.id in (".$str.")";
      $sql = $sql.$str;
    }    
    $query = mysql_query($sql);
    $arrOrder = array();
    while ($row = mysql_fetch_array($query)) {
      $attachs = $this->getOrderAttachment($row['ID']);
      $row['attachedFiles'] = $attachs[0];
      $row['attachedFilesStr'] = $this->generateAttachFileStr($attachs[0]);
      $row['paymentfiles1'] = $attachs[1];
      $row['paymentfiles1Str'] = $this->generateAttachFileStr($attachs[1]);
      $row['paymentfiles2'] = $attachs[2];
      $row['paymentfiles2Str'] = $this->generateAttachFileStr($attachs[2]);
      $row['paymentfiles3'] = $attachs[3];
      $row['paymentfiles3Str'] = $this->generateAttachFileStr($attachs[3]);
      array_push($arrOrder, $row);
    }
    return $arrOrder;
  }
  
  function getOrderQualities($orderId){
    $orderId = (int) $orderId;
    $sql = "select * from `quality` where  `order`= $orderId";
    $sel = mysql_query($sql);
    $arrRet = array();
    while ($row = mysql_fetch_array($sel)) {
      array_push($arrRet,$row);
    }
    return $arrRet;
  }
  
  function getOrderTrackedQualities($orderId){
    $orderId = (int) $orderId;
    $sql = "select o.*,q.action_no from order_qualitys o,quality q where o.qualityId = q.id and o.orderId = $orderId";
    $sel = mysql_query($sql);
    $ret = array();
    while($row = mysql_fetch_array($sel)){
      array_push($ret,$row);
    }
    return $ret;
  }
  
  function getOrderTrackedECNs($orderId){
    $orderId = (int) $orderId;
    $sql = "select o.*,ecn.name from order_ecn o, engineering_change_note ecn where o.ecnId = ecn.id and o.orderId = $orderId";
    $sel = mysql_query($sql);
    $ret = array();
    while($row = mysql_fetch_array($sel)){
      array_push($ret,$row);
    }
    return $ret;
  }
  
  function updateOrderCompliances($orderId,$arr){
    $orderId = (int)$orderId;
    $sql = "UPDATE order_compliance set `isFinished` = -1 where orderId = $orderId";
    mysql_query($sql);
    if(!empty($arr)){
      foreach($arr as $cmp){
        $this->updateOrderCompliance($cmp);
    }
    }
  }
  
  function updateOrderCompliance($compId){
    $compId = (int) $compId;
    $sql = "UPDATE `order_compliance`
            SET
            `complianceField` = ''
            ,`isFinished` = 1 
            WHERE ID = $compId";
    $upd = mysql_query($sql);
  }
  
  function getOrderCompliances($orderId){
    $orderId = (int) $orderId;
    $sql = "select * from order_compliance where orderId = $orderId";
    $sel = mysql_query($sql);
    $ret = array();
    while($row = mysql_fetch_array($sel)){
      array_push($ret,$row);
    }
    return $ret;
  }
  
  function getOrderAttachment($orderId){
    $orderId = (int) $orderId;
    $sql = "select oa.orderId,oa.type,f.datei,di.name,di.revision,di.id as documentId from order_attached oa,document_info di,files f where di.Id = oa.fileId and f.id = di.file and oa.orderId = $orderId";
    $sel = mysql_query($sql);
    $arrAttachs = array();
    $arrPay1 = array();
      $arrPay2 = array();
    $arrPay3 = array();
    $arrCompliance = array();
    while ($row = mysql_fetch_array($sel)) {
      switch($row['type']){
        case 1:
          array_push($arrPay1,$row);
          break;
        case 2:
          array_push($arrPay2,$row);
          break;
        case 3:
          array_push($arrPay3,$row);
          break;
        case 4:
          array_push($arrCompliance,$row);
          break;
        default:
          array_push($arrAttachs,$row);
          break;
      }
    }
    $arrRet = array($arrAttachs,$arrPay1,$arrPay2,$arrPay3,$arrCompliance);
    return $arrRet;
  }
  
  function getBaseSql(){
    return  "select o.ID,o.name,o.quantity,o.desc,(select u.name from user u where p.customer_leader = u.ID) as customerlead,
      p.customer_name as customerName,
      (select u.name from user u where p.supplier_leader = u.ID) as supplierlead,o.inner_cost,o.inner_cost_currency,
      o.external_cost,o.external_cost_currency,(select value from status s where o.status = s.ID) as status,
      o.status as statusId,o.published,o.customer_po_number,o.jenkins_po_number,
      o.factory,o.terms,o.account_payment,o.customer_model_number,o.customer_part_number,o.jenkins_model_number,
      o.jenkins_part_number,o.payment_one_schedule,(select value from status s where o.payment_one_status = s.ID) as payment_one_status,o.payment_one_status as payment_one_status_id,
      o.payment_one_attachment as payment_one_attachment_id,(select datei from `files` where ID = o.payment_one_attachment) as payment_one_attachment,(select name from `files` where ID = o.payment_one_attachment) as paymentfilename1, 
      o.payment_two_schedule,
      (select value from status s where o.payment_two_status = s.ID) as payment_two_status,o.payment_two_status as payment_two_status_id,
      o.payment_two_attachment as payment_two_attachment_id,(select datei from `files` where ID = o.payment_two_attachment) as payment_two_attachment,(select name from `files` where ID = o.payment_two_attachment) as paymentfilename2, 
      o.payment_three_schedule,
      o.payment_three_status as payment_three_status_id,(select value from status s where o.payment_three_status = s.ID) as payment_three_status,
      o.payment_three_attachment as payment_three_attachment_id,(select datei from `files` where ID = o.payment_three_attachment) as payment_three_attachment,(select name from `files` where ID = o.payment_three_attachment) as paymentfilename3,
      o.final_total_amount_received,o.delivery_date_one,o.delivery_date_two,
      o.delivery_status_one as delivery_status_one_id,(select value from status s where o.delivery_status_one = s.ID) as delivery_status_one,
      o.delivery_status_two as delivery_status_two_id,(select value from status s where o.delivery_status_two = s.ID) as delivery_status_two from `projekte` p,`order` o  where o.project = p.ID and o.valid = 1";
  }
  
  function filterOrder($projectId,$orderId,$customer){
     $userRole = $_SESSION['userRole'];
     if($userRole == "7" || $userRole == "9"){
      return array();
     }
     $projectId = (int) $projectId;
     $orderId = (int) $orderId;
     $customer = mysql_escape_string($customer);
     $sql = $this->getBaseSql();
    if($projectId != -1){
      $str = " and p.id = $projectId";
      $sql = $sql.$str;
    }else{
      if($userRole == "4" || $userRole == "6" || $userRole == "8"){
        $project = new project();
        $projects = $project->getMyProjectIds($_SESSION['userid']);
        $str = "";
        foreach($projects as $p){
          $str .= $p['ID']+",";
        }
        $str = substr($str,0,-1);
        $str = " and p.id in (".$str.")";
        $sql = $sql.$str;
      }
    }
    if($orderId != -1){
      $str = " and o.id = $orderId";
      $sql = $sql.$str;
    }
    
    if($customer != "-1"){
      $str = " and p.customer_name = '$customer'";
      $sql = $sql.$str;
    }
    
    $query = mysql_query($sql);
    $arrOrder = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arrOrder, $row);
    }
    return $arrOrder;
  }
  
  
  
  
}

?>
