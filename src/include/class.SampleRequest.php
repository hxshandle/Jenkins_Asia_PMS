<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of SampleRequest
 *
 * @author huanghandle
 */
class SampleRequest {
  //put your code here
  private $myLog;
  
  function __construct() {
    $this->myLog = new mylog;
  }
  
  function add($submitter,$comments,$project,$sample){
    $sql = "INSERT INTO `sample_request`
            (
            `approved`,
            `submit_time`,
            `submit_by`,
            `submitter_comments`,
            `project`,
            `sample`)
            VALUES
            (
            25,
            NOW(),
            $submitter,
            '$comments',
            $project,
            $sample  
            );
            ";
    $ins = mysql_query($sql);
    if($ins){
      return mysql_insert_id();
    }else{
      return false;
    }
    
  }
  
  
  function approve($id,$approver,$approveComments){
    $status = Status::getId("sampleRequest", "approved");
    $approveComments = mysql_escape_string($approveComments);
    $sql = "update `sample_request` set `approved` = $status, `approved_by`=$approver,`approved_time`=NOW(),`approver_comments`='$approveComments' where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }
  
  function reject($id,$approver,$approveComments){
    $status = Status::getId("sampleRequest", "rejected");
    $approveComments = mysql_escape_string($approveComments);
    $sql = "update `sample_request` set `approved` = $status, `approved_by`=$approver,`approved_time`=NOW(),`approver_comments`='$approveComments' where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }
  function getSampleRequestDetailsByProjectId($id,$currentUserId){
    $sampleRequests = $this->getSampleRequestByProjectId($id,$currentUserId);
    $ret = array();
    foreach ($sampleRequests as $sampleRequest) {
      array_push($ret, $sampleRequest);
    }
    return $ret;
  }
  
  function getSampleRequestByProjectId($projectId,$currentUserId){
    $projectId = (int) $projectId;
    if($currentUserId!=null){
      $sql = "select t.ID,t.submitter_comments,t.approved as approveId,(select e.value from `status` e where t.approved = e.ID) as approved,(select g.name from `user` g where g.ID= t.submit_by) as submit_by,t.submit_time,f.name as samplename,d.name as projectname from `sample_request` t,`sample` f,`projekte` d  where t.project = $projectId  and `submit_by` = $currentUserId and t.sample = f.ID and d.ID = t.project and t.isretrieve = 1";
    }else{
      $sql = "select  t.ID,t.submitter_comments,t.approved as approveId,(select e.value from `status` e where t.approved = e.ID) as approved,(select g.name from `user` g where g.ID= t.submit_by) as submit_by,t.submit_time,f.name as samplename,d.name as projectname from `sample_request` t,`sample` f,`projekte` d where t.project = $projectId and t.sample = f.ID and d.ID = t.project and t.isretrieve = 1";
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
    $sql = "select * from sample_request where `id` = '$id'";
    $query = mysql_query($sql);
    $ret = array();
    if(!empty($query)){
      $ret = mysql_fetch_array($query);
    }
    return $ret;
  }
  
    function retrive($id){
    $sql = "update `sample_request` set isretrieve = 0 where ID = $id";
    $retrive = mysql_query($sql);
    if($retrive){
      return true;
    }else{
      return false;
    }
  } 
}

?>
