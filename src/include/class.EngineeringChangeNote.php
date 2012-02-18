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
  
  function add($submitterComments,$projectId,$phaseId,$deliverableItemId){
    $submitter = getArrayVal($_SESSION, 'userid');
    $submitterTime = time();
    $submitterComments = mysql_real_escape_string($submitterComments);
    $projectId = (int) $projectId;
    $phaseId = (int) $phaseId;
    $deliverableItemId = (int) $deliverableItemId;
    $submit_time = new DateTime();
    $ins = mysql_query("insert into engineering_change_note (status,submitter,submit_time,submitter_comments,project,phase,deliverable) values(1,'$submitter',NOW(),'$submitterComments',$projectId,$phaseId,$deliverableItemId )");
    if($ins){
      return mysql_insert_id();
    }else{
      return FALSE;
    }
  }
  
  function approve($id,$approverId,$approverComments){
    $id = (int) $id;
    if(!$approverId){
      $approverId = $_SESSION['userid'];
    }
    $approverId = (int) $approverId;
    $upd = mysql_query("update engineering_change_note set `approver`='$approverId',`approve_time`=NOW(),`approve_comments`='$approverComments' where `id`=$id");
  }
  
  function reject($noteId){
    
  }
}

?>
