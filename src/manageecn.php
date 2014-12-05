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
  $ecn = new EngineeringChangeNote();
  $deliverable = new DeliverableItem();
  $d = $deliverable->getItem($deliverableItemId);
  $ecnId = $ecn->add($newEcnName, $desc, $projectId, $d['phase'], -1,$orderId,$qualityId);
  if($ecnId){
    // insert impacts
    $impacts = new ECNImpacts();
    $impacts->addImpacts($ecnId,$_POST['ecnImpact']);
  }
  $loc = $url."manageecn.php?action=showecn";
  header("Location: $loc");
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
  $ecnIns = $ecn->get($ecnId);
  $doc = new Document();
  $documents = $doc->getDocumentsByECNId($ecnId);
  $template->assign("documents",$documents);
  $template->assign("ecn",$ecnIns);
  $template->display("viewECNFile.tpl");
}


?>