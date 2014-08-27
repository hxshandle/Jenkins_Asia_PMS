<?php

  require_once 'class.mylog.php';
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of EngineeringChangeNote
 *
 * @author huanghandle
 */
class EngineeringChangeNote {
  //put your code here
  private $myLog;
  
  function __construct() {
    $this->myLog = new mylog;
  }
  
  function filterECN($projectId,$orderId,$customerName){
    $projectId = (int) $projectId;
    $orderId = (int) $orderId;
    $customerName = mysql_escape_string($customerName);
    $sql = "select ecn.* from engineering_change_note ecn, projekte p where p.id = ecn.project ";
    if($projectId != -1){
      $str = " and p.id = $projectId";
      $sql = $sql.$str;
    }
    if($orderId != -1){
       $str = " and ecn.order = $orderId";
      $sql = $sql.$str;
    }
    if($customerName != "-1"){
      $str = " and p.customer_name = '$customerName'";
      $sql = $sql.$str;
    }
    $sel = mysql_query($sql);
    $arrRet = array();
    while($row = mysql_fetch_array($sel)){
      $data = $this->get($row['ID']);
      array_push($arrRet,$data);
    }
    return $arrRet;
    
    
  }

  function add($name,$submitterComments,$projectId,$phaseId,$deliverableItemId,$orderId=-1,$qualityId=-1){
    $submitter = getArrayVal($_SESSION, 'userid');
    $submitterComments = mysql_real_escape_string($submitterComments);
    $projectId = (int) $projectId;
    $phaseId = (int) $phaseId;
    $deliverableItemId = (int) $deliverableItemId;
    $orderId = (int) $orderId;
    $qualityId = (int) $qualityId;
    $status = Status::getId("ECN", "need_approve");
    $sql = "insert into engineering_change_note (name,status,submitter,submit_time,submitter_comments,project,phase,deliverable,`order`,quality) values('$name',$status,'$submitter',NOW(),'$submitterComments',$projectId,$phaseId,$deliverableItemId,$orderId,$qualityId )";
    $ins = mysql_query($sql);
    if($ins){
      return mysql_insert_id();
    }else{
      
      return FALSE;
    }
  }
  
  function update($id,$approverId,$approverComments,$isApprove){
    $id = (int) $id;
    if(!$approverId){
      $approverId = $_SESSION['userid'];
    }
    $approverId = (int) $approverId;
    $st = $isApprove ==TRUE ? "approved" : "rejected";
    $status = Status::getId("ECN", $st);
    $upd = mysql_query("update engineering_change_note set `status`=$status,`approver`=$approverId,`approve_time`=NOW(),`approver_comments`='$approverComments' where `id`=$id");
    if($upd){
      return TRUE;
    }else{
      return FALSE;
    }
  }
  
  function approve($id,$approverId,$approverComments){
    return $this->update($id, $approverId, $approverComments, true);
  }
  
  function reject($id,$approverId,$approverComments){
    return $this->update($id, $approverId, $approverComments, false);
 
  }
  
  
  function getEncs(){
    $jUtil = new JUtils();
    $sql = "select * from engineering_change_note where 1=1 ";
    $jUtil = new JUtils();
    $projectCondition = $jUtil->getMyProjectSqlCondition("", "project");
    $sql .= $projectCondition;
    $sel = mysql_query($sql);
    $arrRet = array();
    while($row = mysql_fetch_array($sel)){
      $data = $this->get($row['ID']);
      array_push($arrRet,$data);
    }
    return $arrRet;
  }
  
  function getEcnsByProjectId2($id,$currentUserId){
    $ecns = $this->getEcnByProjectId($id,$currentUserId);
    $ret = array();
    foreach ($ecns as $ecn) {
      array_push($ret, $ecn);
    }
    return $ret;
  }
  
  function getEcnsByProjectId($id){
    $id = (int) $id;
    $ret = array();
    $sql = "select * from engineering_change_note where project=$id";
    $sel = mysql_query($sql);
    while($row = mysql_fetch_array($sel)){
      array_push($ret, $row);
    }
    return $ret;
  }
  
  function getEcnByProjectId($projectId,$currentUserId){
    $projectId = (int) $projectId;
    if($currentUserId!=null){
      $sql = "select t.ID,t.name,t.status as approveId,(select e.value from `status` e where t.status = e.ID) as approved,(select g.name from `user` g where g.ID= t.submitter) as submit_by,t.submit_time,d.name as projectname from `engineering_change_note` t,`projekte` d  where t.project = $projectId  and `submitter` = $currentUserId  and d.ID = t.project ";  
    }else{
      $sql = "select t.ID,t.name,t.status as approveId,(select e.value from `status` e where t.status = e.ID) as approved,(select g.name from `user` g where g.ID= t.submitter) as submit_by,t.submit_time,d.name as projectname from `engineering_change_note` t,`projekte` d where t.project = $projectId  and d.ID = t.project";  
    }
    $query = mysql_query($sql);
    $arr = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arr, $row);
    }
    return $arr;
  }
  
  function get($id){
    $id = (int) $id;
    $sql = "select * from engineering_change_note where `id` = '$id'";
    $query = mysql_query($sql);
    $ret = array();
    if(!empty($query)){
      $ret = mysql_fetch_array($query);
      if($ret){
        $project = new project();
        $p = $project->getProject($ret['project']);
        $ret['projectName'] = $p['name'];
        if(!empty($ret['order'])){
          $order = new Order();
          $o = $order->get($ret['order']);
          $ret['orderName'] = $o['name'];
        }else{
          $ret['orderName'] = "";
        }
        if(!empty($ret['quality'])){
          $quality = new Quality();
          $q = $quality->get($ret['quality']);
          $ret['qualityName'] = $q['action_no'];
        }else{
          $ret['qualityName'] ="";
        }
        $user = new user();
        $userName = $user->getName($ret['submitter']);
        $ret['submit_by'] = $userName;
        $approver = $user->getName($ret['approver']);
        $ret['approve_by'] = $approver;
      }
    }
    return $ret;
  }
  
}

?>
