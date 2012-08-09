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

}
?>
