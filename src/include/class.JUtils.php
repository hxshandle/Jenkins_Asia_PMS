<?php
class JUtils{

  function updateProjectRealDateByDeliverDate($projectId,$strLastEndDate){
    $project = new Project();
    $pro = $project->getProject($projectId);
    $proEndDate = strtotime($pro["end_date"]);
    $proRealEndDate = $pro["read_end_date"];
    $deliverLastEndDate = strtotime($strLastEndDate);
    if($deliverLastEndDate > $proRealEndDate){
      $project->updateRealEndDate($projectId,$strLastEndDate);
    }
  }

  function updateDeliverItemEndDate($deliverId,$strLastEndDate){
    $deliverItem = new DeliverableItem();
    $deliverObj = $deliverItem->getItem($deliverId);
    $deliverEndDate = strtotime($deliverObj["end_date"]);
    $taskLastEndDate = strtotime($strLastEndDate);
    if($taskLastEndDate > $deliverEndDate){
      $deliverItem->updateEndDate($deliverId,$strLastEndDate);
      $this->updateProjectRealDateByDeliverDate($deliverObj["project"],$strLastEndDate);
    }
  }

  function getNewTaskMailMsg($mailTo,$projectName,$start_date,$end_date,$assigner,$link,$title,$text){
    $msg = "";
    $msg .= "Dear ".$mailTo.",<br/><br/>";
    $msg .= "You have a new task request for <b>".$projectName."</b><br/>";
    $msg .= "The task assigned on <b>".$start_date."</b> and is due on <b>".$end_date."</b> by <b>".$assigner."</b><br/>";
    $msg .= "<div style='background-color:#CDCDCD;padding:15px'>";
    $msg .= "<b>Task Name<br/></b>";
    $msg .= "<p style='padding-left:15px'>".$title."</p>";
    $msg .= "<hr/>";
    $msg .= "<b>Description</b>";
    $msg .= "<p style='padding-left:15px'>".$text."</p>";
    $msg .= "<hr/>";
    $msg .= "<b>Status Update</b>";
    $msg .= "<p style='padding-left:15px'>".$statusUpdate."</p>";
    $msg .= "</div>";
    $msg .= "Please click on the link below to access task details and to add any update.<br/><br/>";
    $msg .="<a href=\"".$link."\">Go to task</a><br/><br/>";
    $msg .="Thank you from JANUS.<br/>";
    $msg .="Please do not reply to this mail.<br/>";
    return $msg;
  }

  function getModifiedTaskMailMsg($mailTo,$operator,$link,$title,$text,$statusUpdate){
    $msg = "";
    $msg .= "Dear ".$mailTo.",<br/><br/>";
    $msg .= "Task updated by ".$operator;
    $msg .= "<br/>";
    $msg .= "<div style='background-color:#CDCDCD;padding:15px'>";
    $msg .= "<b>Task Name<br/></b>";
    $msg .= "<p style='padding-left:15px'>".$title."</p>";
    $msg .= "<hr/>";
    $msg .= "<b>Description</b>";
    $msg .= "<p style='padding-left:15px'>".$text."</p>";
    $msg .= "<hr/>";
    $msg .= "<b>Status Update</b>";
    $msg .= "<p style='padding-left:15px'>".$statusUpdate."</p>";
    $msg .= "</div>";
    $msg .= "Please click on the link below to access task details and to add any update.<br/><br/>";
    $msg .="<a href=\"".$link."\">Go to task</a><br/><br/>";
    $msg .="Thank you from JANUS.<br/>";
    $msg .="Please do not reply to this mail.<br/>";
    return $msg;
  }

  function getNewProjectMailMsg($mailTo,$projectName,$link){
    $msg = "";
    $msg .= "Dear ".$mailTo.",<br/><br/>";
    $msg .= $projectName." was added.";
    $msg .= "please click on the link below to project update details and to add any updates";
    $msg .="<a href=\"".$link."\">Go to Project</a><br/><br/>";
    $msg .="Thank you from JANUS.<br/>";
    $msg .="Please do not reply to this mail.<br/>";
    return $msg;
  }
  
  function getOrderQualities($id){
    $id  = (int) $id;
    $sql = "select * from quality where `order` = $id;";
    $sel = mysql_query($sql);
    $ret = "[";
    $qJSON = "";
    while($o = mysql_fetch_array($sel)){
      $qJSON .= "{";
      $qJSON .= "id:\"".$o['ID']."\",";
      $qJSON .= "name:\"".$o['action_no']."\"";
      $qJSON .= "},";
    }
    $qJSON = substr($qJSON,0,-1);
    $ret .= $qJSON;
    $ret .= "]";
    return $ret;
  }
  
  function getQualitiesByProjectId($id){
    $quality = new Quality();
    $qualities = $quality->getQualityByProjectId($id);
    $ret = "[";
    $qJSON = "";
    foreach($qualities as $q){
      $qJSON .= "{";
      $qJSON .= "id:\"".$q['ID']."\",";
      $qJSON .= "name:\"".$q['action_no']."\"";
      $qJSON .= "},";
    }
    $qJSON = substr($qJSON,0,-1);
    $ret .= $qJSON;
    $ret .= "]";
    return $ret;
  }
  
  function getProjectOrders($pId){
    $order = new Order();
    $orders = $order->getOrders($pId);
    $ret = "[";
    $oJSON = "";
    foreach($orders as $o){
      $oJSON .= "{";
      $oJSON .= "id:\"".$o['ID']."\",";
      $oJSON .= "name:\"".$o['name']."\"";
      $oJSON .= "},";
    }
    $oJSON = substr($oJSON,0,-1);
    $ret .= $oJSON;
    $ret .= "]";
    return $ret;
  }
  
