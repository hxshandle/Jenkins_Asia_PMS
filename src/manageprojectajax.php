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
    $financeId = getArrayVal($_GET, "id");
    $finance = new Finance();
    $ret=$finance->del($financeId);
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
 case "updatePhase":
   $phaseId = getArrayVal($_POST, "id");
   $newItems = getArrayVal($_POST, "newItems");
   $updatedItems = getArrayVal($_POST, "updatedItems");
   $project = getArrayVal($_POST, "projectId");
   $deliverableItem = new DeliverableItem();
   if(!empty($newItems)){
     $newDeliverables = explode(",",$newItems);
     $deliverableItemStatus = Status::getId("deliverable", "not_start");
     foreach ($newDeliverables as $item) {
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
 case "addSample":
    $project = getArrayVal($_POST, "projectId");
    $newSampleName = getArrayVal($_POST,"sampleName");
    $newSampleTag = getArrayVal($_POST,"sampleTag");
    $newSampleAvailablecount = getArrayVal($_POST,"sampleAvailablecount");
    $newSampleTotalcount = getArrayVal($_POST,"sampleTotalcount");    
    $newSampleDescription = getArrayVal($_POST,"sampleDescription");
    $sample = new Sample();
    $sampleId=$sample->add($newSampleName,'',$project, $newSampleTotalcount,$newSampleAvailablecount,$newSampleTag,$newSampleDescription);
    if($sampleId){
      echo "Ok";
    }else{
      echo "Fail";
    }
    break;
 case "reloadsample":
    $projectId = getArrayVal($_GET, "id");
    $projectTabs = new ProjectTabs;
    $samples = $projectTabs->getSampleTab($projectId);
    $template->assign("sampleTab", $samples);
    $template->display("sampledetails.tpl");
    break;
 case "delsample":
    $sampleId = getArrayVal($_GET, "id");
    $sample = new Sample();
    $ret=$sample->del($sampleId);
    if($ret){
      echo "Ok";
    }else{
      echo "Fail";
    }
    break;   
 case "editSample":
    $sampleId = getArrayVal($_GET, "id");
    $sample = new Sample();
    $projectTmp = new project();
    $sampleObj = $sample->get($sampleId);
    $project = $projectTmp->getProject($sampleObj[project]);
    $template->assign("project", $project);
    $template->assign("sampleTab", $samples);
    $template->assign("sample",$sampleObj);
    $template->assign("templateName", "editsampledlg.tpl");
    $template->display("dlgmodal.tpl");
    break;
  case "updateSample":
    $project = getArrayVal($_POST, "projectId");
    $editSampleId = getArrayVal($_POST,"sampleId");
    $editSampleAvailablecount = getArrayVal($_POST,"sampleAvailablecount"); 
    $editSampleTotalcount = getArrayVal($_POST,"sampleTotalcount"); 
    $sample = new Sample();
    $sampleId=$sample->updateCount($editSampleId,$editSampleTotalcount,$editSampleAvailablecount);
    if($sampleId){   
        echo "Ok";
    }else{
      echo "Fail";
    }
    break;
 case "delDeliverableItem":
   $id = getArrayVal($_GET, "id");
   $deliverableItem = new DeliverableItem();
   $ret = $deliverableItem->del($id);
   if($ret){
     echo "Ok";
   }else{
     echo "Fail";
   }
   break;
  case "updateProject":
    $id                       = getArrayVal($_POST, "id");
    $assignto                 = getArrayVal($_POST, "assignto");
    $name                     = getArrayVal($_POST, "name");
    $desc                     = getArrayVal($_POST, "desc");
    $startDate                = getArrayVal($_POST, "start");
    $endDate                  = getArrayVal($_POST, "endDate");
    $status                   = getArrayVal($_POST, "projectStatus");
    $user                     = getArrayVal($_POST, "user");
    $assign                   = getArrayVal($_POST, "assginme");
    $budget                   = getArrayVal($_POST, "budget");
    $projectStatus            = getArrayVal($_POST,"projectStatus");
    $projectLevel             = getArrayVal($_POST,"projectLevel");
    $projectPriority          = getArrayVal($_POST,"projectPriority");
    $customer                 = getArrayVal($_POST,"customer");
    $suppler                  = getArrayVal($_POST,"supplier");
    $targetFOB                = getArrayVal($_POST, "targetFOB");
    $targetFOBCurrency       = getArrayVal($_POST, "targetFOBCurrency");
    $forecastedAnnualQuality1 = getArrayVal($_POST, "forecastedAnnualQuality1");
    $forecastedAnnualQuality2 = getArrayVal($_POST, "forecastedAnnualQuality2");
    $forecastedAnnualQuality3 = getArrayVal($_POST, "forecastedAnnualQuality3");
    $projectLeader            = getArrayVal($_POST, "projectLeaderId");
    $customerLeader           = getArrayVal($_POST, "customerLeaderId");
    $supplierLeader           = getArrayVal($_POST, "supplierLeaderId");
    $project = new Project();
    $upd=$project->edit($id, $name, $desc, $projectStatus, $budget, $projectLevel, $projectPriority, $customer, $suppler, $targetFOB, $targetFOBCurrency, $forecastedAnnualQuality1, $forecastedAnnualQuality2, $forecastedAnnualQuality3, $customerLeader, $supplierLeader, $projectLeader, $startDate, $endDate);
    if($upd){
      echo "Ok";
    }else{
      echo "Fail";
    }
    break;
 case "addSampleRequest":
    $project = getArrayVal($_POST, "projectId");
    $sample = getArrayVal($_POST,"sampleId"); 
    $newSampleRequestDescription = getArrayVal($_POST,"samplerequestcomment");
    $sampleRequest = new SampleRequest();
    $sampleRequestId=$sampleRequest->add($_SESSION['userid'],$newSampleRequestDescription,$project,$sample);
    if($sampleRequestId){
      echo "Ok";
    }else{
      echo "Fail";
    }
    break;    
 case "reloadsamplerequest":
    $projectId = getArrayVal($_GET, "id");
    $projectTabs = new ProjectTabs;
    $samplesRequest = $projectTabs->getSampleRequestTab($projectId);
    $template->assign("sampleRequestTab", $samplesRequest);
    $template->display("samplerequestdetails.tpl");
    break;
 case "editApproveRequest":
    $sampleRequestId = getArrayVal($_GET, "id");
    $sampleRequest = new SampleRequest();
    $sampleRequestObj = $sampleRequest->get($sampleRequestId);
    $template->assign("sampleRequest",$sampleRequestObj);
    $template->assign("templateName", "approveSampleDlg.tpl");
    $template->display("dlgmodal.tpl");
    break;
 case "approveSample":
   $sampleRequestId = getArrayVal($_POST, "sampleRequestId");
   $commit = getArrayVal($_POST, "commit");
   $sampleRequest = new SampleRequest();
   $sample = new Sample();
   $sampleRequestTmp = $sampleRequest->get($sampleRequestId);
   $sampleTmp = $sample->get($sampleRequestTmp[sample]);
   if($sampleTmp[available_count]<=0){
       echo "notenough";
       break;
   }
   $ret1 = $sampleRequest->approve($sampleRequestId,$_SESSION['userid'],$commit);
   $ret2 = $sample->reduceCount($sampleRequestTmp[sample]);
   if($ret2&&$ret1){
     echo "Ok";
   }else{
     echo "Fail";
   }
    break;
 case "editRejectRequest":
    $sampleRequestId = getArrayVal($_GET, "id");
    $sampleRequest = new SampleRequest();
    $sampleRequestObj = $sampleRequest->get($sampleRequestId);
    $template->assign("sampleRequest",$sampleRequestObj);
    $template->assign("templateName", "rejectSampleDlg.tpl");
    $template->display("dlgmodal.tpl");
    break;
 case "retrievesample":
   $sampleRequestId = getArrayVal($_GET, "id");
   $sampleRequest = new SampleRequest();
   $sample = new Sample();
   $sampleRequestTmp = $sampleRequest->get($sampleRequestId);
   $sampleTmp = $sample->get($sampleRequestTmp[sample]);
   $ret1 = $sampleRequest->retrive($sampleRequestId);
   $ret2 = $sample->addCount($sampleRequestTmp[sample]);
   if($ret2&&$ret1){
     echo "Ok";
   }else{
     echo "Fail";
   }
    break; 
 case "rejectSample":
   $sampleRequestId = getArrayVal($_POST, "sampleRequestId");
   $commit = getArrayVal($_POST, "commit");
   $sampleRequest = new SampleRequest();
   $sample = new Sample();
   $sampleRequestTmp = $sampleRequest->get($sampleRequestId);
   $sampleTmp = $sample->get($sampleRequestTmp[sample]);
   $ret1 = $sampleRequest->reject($sampleRequestId,$_SESSION['userid'],$commit);
   if(ret1){
     echo "Ok";
   }else{
     echo "Fail";
   }
    break;     
 case "delmember":
    $userId = getArrayVal($_GET, "userId");
    $projectId = getArrayVal($_GET, "projectId");
    $project = new Project();
    $project->
    $ret=$project->deassign($userId,$projectId);
    if($ret){
      echo "Ok";
    }else{
      echo "Fail";
    }
    break;
  case "reloadmember":
    $projectId = getArrayVal($_GET, "id");
    $projectTabs = new ProjectTabs;
    $members = $projectTabs->getMemberTab($projectId);
    $template->assign("memberTab", $members);
    $template->display("memberdetails.tpl");
    break;

 case "addMember":
    $projectTmp = getArrayVal($_POST, "projectId");
    $availablemembers =  getArrayVal($_POST, "members");
    $members = explode(",",$availablemembers);
    $project = new project();
    $flag = false;
    foreach ($members as $member){
       $projectId=$project->assign($member,$projectTmp);
       $flag = true;
    }
    if($flag){
      echo "Ok";
    }else{
      echo "Fail";
    }
    break;
  case "addOrder":
    $project = getArrayVal($_POST, "projectId");
    $orderName = getArrayVal($_POST,"orderName"); 
    $orderQuantity = getArrayVal($_POST,"orderQuantity");
    $orderTime = getArrayVal($_POST,"orderTime"); 
    $orderDesc = getArrayVal($_POST,"orderDesc");
    $order = new Order();
    $orderId=$order->add($orderName,$project,$orderQuantity,$orderDesc,$orderTime,14);
    if($orderId){
      echo "Ok";
    }else{
      echo "Fail";
    }
    break;     
 case "priceOrder":
    $orderId = getArrayVal($_GET, "id");
    $order = new Order();
    $orderObj = $order->get($orderId);
    $template->assign("order",$orderObj);
    $template->assign("currency",Currency::$Currencys);
    $template->assign("templateName", "priceOrderDlg.tpl");
    $template->display("dlgmodal.tpl");
    break;    
 case "saveOrder":
    $project = getArrayVal($_POST, "projectId");
    $editOrderId = getArrayVal($_POST,"orderId");
    $editCurrencyInner = getArrayVal($_POST,"currencyInner");
    $editCurrencyExt = getArrayVal($_POST,"currencyExt");
    $editInnerCost = getArrayVal($_POST,"innerCost");    
    $editExternalCost = getArrayVal($_POST,"externalCost");
    $finance = new Finance();
    $financeId=$finance->add('',$project, $editInnerCost,$editCurrencyInner,$editExternalCost,$editCurrencyExt,1,1,$editOrderId);
    $order = new Order();
    $orderId=$order->agree($editOrderId);
    if($orderId){
      echo "Ok";
    }else{
      echo "Fail";
    }
    break;
 case "reloadorder":
    $projectId = getArrayVal($_GET, "id");
    $projectTabs = new ProjectTabs;
    $orders = $projectTabs->getOrderTabByCustomer($projectId,$_SESSION['userid']);
    $template->assign("orderTab", $orders);
    $template->display("orderdetails.tpl");
    break;
 case "agreeOrder":
    $editOrderId = getArrayVal($_GET,"orderId");
    $order = new Order();
    $orderId=$order->accept($editOrderId);
    if($orderId){
      echo "Ok";
    }else{
      echo "Fail";
    }   
    break; 
 case "closeOrder":
    $editOrderId = getArrayVal($_GET,"orderId");
    $order = new Order();
    $orderId=$order->close($editOrderId);
    if($orderId){
      echo "Ok";
    }else{
      echo "Fail";
    }   
    break;
   case "addEcn":
    $project = getArrayVal($_POST, "projectId");
    $ecnName = getArrayVal($_POST,"ecnName"); 
    $description = getArrayVal($_POST,"ecnDescription");
    $deliverable = getArrayVal($_POST,"deliverable"); 
    $deliverableTmp = new DeliverableItem();
    $deliverableObj = $deliverableTmp->getItem($deliverable);
    $enc = new EngineeringChangeNote();
    $encId=$enc->add($ecnName,$description,$project,$deliverableObj[phase],$deliverable);
    if($encId){
      echo "Ok";
    }else{
      echo "Fail";
    }
    break;
 case "reloadecn":
    $projectId = getArrayVal($_GET, "id");
    $projectTabs = new ProjectTabs;
    $eccs = $projectTabs->getEcnTab($projectId,$_SESSION['userid']);
    $template->assign("ecnTab", $eccs);
    $template->display("ecndetails.tpl");
    break;

 case "editApproveEcn":
    $ecnId = getArrayVal($_GET, "id");
    $ecn = new EngineeringChangeNote();
    $ecnObj = $ecn->get($ecnId);
    $template->assign("ecn",$ecnObj);
    $template->assign("templateName", "approveEcnDlg.tpl");
    $template->display("dlgmodal.tpl");
    break;
 case "editRejectEcn":
    $ecnId = getArrayVal($_GET, "id");
    $ecn = new EngineeringChangeNote();
    $ecnObj = $ecn->get($ecnId);
    $template->assign("ecn",$ecnObj);
    $template->assign("templateName", "rejectEcnDlg.tpl");
    $template->display("dlgmodal.tpl");
    break;

 case "approveEcn":
   $ecnId = getArrayVal($_POST, "ecnId");
   $commit = getArrayVal($_POST, "commit");
   $ecn = new EngineeringChangeNote();
   $ret1 = $ecn->approve($ecnId,$_SESSION['userid'],$commit);
   if($ret1){
     echo "Ok";
   }else{
     echo "Fail";
   }
   break;
 case "rejectEcn":
   $ecnId = getArrayVal($_POST, "ecnId");
   $commit = getArrayVal($_POST, "commit");
   $ecn = new EngineeringChangeNote();
   $ret1 = $ecn->reject($ecnId,$_SESSION['userid'],$commit);
   if($ret1){
     echo "Ok";
   }else{
     echo "Fail";
   }
   break;

  default:
    break;
}

?>
