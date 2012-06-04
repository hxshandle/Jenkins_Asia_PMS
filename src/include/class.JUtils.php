<?php
class JUtils{

  function updateProjectRealDateByDeliverDate($projectId,$strLastEndDate){
    $project = new Project();
    $pro = $project->getProject($projectId):
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
      $deliverObj->updateEndDate($deliverId,$strLastEndDate);
      $this->updateProjectRealDateByDeliverDate($deliverObj["project"],$strLastEndDate);
    }

  }
}
?>
