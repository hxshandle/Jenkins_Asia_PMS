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
  $projects = $jUtils->getAllProjects();
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
case "deleteDocument":
  $id = getArrayVal($_GET, "id");
  $doc = new Document();
  $ret = $doc->delete($id);
  if($ret){
    echo "OK";
  }else{
    echo "Fail";
  }
  break;
case "addDocument":
  $isAjax = getArrayVal($_POST,'isAjax');
  $docName = getArrayVal($_POST,"name");
  $docNo = getArrayVal($_POST,"documentNo");
  $docVer = getArrayVal($_POST,"revision");
  $docDesc = getArrayVal($_POST,"description");
  $fileId = getArrayVal($_POST,"fileId");
  $projectId = getArrayVal($_POST,"project");
  $taskId = getArrayVal($_POST,"task");
  $orderId = getArrayVal($_POST,"order");
  $qualityId = getArrayVal($_POST,"quality");
  $visibility = getArrayVal($_POST,"visibility");
  $ecnId = getArrayVal($_POST, "ecn");
  $visibilityVal = "";
  foreach($visibility as $vis){
    $visibilityVal .= $vis.",";
  }
  $doc = new Document();
  $doc->add($docName,$docNo,$docVer,$docDesc,$fileId,$projectId,$taskId,$orderId,$qualityId,$visibilityVal,$ecnId);
  $loc = $url . "managedocument.php?action=mydocument";
  if($isAjax == '1'){
    $loc = $url."managedocument.php?action=selectDocuments";
  }
  header("Location: $loc");
  break;
case "filterDocument":
  $projectId = getArrayVal($_POST,"projectId");
  $orderId = getArrayVal($_POST,"orderId");
  $customerName = getArrayVal($_POST,"customerName");
  $isSelectedTable = getArrayVal($_POST,"isSelectedTable");
  $doc = new Document();
  $documents = $doc->filterDocuments($projectId,$orderId,$customerName);
  $template->assign("documents",$documents);
  if($isSelectedTable == 1){
    $template->display("selectDocumentsTable.tpl");
  }else{
    $template->display("documentsTable.tpl");  
  }
  
  break;
case "selectDocuments":
  $doc = new Document();
  $project = new project();
  $ecnId = getArrayVal($_GET, "ecnId");
  if(!$ecnId){
    $ecnId = "-1";
  }
  $template->assign("ecnId",$ecnId);
  
  $projects =$jUtils->getAllProjects();
  $template->assign("projects",$projects);
  $customers = $jUtils->getAllCustomers();
  $template->assign("customers",$customers);
  $orders = $jUtils->getAllOrders();
  $template->assign("orders",$orders);
  $template->assign("projectId",-1);
  $documents = $doc->getLatesUpdatedDocuments();
  $template->assign("documents",$documents);
  $template->display("selectDocuments.tpl");
  break;
default:
  break;
}
?>
