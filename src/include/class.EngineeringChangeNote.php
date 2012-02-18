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
  }
  
  function approve($noteId){
    
  }
  
  function reject($noteId){
    
  }
}

?>
