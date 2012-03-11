<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

require("init.php");

$action = getArrayVal($_POST, "action");
if(!$action){
  $action = getArrayVal($_GET, "action");
}

switch ($action){
  case "addPhase":
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
    break;
  case "reloadphase":
    $projectId = getArrayVal($_GET, "id");
    $projectTabs = new ProjectTabs;
    $phases = $projectTabs->getPhaseTab($projectId);
    $template->assign("phaseTab", $phases);
    $template->display("phasedetails.tpl");
    break;
  case "delphase":
    $phaseId = getArrayVal($_GET, "id");
    $phase = new Phase();
    $ret=$phase->del($phaseId);
    if($ret){
      echo "Ok";
    }else{
      echo "Fail";
    }
    break;
  case "editPhase":
    $phaseId = getArrayVal($_GET, "id");
    $deliverableItem = new DeliverableItem();
    $phase = new Phase();
    $phaseObj = $phase->get($phaseId);
    $template->assign("phaseTab", $phases);
    $deliverableItems = $deliverableItem->getDeliverableItemsByPhaseId($phaseId, 1000); 
    $template->assign("deliverableItem", $deliverableItems);
    $template->assign("phase",$phaseObj);
    $template->assign("templateName", "editphasedlg.tpl");
    $template->display("dlgmodal.tpl");
    break;
 case "updatePhase":
   $phaseId = getArrayVal($_POST, "id");
   $newItems = getArrayVal($_POST, "newItems");
   $updatedItems = getArrayVal($_POST, "updatedItems");
   $project = getArrayVal($_POST, "projectId");
   $deliverableItem = new DeliverableItem();
   if(!empty($newItems)){
     $newDeliverables = explode(",",$newItems);
     foreach ($updateItems_ as $item) {
       list($name,$startDate,$endDate)=explode(":",$item);
       $deliverableItem->add($name, $deliverableItemStatus, $startDate, $endDate, $project, $phaseId, "");
     }
   }
   if(!empty($updatedItems)){
     $updateItems_ = explode(",",$updatedItems);
     foreach ($updateItems_ as $item) {
       list($id,$name,$startDate,$endDate)=explode(":",$item);
       $deliverableItem->update($id, $name, null, $startDate, $endDate, $phaseId, "");
     }
   }
   echo 'Ok';
   break;
  default:
    break;
}

?>