  function getProjectDeliverable($pId){
    $deliverable = new DeliverableItem();
    $deliverables = $deliverable->getDeliverableItemsByProjectId($pId);
    $ret = "[";
    $oJSON = "";
    foreach($deliverables as $o){
      $oJSON .= "{";
      $oJSON .= "id:\"".$o['ID']."\",";
      $oJSON .= "name:\"".$o['name']."\"";
      $oJSON .= "},";
    }
    $oJSON = substr($oJSON,0,-1);
    $ret .= $oJSON;
    $ret .= "]";
    return $ret;
  }

  function getProjectSubInfo($pId){
    $task = new task();
    $tasks = $task->getTasksByProjectId($pId);
    $ret = "{";
    //tasks
    if(!empty($tasks)){
      $ret .= "tasks:[";
      $taskJSON = " ";
      foreach($tasks as $tk){
        $taskJSON .= "{";
        $taskJSON .= "id:".$tk['ID'].",";
        $taskJSON .= "name:"."\"".$tk['title']."\"";
        $taskJSON .= "},";
      }
      $taskJSON = substr($taskJSON,0,-1);
      $ret .= $taskJSON;
      $ret .= "]";
    }else{
      $ret .= "tasks:[]";
    }
    //end tasks
    //orders

    $order = new Order();
    $orders = $order->getOrders($pId);
    if(!empty($tasks)){
      $ret .= ",orders:[";
      $orderJSON = " ";
      foreach($orders as $ord){
        $orderJSON .= "{";
        $orderJSON .= "id:".$ord['ID'].",";
        $orderJSON .= "name:"."\"".$ord['name']."\"";
        $orderJSON .= "},";
      }
      $orderJSON = substr($orderJSON,0,-1);
      $ret .= $orderJSON;
      $ret .= "]";
    }else{
      $ret .= ",orders:[]";
    }

    //Quality
    $quality = new Quality();
    $qualitys = $quality->getQualityByProjectId($pId);
    if(!empty($qualitys)){
      $ret .= ",qualitys:[";
      $qualityJSON = " ";
      foreach($qualitys as $quy){
        $qualityJSON .= "{";
        $qualityJSON .= "id:".$quy['ID'].",";
        $qualityJSON .= "name:"."\"".$quy['action_no']."\"";
        $qualityJSON .= "},";
      }
      $qualityJSON = substr($qualityJSON,0,-1);
      $ret .= $qualityJSON;
      $ret .= "]";
    }else{
      $ret .= ",qualitys:[]";
    }
    //ECN
    $ecn = new EngineeringChangeNote();
    $ecns = $ecn->getEcnsByProjectId($pId);
    if(!empty($ecns)){
      $ret .= ",ecns:[";
      $ecnJSON=" ";
      foreach( $ecns as $e){
        $ecnJSON .= "{";
        $ecnJSON .= "id:".$e['ID'].",";
        $ecnJSON .= "name:"."\"".$e['name']."\"";
        $ecnJSON .= "},";
      }
      $ecnJSON = substr($ecnJSON,0,-1);
      $ret .= $ecnJSON;
      $ret .= "]";
    }else{
      $ret .= ",ecns:[]";
    }
    
    $ret .= "}";
    return $ret;
    
  }

  function getAllProjects(){
    $project = new project();
    $userRole = $_SESSION['userRole'];
    if($userRole == "1" || $userRole == "3"){
      return $project->getProjects(1,1000);
    }
    $pIds = $project->getMyProjectIds($_SESSION['userid']);
    $arrRet = array();
    foreach($pIds as $pId){
      $d = $project->getProject($pId[0]);
      array_push($arrRet,$d);
    }
    return $arrRet;
  }
  

  function getAllCustomers(){
    $ret = array();
    $sql = "select DISTINCT customer_name from projekte where 1=1 ";
    $sqlCondition = $this->getMyProjectSqlCondition();
    $sql .=$sqlCondition;
    $sel = mysql_query($sql);
    while ($row = mysql_fetch_row($sel)) {
      array_push($ret,$row);
    }
    return $ret;
  }


  function getAllOrders(){
    $ret = array();
    $sql = "select * from `order` where 1=1 ";
    $sqlCondition = $this->getMyProjectSqlCondition("","project");
    $sql .= $sqlCondition;
    $sel = mysql_query($sql);
    while ($row = mysql_fetch_array($sel)) {
      array_push($ret,$row);
    }
    return $ret;
  }

  function getUploadedFileIds($data){
    $arrFiles = explode(",",$data);
    $fileIds = array();
    foreach($arrFiles as $f){
      $fileItem = explode(":",$f);
      array_push($fileIds,$fileItem[0]);
    }
    return $fileIds;
  }
  
  function getMyProjectSqlCondition($prefix="",$filedName="id"){
    $userRole = $_SESSION['userRole'];
    if($userRole == "1" || $userRole == "3"){
      return "";
    }
    $project = new project();
    $pIds = $project->getMyProjectIds($_SESSION['userid']);
    $str= "";
    foreach($pIds as $pId){
      $str .= $pId[0].",";
    }
    if($str != ""){
      $str = substr($str,0,-1);
    }
    if($prefix == ""){
      $ret = " and $filedName in (".$str.")";
    }else{
      $ret = " and $prefix.$filedName in (".$str.")";
    }
    
    return $ret;
  }
  
  

}
?>
