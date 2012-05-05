<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

require("init.php");

$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}

switch ($action) {
  case "addPhase":
    $project = getArrayVal($_POST, "projectId");
    $newPhaseName = getArrayVal($_POST, "phaseName");
    $parentPhase = getArrayVal($_POST, "parentPhase");
    $childPhase = getArrayVal($_POST, "childPhase");
    $newDeliverableItems = explode(",", getArrayVal($_POST, "newDeliverableItems"));
    $phase = new Phase();
    $deliverableItem = new DeliverableItem();
    $status = Status::getId("phase", "not_start");
    $phaseId = $phase->add($newPhaseName, "", $project, $status,1,$parentPhase,$childPhase);
    if ($phaseId) {
      $deliverableItemStatus = Status::getId("deliverable", "not_start");
      foreach ($newDeliverableItems as $item) {
        list($name, $startDate, $endDate) = explode(":", $item);
        $deliverableItem->add($name, $deliverableItemStatus, $startDate, $endDate, $project, $phaseId, "");
      }
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "reloadphase":
    $projectId = getArrayVal($_GET, "id");
    $pj = new project();
    $pp = $pj->getProject($projectId);
    $isProjectLeader = $_SESSION['userid'] == $pp['project_leader'];
    $isCustomerLeader = $_SESSION['userid'] == $pp['customer_leader'];
    $isSupplierLeader = $_SESSION['userid'] == $pp['supplier_leader'];
    $projectTabs = new ProjectTabs;
    $phases = $projectTabs->getPhaseTab($projectId);
    $template->assign("phaseTab", $phases);
    $tprojectObj = $project->getProject($projectId);
    $template->assign("project", $tprojectObj);
    $_roleType = $_SESSION['userRole'];
    $editBaseInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editBaseInfo", $editBaseInfo);

    $editPhase = false;
    $editPhase = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editPhase", $editPhase);
    $template->display("phasedetails.tpl");
    break;
  case "delphase":
    $phaseId = getArrayVal($_GET, "id");
    $phase = new Phase();
    $ret = $phase->del($phaseId);
    if ($ret) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "editPhase":
    $phaseId = getArrayVal($_GET, "id");
    $deliverableItem = new DeliverableItem();
    $phase = new Phase();
    $phaseObj = $phase->get($phaseId);
    $projectTabs = new ProjectTabs;
    $phases = $projectTabs->getPhaseTab($phaseObj['project']);
    $template->assign("phaseTab", $phases);
    $deliverableItems = $deliverableItem->getDeliverableItemsByPhaseId($phaseId, 1000);
    $template->assign("deliverableItem", $deliverableItems);
    $template->assign("phase", $phaseObj);
    $template->assign("templateName", "editphasedlg.tpl");
    $template->display("dlgmodal.tpl");
    break;
  case "addFinance":
    $project = getArrayVal($_POST, "projectId");
    $newFinanceName = getArrayVal($_POST, "financeName");
    $newCurrencyInner = getArrayVal($_POST, "currencyInner");
    $newCurrencyExt = getArrayVal($_POST, "currencyExt");
    $newInnerCost = getArrayVal($_POST, "innerCost");
    $newExternalCost = getArrayVal($_POST, "externalCost");
    $newPublishedFlag = getArrayVal($_POST, "publishedFlag");
    $newApprovedFlag = getArrayVal($_POST, "approvedFlag");
    $finance = new Finance();
    $financeId = $finance->add($newFinanceName, $project, $newInnerCost, $newCurrencyInner, $newExternalCost, $newCurrencyExt, $newApprovedFlag, $newPublishedFlag);
    if ($financeId) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "reloadfinance":
    $projectId = getArrayVal($_GET, "id");
    $pj = new project();
    $pp = $pj->getProject($projectId);
    $isProjectLeader = $_SESSION['userid'] == $pp['project_leader'];
    $isCustomerLeader = $_SESSION['userid'] == $pp['customer_leader'];
    $isSupplierLeader = $_SESSION['userid'] == $pp['supplier_leader'];
    $_roleType = $_SESSION['userRole'];
    $editBaseInfo = false;
    $editBaseInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editBaseInfo", $editBaseInfo);
    $editSampleInfo = false;
    $editSampleInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4);
    $template->assign("editSampleInfo", $editSampleInfo);
    $editSampleRequestInfo = false;
    $editSampleRequestInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 5);
    $template->assign("editSampleRequestInfo", $editSampleRequestInfo);
    $editTeamInfo = false;
    $editTeamInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 5) || ($_roleType == 6);
    $template->assign("editTeamInfo", $editTeamInfo);
    $addEcnInfo = false;
    $addEcnInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader) || ($_roleType == 5);
    $template->assign("addEcnInfo", $addEcnInfo);
    $editPhase = false;
    $editPhase = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editPhase", $editPhase);
    $addOrder = false;
    $addOrder = $_roleType == 6;
    $template->assign("addOrder", $addOrder);
    $pricePurchase = false;
    $pricePurchase = $_roleType == 8;
    $template->assign("pricePurchase", $pricePurchase);
    $orderDetailInfo = false;
    $orderDetailInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 6);
    ;
    $template->assign("orderDetailInfo", $orderDetailInfo);
    $editPurchaseInfo = false;
    $editPurchaseInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader) || ($_roleType == 8);
    $template->assign("editPurchaseInfo", $editPurchaseInfo);

    $projectTabs = new ProjectTabs;
    $finances = $projectTabs->getFinanceTab($projectId);
    $template->assign("financeTab", $finances);
    $template->display("financedetails.tpl");
    break;
  case "delfinance":
    $financeId = getArrayVal($_GET, "id");
    $finance = new Finance();
    $ret = $finance->del($financeId);
    if ($ret) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "editFinance":
    $financeId = getArrayVal($_GET, "id");
    $finance = new Finance();
    $projectTmp = new project();
    $financeObj = $finance->get($financeId);
    $project = $projectTmp->getProject($financeObj[project]);
    $template->assign("currency", Currency::$Currencys);
    $template->assign("flag", Flag::$Flags);
    $template->assign("project", $project);
    $template->assign("financeTab", $finances);
    $template->assign("finance", $financeObj);
    $template->assign("templateName", "editfinancedlg.tpl");
    $template->display("dlgmodal.tpl");
    break;
  case "saveFinance":
    $project = getArrayVal($_POST, "projectId");
    $editFinanceId = getArrayVal($_POST, "financeId");
    $editCurrencyInner = getArrayVal($_POST, "currencyInner");
    $editCurrencyExt = getArrayVal($_POST, "currencyExt");
    $editInnerCost = getArrayVal($_POST, "innerCost");
    $editExternalCost = getArrayVal($_POST, "externalCost");
    $editPublishedFlag = getArrayVal($_POST, "publishedFlag");
    $editApprovedFlag = getArrayVal($_POST, "approvedFlag");
    $finance = new Finance();
    $financeId = $finance->update($editFinanceId, $editInnerCost, $editCurrencyInner, $editExternalCost, $editCurrencyExt, $editApprovedFlag, $editPublishedFlag);
    if ($financeId) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "getAddPhaseDlgContent":
    $projectId = getArrayVal($_GET, "projectId");
    $phase = new Phase();
    $projectTabs = new ProjectTabs();
    $phases = $projectTabs->getPhaseTab($projectId);
    $template->assign("phaseTab", $phases);
    $template->assign("templateName", "addphase.tpl");
    $template->display("dlgmodal.tpl");
    break;
  case "updatePhase":
    $phaseId = getArrayVal($_POST, "id");
    $newItems = getArrayVal($_POST, "newItems");
    $parentPhase = getArrayVal($_POST, "parentPhase");
    $childPhase = getArrayVal($_POST, "childPhase");
    $updatedItems = getArrayVal($_POST, "updatedItems");
    $project = getArrayVal($_POST, "projectId");
    $deliverableItem = new DeliverableItem();
    $phase = new Phase();
    $originalPhase = $phase->get($phaseId);
    $phase->update($phaseId, $originalPhase['desc'], $originalPhase['status'], $originalPhase['valid'], $parentPhase, $childPhase);
    if (!empty($newItems)) {
      $newDeliverables = explode(",", $newItems);
      $deliverableItemStatus = Status::getId("deliverable", "not_start");
      foreach ($newDeliverables as $item) {
        list($name, $startDate, $endDate) = explode(":", $item);
        $deliverableItem->add($name, $deliverableItemStatus, $startDate, $endDate, $project, $phaseId, "");
      }
    }
    if (!empty($updatedItems)) {
      $updateItems_ = explode(",", $updatedItems);
      foreach ($updateItems_ as $item) {
        list($id, $name, $startDate, $endDate) = explode(":", $item);
        $deliverableItem->update($id, $name, null, $startDate, $endDate, $phaseId, "");
      }
    }
    echo 'Ok';
    break;
  case "addSample":
    $project = getArrayVal($_POST, "projectId");
    $newSampleName = getArrayVal($_POST, "sampleName");
    $newSampleTag = getArrayVal($_POST, "sampleTag");
    $newSampleAvailablecount = getArrayVal($_POST, "sampleAvailablecount");
    $newSampleTotalcount = getArrayVal($_POST, "sampleTotalcount");
    $newSampleDescription = getArrayVal($_POST, "sampleDescription");
    $sample = new Sample();
    $sampleId = $sample->add($newSampleName, '', $project, $newSampleTotalcount, $newSampleAvailablecount, $newSampleTag, $newSampleDescription);
    if ($sampleId) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "reloadsample":
    $projectId = getArrayVal($_GET, "id");
    $pj = new project();
    $pp = $pj->getProject($projectId);
    $isProjectLeader = $_SESSION['userid'] == $pp['project_leader'];
    $isCustomerLeader = $_SESSION['userid'] == $pp['customer_leader'];
    $isSupplierLeader = $_SESSION['userid'] == $pp['supplier_leader'];
    $_roleType = $_SESSION['userRole'];
    $editBaseInfo = false;
    $editBaseInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editBaseInfo", $editBaseInfo);
    $editSampleInfo = false;
    $editSampleInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4);
    $template->assign("editSampleInfo", $editSampleInfo);
    $editSampleRequestInfo = false;
    $editSampleRequestInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 5);
    $template->assign("editSampleRequestInfo", $editSampleRequestInfo);
    $editTeamInfo = false;
    $editTeamInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 5) || ($_roleType == 6);
    $template->assign("editTeamInfo", $editTeamInfo);
    $addEcnInfo = false;
    $addEcnInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader) || ($_roleType == 5);
    $template->assign("addEcnInfo", $addEcnInfo);
    $editPhase = false;
    $editPhase = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editPhase", $editPhase);
    $addOrder = false;
    $addOrder = $_roleType == 6;
    $template->assign("addOrder", $addOrder);
    $pricePurchase = false;
    $pricePurchase = $_roleType == 8;
    $template->assign("pricePurchase", $pricePurchase);
    $orderDetailInfo = false;
    $orderDetailInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 6);
    ;
    $template->assign("orderDetailInfo", $orderDetailInfo);
    $editPurchaseInfo = false;
    $editPurchaseInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader) || ($_roleType == 8);
    $template->assign("editPurchaseInfo", $editPurchaseInfo);
    $projectTabs = new ProjectTabs;
    $samples = $projectTabs->getSampleTab($projectId);
    $template->assign("sampleTab", $samples);
    $template->display("sampledetails.tpl");
    break;
  case "delsample":
    $sampleId = getArrayVal($_GET, "id");
    $sample = new Sample();
    $ret = $sample->del($sampleId);
    if ($ret) {
      echo "Ok";
    } else {
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
    $template->assign("sample", $sampleObj);
    $template->assign("templateName", "editsampledlg.tpl");
    $template->display("dlgmodal.tpl");
    break;
  case "updateSample":
    $project = getArrayVal($_POST, "projectId");
    $editSampleId = getArrayVal($_POST, "sampleId");
    $editSampleAvailablecount = getArrayVal($_POST, "sampleAvailablecount");
    $editSampleTotalcount = getArrayVal($_POST, "sampleTotalcount");
    $sample = new Sample();
    $sampleId = $sample->updateCount($editSampleId, $editSampleTotalcount, $editSampleAvailablecount);
    if ($sampleId) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "delDeliverableItem":
    $id = getArrayVal($_GET, "id");
    $deliverableItem = new DeliverableItem();
    $ret = $deliverableItem->del($id);
    if ($ret) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "updateProject":
    $id = getArrayVal($_POST, "id");
    $assignto = getArrayVal($_POST, "assignto");
    $name = getArrayVal($_POST, "name");
    $desc = getArrayVal($_POST, "desc");
    $startDate = getArrayVal($_POST, "start");
    $endDate = getArrayVal($_POST, "endDate");
    $status = getArrayVal($_POST, "projectStatus");
    $user = getArrayVal($_POST, "user");
    $assign = getArrayVal($_POST, "assginme");
    $budget = getArrayVal($_POST, "budget");
    $projectStatus = getArrayVal($_POST, "projectStatus");
    $projectLevel = getArrayVal($_POST, "projectLevel");
    $projectPriority = getArrayVal($_POST, "projectPriority");
    $customer = getArrayVal($_POST, "customer");
    $suppler = getArrayVal($_POST, "supplier");
    $targetFOB = getArrayVal($_POST, "targetFOB");
    $targetFOBCurrency = getArrayVal($_POST, "targetFOBCurrency");
    $forecastedAnnualQuality1 = getArrayVal($_POST, "forecastedAnnualQuality1");
    $forecastedAnnualQuality2 = getArrayVal($_POST, "forecastedAnnualQuality2");
    $forecastedAnnualQuality3 = getArrayVal($_POST, "forecastedAnnualQuality3");
    $projectLeader = getArrayVal($_POST, "projectLeaderId");
    $customerLeader = getArrayVal($_POST, "customerLeaderId");
    $supplierLeader = getArrayVal($_POST, "supplierLeaderId");
    $project = new Project();
    $upd = $project->edit($id, $name, $desc, $projectStatus, $budget, $projectLevel, $projectPriority, $customer, $suppler, $targetFOB, $targetFOBCurrency, $forecastedAnnualQuality1, $forecastedAnnualQuality2, $forecastedAnnualQuality3, $customerLeader, $supplierLeader, $projectLeader, $startDate, $endDate);
    if ($upd) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "addSampleRequest":
    $project = getArrayVal($_POST, "projectId");
    $sample = getArrayVal($_POST, "sampleId");
    $newSampleRequestDescription = getArrayVal($_POST, "samplerequestcomment");
    $sampleRequest = new SampleRequest();
    $sampleRequestId = $sampleRequest->add($_SESSION['userid'], $newSampleRequestDescription, $project, $sample);
    if ($sampleRequestId) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "reloadsamplerequest":
    $projectId = getArrayVal($_GET, "id");
    $pj = new project();
    $pp = $pj->getProject($projectId);
    $isProjectLeader = $_SESSION['userid'] == $pp['project_leader'];
    $isCustomerLeader = $_SESSION['userid'] == $pp['customer_leader'];
    $isSupplierLeader = $_SESSION['userid'] == $pp['supplier_leader'];
    $_roleType = $_SESSION['userRole'];
    $editBaseInfo = false;
    $editBaseInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editBaseInfo", $editBaseInfo);
    $editSampleInfo = false;
    $editSampleInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4);
    $template->assign("editSampleInfo", $editSampleInfo);
    $editSampleRequestInfo = false;
    $editSampleRequestInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 5);
    $template->assign("editSampleRequestInfo", $editSampleRequestInfo);
    $editTeamInfo = false;
    $editTeamInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 5) || ($_roleType == 6);
    $template->assign("editTeamInfo", $editTeamInfo);
    $addEcnInfo = false;
    $addEcnInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader) || ($_roleType == 5);
    $template->assign("addEcnInfo", $addEcnInfo);
    $editPhase = false;
    $editPhase = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editPhase", $editPhase);
    $addOrder = false;
    $addOrder = $_roleType == 6;
    $template->assign("addOrder", $addOrder);
    $pricePurchase = false;
    $pricePurchase = $_roleType == 8;
    $template->assign("pricePurchase", $pricePurchase);
    $orderDetailInfo = false;
    $orderDetailInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 6);
    ;
    $template->assign("orderDetailInfo", $orderDetailInfo);
    $editPurchaseInfo = false;
    $editPurchaseInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader) || ($_roleType == 8);
    $template->assign("editPurchaseInfo", $editPurchaseInfo);
    $tabs = new ProjectTabs();
    if (($_SESSION['userRole'] == 4 && $isProjectLeader) || $_SESSION['userRole'] == 1 || $_SESSION['userRole'] == 3) {
      $sampleRequestTab = $tabs->getSampleRequestTab($projectId, null);
    } else {
      $sampleRequestTab = $tabs->getSampleRequestTab($projectId, $_SESSION['userid']);
    }
    $template->assign("sampleRequestTab", $sampleRequestTab);
    $template->display("samplerequestdetails.tpl");
    break;
  case "editApproveRequest":
    $sampleRequestId = getArrayVal($_GET, "id");
    $sampleRequest = new SampleRequest();
    $sampleRequestObj = $sampleRequest->get($sampleRequestId);
    $template->assign("sampleRequest", $sampleRequestObj);
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
    if ($sampleTmp[available_count] <= 0) {
      echo "notenough";
      break;
    }
    $ret1 = $sampleRequest->approve($sampleRequestId, $_SESSION['userid'], $commit);
    $ret2 = $sample->reduceCount($sampleRequestTmp[sample]);
    if ($ret2 && $ret1) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "editRejectRequest":
    $sampleRequestId = getArrayVal($_GET, "id");
    $sampleRequest = new SampleRequest();
    $sampleRequestObj = $sampleRequest->get($sampleRequestId);
    $template->assign("sampleRequest", $sampleRequestObj);
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
    if ($ret2 && $ret1) {
      echo "Ok";
    } else {
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
    $ret1 = $sampleRequest->reject($sampleRequestId, $_SESSION['userid'], $commit);
    if (ret1) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "delmember":
    $userId = getArrayVal($_GET, "userId");
    $projectId = getArrayVal($_GET, "projectId");
    $project = new Project();
    $ret = $project->deassign($userId, $projectId);
    if ($ret) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "reloadmember":
    $projectId = getArrayVal($_GET, "id");
    $pj = new project();
    $pp = $pj->getProject($projectId);
    $isProjectLeader = $_SESSION['userid'] == $pp['project_leader'];
    $isCustomerLeader = $_SESSION['userid'] == $pp['customer_leader'];
    $isSupplierLeader = $_SESSION['userid'] == $pp['supplier_leader'];
    $_roleType = $_SESSION['userRole'];
    $editBaseInfo = false;
    $editBaseInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editBaseInfo", $editBaseInfo);
    $editSampleInfo = false;
    $editSampleInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4);
    $template->assign("editSampleInfo", $editSampleInfo);
    $editSampleRequestInfo = false;
    $editSampleRequestInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 5);
    $template->assign("editSampleRequestInfo", $editSampleRequestInfo);
    $editTeamInfo = false;
    $editTeamInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 5) || ($_roleType == 6);
    $template->assign("editTeamInfo", $editTeamInfo);
    $addEcnInfo = false;
    $addEcnInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader) || ($_roleType == 5);
    $template->assign("addEcnInfo", $addEcnInfo);
    $editPhase = false;
    $editPhase = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editPhase", $editPhase);
    $addOrder = false;
    $addOrder = $_roleType == 6;
    $template->assign("addOrder", $addOrder);
    $pricePurchase = false;
    $pricePurchase = $_roleType == 8;
    $template->assign("pricePurchase", $pricePurchase);
    $orderDetailInfo = false;
    $orderDetailInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 6);
    ;
    $template->assign("orderDetailInfo", $orderDetailInfo);
    $editPurchaseInfo = false;
    $editPurchaseInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader) || ($_roleType == 8);
    $template->assign("editPurchaseInfo", $editPurchaseInfo);
    $projectId = getArrayVal($_GET, "id");
    $projectTabs = new ProjectTabs;
    $members = $projectTabs->getMemberTab($projectId);
    $template->assign("memberTab", $members);
    $template->display("memberdetails.tpl");
    break;

  case "addMember":
    $projectTmp = getArrayVal($_POST, "projectId");
    $availablemembers = getArrayVal($_POST, "members");
    $members = explode(",", $availablemembers);
    $project = new project();
    $flag = false;
    foreach ($members as $member) {
      $projectId = $project->assign($member, $projectTmp);
      $flag = true;
    }
    if ($flag) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "addOrder":
    $project = getArrayVal($_POST, "projectId");
    $orderName = getArrayVal($_POST, "orderName");
    $orderQuantity = getArrayVal($_POST, "orderQuantity");
    $orderTime = getArrayVal($_POST, "orderTime");
    $orderDesc = getArrayVal($_POST, "orderDesc");
    $order = new Order();
    $orderId = $order->add($orderName, $project, $orderQuantity, $orderDesc, $orderTime, 14);
    if ($orderId) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "priceOrder":
    $orderId = getArrayVal($_GET, "id");
    $order = new Order();
    $orderObj = $order->get($orderId);
    $template->assign("order", $orderObj);
    $template->assign("currency", Currency::$Currencys);
    $template->assign("flag", Flag::$Flags);
    $template->assign("templateName", "priceOrderDlg.tpl");
    $template->display("dlgmodal.tpl");
    break;
  case "saveOrder":
    $project = getArrayVal($_POST, "projectId");
    $editOrderId = getArrayVal($_POST, "orderId");
    $editEndTime = getArrayVal($_POST, "endTime");
    $editCurrencyInner = getArrayVal($_POST, "currencyInner");
    $editPublished = getArrayVal($_POST, "published");
    $editCurrencyExt = getArrayVal($_POST, "currencyExt");
    $editInnerCost = getArrayVal($_POST, "innerCost");
    $editExternalCost = getArrayVal($_POST, "externalCost");
    $order = new Order();
    $orderId = $order->updatePrice($editOrderId, $editEndTime, $editInnerCost, $editCurrencyInner, $editExternalCost, $editCurrencyExt, $editPublished);
    if ($orderId) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "reloadorder":
    $projectId = getArrayVal($_GET, "id");
    $pj = new project();
    $pp = $pj->getProject($projectId);
    $isProjectLeader = $_SESSION['userid'] == $pp['project_leader'];
    $isCustomerLeader = $_SESSION['userid'] == $pp['customer_leader'];
    $isSupplierLeader = $_SESSION['userid'] == $pp['supplier_leader'];
    $_roleType = $_SESSION['userRole'];
    $editBaseInfo = false;
    $editBaseInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editBaseInfo", $editBaseInfo);
    $editSampleInfo = false;
    $editSampleInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4);
    $template->assign("editSampleInfo", $editSampleInfo);
    $editSampleRequestInfo = false;
    $editSampleRequestInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 5);
    $template->assign("editSampleRequestInfo", $editSampleRequestInfo);
    $editTeamInfo = false;
    $editTeamInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 5) || ($_roleType == 6);
    $template->assign("editTeamInfo", $editTeamInfo);
    $addEcnInfo = false;
    $addEcnInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader) || ($_roleType == 5);
    $template->assign("addEcnInfo", $addEcnInfo);
    $editPhase = false;
    $editPhase = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editPhase", $editPhase);
    $addOrder = false;
    $addOrder = $_roleType == 6;
    $template->assign("addOrder", $addOrder);
    $pricePurchase = false;
    $pricePurchase = $_roleType == 8;
    $template->assign("pricePurchase", $pricePurchase);
    $orderDetailInfo = false;
    $orderDetailInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 6);
    ;
    $template->assign("orderDetailInfo", $orderDetailInfo);
    $editPurchaseInfo = false;
    $editPurchaseInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader) || ($_roleType == 8);
    $template->assign("editPurchaseInfo", $editPurchaseInfo);
    $projectId = getArrayVal($_GET, "id");
    $projectTabs = new ProjectTabs;
    if($isCustomerLeader){
        $orderTab = $projectTabs->getOrderTabByCustomer($projectId,$_SESSION['userid']);
    }else if($isProjectLeader){
        $orderTab = $projectTabs->getOrderTab($projectId);
    }else{
      $orderTab = $projectTabs->getOrderTab($projectId);
    }
    $template->assign("orderTab", $orderTab);
    $template->display("orderdetails.tpl");
    break;
  case "agreeOrder":
    $editOrderId = getArrayVal($_GET, "orderId");
    $order = new Order();
    $orderId = $order->accept($editOrderId);
    if ($orderId) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "rejectOrder":
    $editOrderId = getArrayVal($_GET, "orderId");
    $order = new Order();
    $orderId = $order->reject($editOrderId);
    if ($orderId) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "addEcn":
    $project = getArrayVal($_POST, "projectId");
    $ecnName = getArrayVal($_POST, "ecnName");
    $description = getArrayVal($_POST, "ecnDescription");
    $deliverable = getArrayVal($_POST, "deliverable");
    $deliverableTmp = new DeliverableItem();
    $deliverableObj = $deliverableTmp->getItem($deliverable);
    $enc = new EngineeringChangeNote();
    $encId = $enc->add($ecnName, $description, $project, $deliverableObj[phase], $deliverable);
    if ($encId) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "reloadecn":
    $projectId = getArrayVal($_GET, "id");
    $pj = new project();
    $pp = $pj->getProject($projectId);
    $isProjectLeader = $_SESSION['userid'] == $pp['project_leader'];
    $isCustomerLeader = $_SESSION['userid'] == $pp['customer_leader'];
    $isSupplierLeader = $_SESSION['userid'] == $pp['supplier_leader'];
    $_roleType = $_SESSION['userRole'];
    $editBaseInfo = false;
    $editBaseInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editBaseInfo", $editBaseInfo);
    $editSampleInfo = false;
    $editSampleInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4);
    $template->assign("editSampleInfo", $editSampleInfo);
    $editSampleRequestInfo = false;
    $editSampleRequestInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 5);
    $template->assign("editSampleRequestInfo", $editSampleRequestInfo);
    $editTeamInfo = false;
    $editTeamInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 5) || ($_roleType == 6);
    $template->assign("editTeamInfo", $editTeamInfo);
    $addEcnInfo = false;
    $addEcnInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader) || ($_roleType == 5);
    $template->assign("addEcnInfo", $addEcnInfo);
    $editPhase = false;
    $editPhase = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editPhase", $editPhase);
    $addOrder = false;
    $addOrder = $_roleType == 6;
    $template->assign("addOrder", $addOrder);
    $pricePurchase = false;
    $pricePurchase = $_roleType == 8;
    $template->assign("pricePurchase", $pricePurchase);
    $orderDetailInfo = false;
    $orderDetailInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 6);
    ;
    $template->assign("orderDetailInfo", $orderDetailInfo);
    $editPurchaseInfo = false;
    $editPurchaseInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader) || ($_roleType == 8);
    $template->assign("editPurchaseInfo", $editPurchaseInfo);
    $projectTabs = new ProjectTabs;
    if(($_SESSION['userRole'] == 4 && $isProjectLeader) || $_SESSION['userRole'] == 1 || $_SESSION['userRole'] == 3){
      $eccs = $projectTabs->getEcnTab($projectId, null);
    }else{
      $eccs = $projectTabs->getEcnTab($projectId, $_SESSION['userid']);
    }
    $template->assign("ecnTab", $eccs);
    $template->display("ecndetails.tpl");
    break;

  case "editApproveEcn":
    $ecnId = getArrayVal($_GET, "id");
    $ecn = new EngineeringChangeNote();
    $ecnObj = $ecn->get($ecnId);
    $template->assign("ecn", $ecnObj);
    $template->assign("templateName", "approveEcnDlg.tpl");
    $template->display("dlgmodal.tpl");
    break;
  case "editRejectEcn":
    $ecnId = getArrayVal($_GET, "id");
    $ecn = new EngineeringChangeNote();
    $ecnObj = $ecn->get($ecnId);
    $template->assign("ecn", $ecnObj);
    $template->assign("templateName", "rejectEcnDlg.tpl");
    $template->display("dlgmodal.tpl");
    break;

  case "approveEcn":
    $ecnId = getArrayVal($_POST, "ecnId");
    $commit = getArrayVal($_POST, "commit");
    $ecn = new EngineeringChangeNote();
    $ret1 = $ecn->approve($ecnId, $_SESSION['userid'], $commit);
    if ($ret1) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "rejectEcn":
    $ecnId = getArrayVal($_POST, "ecnId");
    $commit = getArrayVal($_POST, "commit");
    $ecn = new EngineeringChangeNote();
    $ret1 = $ecn->reject($ecnId, $_SESSION['userid'], $commit);
    if ($ret1) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "addPurchase":
    $project = getArrayVal($_POST, "projectId");
    $purchaseName = getArrayVal($_POST, "purchaseName");
    $purchaseQuantity = getArrayVal($_POST, "purchaseQuantity");
    $purchaseDesc = getArrayVal($_POST, "purchaseDesc");
    $purchase = new Purchase();
    $purchaseId = $purchase->add($purchaseName, $project, $purchaseQuantity, $purchaseDesc, 32);
    if ($purchaseId) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;

  case "reloadpurchase":
    $projectId = getArrayVal($_GET, "id");
    $pj = new project();
    $pp = $pj->getProject($projectId);
    $isProjectLeader = $_SESSION['userid'] == $pp['project_leader'];
    $isCustomerLeader = $_SESSION['userid'] == $pp['customer_leader'];
    $isSupplierLeader = $_SESSION['userid'] == $pp['supplier_leader'];
    $_roleType = $_SESSION['userRole'];
    $editBaseInfo = false;
    $editBaseInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editBaseInfo", $editBaseInfo);
    $editSampleInfo = false;
    $editSampleInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4);
    $template->assign("editSampleInfo", $editSampleInfo);
    $editSampleRequestInfo = false;
    $editSampleRequestInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 5);
    $template->assign("editSampleRequestInfo", $editSampleRequestInfo);
    $editTeamInfo = false;
    $editTeamInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 5) || ($_roleType == 6);
    $template->assign("editTeamInfo", $editTeamInfo);
    $addEcnInfo = false;
    $addEcnInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader) || ($_roleType == 5);
    $template->assign("addEcnInfo", $addEcnInfo);
    $editPhase = false;
    $editPhase = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader);
    $template->assign("editPhase", $editPhase);
    $addOrder = false;
    $addOrder = $_roleType == 6;
    $template->assign("addOrder", $addOrder);
    $pricePurchase = false;
    $pricePurchase = $_roleType == 8;
    $template->assign("pricePurchase", $pricePurchase);
    $orderDetailInfo = false;
    $orderDetailInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4) || ($_roleType == 6);
    ;
    $template->assign("orderDetailInfo", $orderDetailInfo);
    $editPurchaseInfo = false;
    $editPurchaseInfo = $_roleType == 1 || $_roleType == 3 || ($_roleType == 4 and $isProjectLeader) || ($_roleType == 8);
    $template->assign("editPurchaseInfo", $editPurchaseInfo);
    $projectTabs = new ProjectTabs;
    $purchases = $projectTabs->getPurchaseTab($projectId);
    $template->assign("purchaseTab", $purchases);
    $template->display("purchasedetails.tpl");
    break;
  case "pricePurchase":
    $purchaseId = getArrayVal($_GET, "id");
    $purchase = new Purchase();
    $purchaseObj = $purchase->get($purchaseId);
    $template->assign("purchase", $purchaseObj);
    $template->assign("currency", Currency::$Currencys);
    $template->assign("templateName", "pricePurchaseDlg.tpl");
    $template->display("dlgmodal.tpl");
    break;

  case "savePurchase":
    $project = getArrayVal($_POST, "projectId");
    $editPurchaseId = getArrayVal($_POST, "purchaseId");
    $editEndTime = getArrayVal($_POST, "endTime");
    $editCurrencyPrice = getArrayVal($_POST, "currencyPrice");
    $editPrice = getArrayVal($_POST, "price");
    $purchase = new Purchase();
    $purchaseId = $purchase->updatePrice($editPurchaseId, $editEndTime, $editPrice, $editCurrencyPrice);
    if ($purchaseId) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "agreePurchase":
    $editPurchaseId = getArrayVal($_GET, "purchaseId");
    $purchase = new Purchase();
    $purchaseId = $purchase->accept($editPurchaseId);
    if ($purchaseId) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "rejectPurchase":
    $editPurchaseId = getArrayVal($_GET, "purchaseId");
    $purchase = new Purchase();
    $purchaseId = $purchase->reject($editPurchaseId);
    if ($purchaseId) {
      echo "Ok";
    } else {
      echo "Fail";
    }
    break;
  case "getTasksBydeliverableId":
    $deliverableId = getArrayVal($_GET,"deliverableId");
    $deliverableItem = new DeliverableItem();
    $deliverableObj = $deliverableItem->getItem($deliverableId);
    $tasks = $deliverableObj["tasks"];
    $startDate = substr($deliverableObj['start_date'],0,10);
    $endDate = substr($deliverableObj['end_date'],0,10);
    echo "{";
    echo "'startDate':'$startDate',";
    echo "'endDate':'$endDate',";
    echo "'tasks':[";
    $str = "";
    foreach ($tasks as $tk) {
        $tkId = $tk["ID"];
        $tkName = $tk["title"];
        $str = $str."{";
        $str = $str."'id':'$tkId',";
        $str = $str."'name':'$tkName'";
        $str = $str."},";
    }
    $str = substr($str,0, -1);
    echo $str;
    echo "]";
    echo "}";
    break;
  default:
    break;
}
?>
