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
  
  function add($submitter,$comments){
    $sql = "INSERT INTO `sample_request`
            (
            `approved`,
            `submit_time`,
            `submit_by`,
            `submitter_comments`)
            VALUES
            (
            0,
            NOW(),
            $submitter,
            '$comments'
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
  
}

?>
