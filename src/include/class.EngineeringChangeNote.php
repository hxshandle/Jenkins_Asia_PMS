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

  function add($name,$submitterComments,$projectId,$phaseId,$deliverableItemId){
    $submitter = getArrayVal($_SESSION, 'userid');
    $submitterComments = mysql_real_escape_string($submitterComments);
    $projectId = (int) $projectId;
    $phaseId = (int) $phaseId;
    $deliverableItemId = (int) $deliverableItemId;
    $status = Status::getId("ECN", "need_approve");
    $sql = "insert into engineering_change_note (name,status,submitter,submit_time,submitter_comments,project,phase,deliverable) values('$name',$status,'$submitter',NOW(),'$submitterComments',$projectId,$phaseId,$deliverableItemId )";
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
  
  function getEcnsByProjectId($id,$currentUserId){
    $ecns = $this->getEcnByProjectId($id,$currentUserId);
    $ret = array();
    foreach ($ecns as $ecn) {
      array_push($ret, $ecn);
    }
    return $ret;
  }
  
  function getEcnByProjectId($projectId,$currentUserId){
    $projectId = (int) $projectId;
    if($currentUserId!=null){
      $sql = "select t.ID,t.name,t.status as approveId,(select e.value from `status` e where t.status = e.ID) as approved,(select g.name from `user` g where g.ID= t.submitter) as submit_by,t.submit_time,d.name as projectname from `engineering_change_note` t,`projekte` d  where t.project = $projectId  and `submitter` = $currentUserId  and d.ID = t.project ";  
    }else{
      $sql = "select t.ID,t.name,t.status as approveId,(select e.value from `status` e where t.status = e.ID) as approved,(select g.name from `user` g where g.ID= t.submitter) as submit_by,t.submit_time,d.name as projectname from `engineering_change_note` t,`projekte` d where t.project = $projectId  and d.ID = t.project and t.isretrieve = 1";  
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
    }
    return $ret;
  }
  
}

?>
