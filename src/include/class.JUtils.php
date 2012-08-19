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

  function getNewTaskMailMsg($mailTo,$projectName,$start_date,$end_date,$assigner,$link){
    $msg = "";
    $msg .= "Dear ".$mailTo.",<br/><br/>";
    $msg .= "You have a new task request for <b>".$projectName."</b><br/>";
    $msg .= "The task assigned on <b>".$start_date."</b> and is due on <b>".$end_date."</b> by <b>".$assigner."</b><br/>";
    $msg .= "Please click on the link below to access task details and to add any update.<br/><br/>";
    $msg .="<a href=\"".$link."\">Go to task</a><br/><br/>";
    $msg .="Thank you from JANUS.<br/>";
    $msg .="Please do not reply to this mail.<br/>";
    return $msg;
  }

  function getModifiedTaskMailMsg($mailTo,$operator,$link){
    $msg = "";
    $msg .= "Dear ".$mailTo.",<br/><br/>";
    $msg .= "Task updated by ".$operator;
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
    }
    $ret .= "}";
    return $ret;
    
  }


  function getAllCustomers(){
    $ret = array();
    $sql = "select DISTINCT customer_name from projekte";
    $sel = mysql_query($sql);
    while ($row = mysql_fetch_row($sel)) {
      array_push($ret,$row);
    }
    return $ret;
  }


  function getAllOrders(){
    $ret = array();
    $sql = "select * from `order`;";
    $sel = mysql_query($sql);
    while ($row = mysql_fetch_array($sel)) {
      array_push($ret,$row);
    }
    return $ret;
  }

}
?>
