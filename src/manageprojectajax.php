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
  case "addFinance":
    $project = getArrayVal($_POST, "projectId");
    $newFinanceName = getArrayVal($_POST,"financeName");
    $newCurrencyInner = getArrayVal($_POST,"currencyInner");
    $newCurrencyExt = getArrayVal($_POST,"currencyExt");
    $newInnerCost = getArrayVal($_POST,"innerCost");    
    $newExternalCost = getArrayVal($_POST,"externalCost");
    $newPublishedFlag = getArrayVal($_POST,"publishedFlag"); 
    $newApprovedFlag = getArrayVal($_POST,"approvedFlag"); 
    $finance = new Finance();
    $financeId=$finance->add($newFinanceName,$project, $newInnerCost,$newCurrencyInner,$newExternalCost,$newCurrencyExt,$newApprovedFlag,$newPublishedFlag);
    if($financeId){
      echo "Ok";
    }else{
      echo "Fail";
    }
    break;
  case "reloadfinance":
    $projectId = getArrayVal($_GET, "id");
    $projectTabs = new ProjectTabs;
    $finances = $projectTabs->getFinanceTab($projectId);
    $template->assign("financeTab", $finances);
    $template->display("financedetails.tpl");
    break;
  case "delfinance":
    $phaseId = getArrayVal($_GET, "id");
    $finance = new Finance();
    $ret=$finance->del($phaseId);
    if($ret){
      echo "Ok";
    }else{
      echo "Fail";
    }
    break;  
  case "editFinance":
    $financeId = getArrayVal($_GET, "id");
    $finance = new Finance();
    $projectTmp = new project();
    $financeObj = $finance->get($financeId);
    $project = $projectTmp->getProject($financeObj[project]);
    $template->assign("currency",Currency::$Currencys);
    $template->assign("flag",Flag::$Flags);
    $template->assign("project", $project);
    $template->assign("financeTab", $finances);
    $template->assign("finance",$financeObj);
    $template->assign("templateName", "editfinancedlg.tpl");
    $template->display("dlgmodal.tpl");
    break;
  case "saveFinance":
    $project = getArrayVal($_POST, "projectId");
    $editFinanceId = getArrayVal($_POST,"financeId");
    $editCurrencyInner = getArrayVal($_POST,"currencyInner");
    $editCurrencyExt = getArrayVal($_POST,"currencyExt");
    $editInnerCost = getArrayVal($_POST,"innerCost");    
    $editExternalCost = getArrayVal($_POST,"externalCost");
    $editPublishedFlag = getArrayVal($_POST,"publishedFlag"); 
    $editApprovedFlag = getArrayVal($_POST,"approvedFlag"); 
    $finance = new Finance();
    $financeId=$finance->update($editFinanceId,$editInnerCost,$editCurrencyInner,$editExternalCost,$editCurrencyExt,$editApprovedFlag,$editPublishedFlag);
    if($financeId){
      echo "Ok";
    }else{
      echo "Fail";
    }
    break;
  default:
    break;
}

?>
