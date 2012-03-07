<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

require("init.php");

$action = getArrayVal($_POST, "action");


if ($action =="addPhase"){
  $project = getArrayVal($_POST, "projectId");
  $newPhaseName = getArrayVal($_POST,"phaseName");
  $newDeliverableItems = explode(",",getArrayVal($_POST, "newDeliverableItems"));
  $phase = new Phase();
  $deliverableItem = new DeliverableItem();
  $status = Status::getId("phase", "not_start");
  $phaseId=$phase->add($newPhaseName,"", $project, $status);
  if($phaseId){
    $deliverableItemStatus = Status::getId("deliverable", "not_start");
    foreach ($newDeliverableItems as $item) {
      list($name,$startDate,$endDate)=explode(":",$item);
      $deliverableItem->add($name, $deliverableItemStatus, $startDate, $endDate, $project, $phaseId, "");
    }
    echo "Ok";
  }else{
    echo "Fail";
  }
  
}

?>
