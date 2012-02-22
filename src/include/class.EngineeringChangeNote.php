<?php

  require_once 'class.mylog.php';
  require_once 'class.status.php';
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
  
  function add($submitterComments,$projectId,$phaseId,$deliverableItemId){
    $submitter = getArrayVal($_SESSION, 'userid');
    $submitterComments = mysql_real_escape_string($submitterComments);
    $projectId = (int) $projectId;
    $phaseId = (int) $phaseId;
    $deliverableItemId = (int) $deliverableItemId;
    $status = Status::getId("ECN", "need_approve");
    $sql = "insert into engineering_change_note (status,submitter,submit_time,submitter_comments,project,phase,deliverable) values($status,'$submitter',NOW(),'$submitterComments',$projectId,$phaseId,$deliverableItemId )";
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
}

?>
