<?php
require("init.php");
$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}
$jUtils = new JUtils();

switch ($action) {
case "showecn":
  $doc = new Document();
  $project = new project();
  $projects = $jUtils->getAllProjects();
  $template->assign("projects",$projects);
  $customers = $jUtils->getAllCustomers();
  $template->assign("customers",$customers);
  $orders = $jUtils->getAllOrders();
  $template->assign("orders",$orders);
  $template->assign("projectId",-1);
  $ecn = new EngineeringChangeNote();
  $encs = $ecn->getEncs();
  $template->assign("ecntable",$encs);
  $template->display("ecn.tpl");
  break;
case "addEcn":
  $projectId = getArrayVal($_POST, "project");
  $orderId = getArrayVal($_POST, "selOrder");
  $qualityId = getArrayVal($_POST, "selQuality");
  $newEcnName = getArrayVal($_POST, "newEcnName");
  $desc = getArrayVal($_POST, "newEcnDescription");
  $recommandAction = getArrayVal($_POST, "recommand_action");
  $notifies = getArrayVal($_POST,"notify");
  $approvedBy = getArrayVal($_POST,"approved_by");
  $ecn = new EngineeringChangeNote();
  $deliverable = new DeliverableItem();
  $d = $deliverable->getItem($deliverableItemId);
  $ecnId = $ecn->add($newEcnName, $desc, $projectId, $d['phase'], -1,$orderId,$qualityId,$recommandAction,$approvedBy);
  if($ecnId){
    // insert impacts
    $impacts = new ECNImpacts();
    $impacts->addImpacts($ecnId,$_POST['ecnImpact']);
    if(!empty($notifies)){
      $mailUtil = new MailUtils();
      $ecnBaseInfo = array(
        "name" => $newEcnName,
        "submitter_comments" => $desc,
        "recommand_action" => $recommandAction
      );
      $mailUtil->sendECNMail($ecnId,$ecnBaseInfo,$notifies);
      $ecn->addNotify($ecnId,$notifies);
    }
  }
  $loc = $url."manageecn.php?action=showecn";
  header("Location: $loc");
  break;
case "updateECN":
  $ecnId = getArrayVal($_GET, "id");
  $ecn = new EngineeringChangeNote();
  $ecnImpacts = new ECNImpacts();
  $ecnImpacts->addImpacts($ecnId,$_POST['ecnImpact']);

  $ecnImpacts->deleteImpacts($_POST['deletedImpacts']);

  $ecn->updatePart($ecnId,$_POST['ecn']);

  $impacts = $ecnImpacts->getImpactsByECNId($ecnId);
  $ecnIns = $ecn->get($ecnId);
  $doc = new Document();
  $documents = $doc->getDocumentsByECNId($ecnId);
  $projectName = $jUtils->getProjectNameById($ecnIns['project']);
  $ecnRequester = $jUtils->getUserName($ecnIns['submitter']);
  $ecnApprovedBy = $jUtils->getUserName($ecnIns['approver']);



  $totalCost = 0;
  foreach ($impacts as $impact) {
    foreach ($impact as $row) {
      $totalCost += $row['disposition_cost'];
    }
  }
  $template->assign("projectName",$projectName);
  $template->assign("ecnId",$ecnId);
  $template->assign("documents",$documents);
  $template->assign("ecnRequester",$ecnRequester);
  $template->assign("ecnApprovedBy",$ecnApprovedBy);
  $template->assign("impacts",$impacts);
  $template->assign("totalCost",$totalCost);
  $template->assign("ecn",$ecnIns);
  $template->display("ecn/editECN.tpl");
  break;
 case "filterECN":
  $projectId = getArrayVal($_POST,"projectId");
  $orderId = getArrayVal($_POST,"orderId");
  $customerName = getArrayVal($_POST,"customerName");
  $ecn = new EngineeringChangeNote();
  $orderTab = $ecn->filterECN($projectId,$orderId,$customerName);
  $template->assign("ecntable", $orderTab);
  $template->display("ecnTable.tpl");
  break;
case "approveOrReject":
  $operation = getArrayVal($_POST,"operation");
  $ecnId = getArrayVal($_POST,"ecnId");
  $ecn = new EngineeringChangeNote();
  if($operation == "approve"){
    $ecn->approve($ecnId, $_SESSION['userid'], "");
  }else{
    $ecn->reject($ecnId, $_SESSION['userid'], "");
  }
  $loc = $url."manageecn.php?action=showecn";
  header("Location: $loc");
  break;
case "viewUploadFile":
  $ecnId = getArrayVal($_GET, "id");
  $ecn = new EngineeringChangeNote();
  $ecnImpacts = new ECNImpacts();
  $impacts = $ecnImpacts->getImpactsByECNId($ecnId);
  $ecnIns = $ecn->get($ecnId);
  $doc = new Document();
  $documents = $doc->getDocumentsByECNId($ecnId);
  $projectName = $jUtils->getProjectNameById($ecnIns['project']);
  $ecnRequester = $jUtils->getUserName($ecnIns['submitter']);
  $ecnApprovedBy = $jUtils->getUserName($ecnIns['approver']);
  $totalCost = 0;
  foreach ($impacts as $impact) {
    foreach ($impact as $row) {
      $totalCost += $row['disposition_cost'];
    }
  }
  $template->assign("projectName",$projectName);
  $template->assign("ecnId",$ecnId);
  $template->assign("documents",$documents);
  $template->assign("ecnRequester",$ecnRequester);
  $template->assign("ecnApprovedBy",$ecnApprovedBy);
  $template->assign("impacts",$impacts);
  $template->assign("totalCost",$totalCost);
  $template->assign("ecn",$ecnIns);
  $canEdit = $ecn->isNotified($ecnId,$_SESSION['userid']);
  if($canEdit){
    $template->display("ecn/editECN.tpl");
  }else{
    $template->display("viewECNFile.tpl");
  }

  //
}





?>