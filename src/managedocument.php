<?php
require("init.php");
$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}
$jUtils = new JUtils();

switch ($action) {
case "mydocument":
  $doc = new Document();
  $project = new project();
  $projects = $project->getProjects(1,100);
  $template->assign("projects",$projects);
  $customers = $jUtils->getAllCustomers();
  $template->assign("customers",$customers);
  $orders = $jUtils->getAllOrders();
  $template->assign("orders",$orders);
  $template->assign("projectId",-1);
  $documents = $doc->getLatesUpdatedDocuments();
  $template->assign("documents",$documents);
  $template->display("document.tpl");
  break;
case "addDocument":
  $docName = getArrayVal($_POST,"name");
  $docVer = getArrayVal($_POST,"revision");
  $docDesc = getArrayVal($_POST,"description");
  $fileId = getArrayVal($_POST,"fileId");
  $projectId = getArrayVal($_POST,"project");
  $taskId = getArrayVal($_POST,"task");
  $orderId = getArrayVal($_POST,"order");
  $qualityId = getArrayVal($_POST,"quality");
  $visibility = getArrayVal($_POST,"visibility");
  $visibilityVal = "";
  foreach($visibility as $vis){
    $visibilityVal .= $vis.",";
  }
  $doc = new Document();
  $doc->add($docName,$docVer,$docDesc,$fileId,$projectId,$taskId,$orderId,$qualityId,$visibilityVal);
  $loc = $url . "managedocument.php?action=mydocument";
  header("Location: $loc");
  break;
case "filterDocument":
  $projectId = getArrayVal($_POST,"projectId");
  $orderId = getArrayVal($_POST,"orderId");
  $customerName = getArrayVal($_POST,"customerName");
  $doc = new Document();
  $documents = $doc->filterDocuments($projectId,$orderId,$customerName);
  $template->assign("documents",$documents);
  $template->display("documentsTable.tpl");

  break;
default:
  break;
}
?>
