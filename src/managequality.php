<?php
require("./init.php");
// check if user is logged in
if (!isset($_SESSION["userid"]))
{
    $template->assign("loginerror", 0);
    $template->display("login.tpl");
    die();
}
$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}
$jUtils = new JUtils();

switch ($action) {
  case "showproject":
    $id = getArrayVal($_GET, "id");
    if(!$id){
      $id = -1;
    }
    $orderId = getArrayVal($_GET,"orderId");
    if(!$orderId){
      $orderId = -1;
    }
    $myproject = new project();
    $quality = new Quality();
    $pro = $myproject->getProject($id);
    $qualityList = array();
    if($_SESSION["userRole"]>5){
        $myProjects = $jUtils->getAllProjects();
        foreach($myProjects as $p){
          $qualityList = array_merge($qualityList,$quality->filterQuality($p['ID'],"-1","-1"));  
        }
    }
    $projects = $jUtils->getAllProjects();
    $template->assign("projects",$projects);
    $customers = $jUtils->getAllCustomers();
    $template->assign("customers",$customers);
    $orders = $jUtils->getAllOrders();
    $template->assign("orders",$orders);
    $projectname = $pro['name'];
    $template->assign("project", $pro);
    $template->assign("projectId", $id);
    $template->assign("qualitys", $qualityList);
    $template->assign("orderId", $orderId);
    $template->assign("projectname", $projectname);
    $template->assign("qualityDetailsStatus",Status::getStatusByType("qualityDetails"));
    $template->display("projectquality.tpl");
    break;
  case "saveDetails":
    $quality = getArrayVal($_POST, "quality");
    $status = getArrayVal($_POST, "status");
    $rejectDesc = getArrayVal($_POST, "rejectDesc");
    $quantity = getArrayVal($_POST, "quantity");
    $requiredDesc = getArrayVal($_POST, "requiredDesc");
    $rootCause = getArrayVal($_POST, "rootCause");
    $containmentAction = getArrayVal($_POST, "containmentAction");
    $supplierShortTermCorrectiveAct = getArrayVal($_POST, "supplierShortTermCorrectiveAct");
    $shotTermImplementationDate = getArrayVal($_POST, "shotTermImplementationDate");
    $shortTermVerified = getArrayVal($_POST, "shortTermVerified");
    $supplierLongTermCorrectiveAct = getArrayVal($_POST, "supplierLongTermCorrectiveAct");
    $longTermImplementationDate = getArrayVal($_POST, "longTermImplementationDate");
    $longTermVerified = getArrayVal($_POST, "longTermVerified");
    $vendorProcessAuditPlanRevision = getArrayVal($_POST, "vendorProcessAuditPlanRevision");

    $qualityDetails = new QualityDetails();
    $ins = $qualityDetails->add($quality,$status,$rejectDesc,$quantity,$requiredDesc,$rootCause,$containmentAction,$supplierShortTermCorrectiveAct,$shotTermImplementationDate,$shortTermVerified,$supplierLongTermCorrectiveAct,$longTermImplementationDate,$vendorProcessAuditPlanRevision,$longTermVerified);
    Header("Location: managequality.php?action=showEditDlg&id=".$quality); 
    break;
  case "deleteQuality":
      $id = getArrayVal($_GET, "id");
      $quality = new Quality();
      $quality->del($id);
      echo "OK";
      break;
  case "getQualityDetailsInfo":
    $detailsId = getArrayVal($_GET, "detailsId");
    $qualityId = getArrayVal($_GET, "qualityId");
    $qualityDetails = new QualityDetails();
    $data = $qualityDetails->get($detailsId);
    $template->assign("data", $data[0]);
    $template->assign("qualityId", $qualityId);
    $template->assign("detailsId", $detailsId);
    $template->assign("qualityDetailsStatus",Status::getStatusByType("qualityDetails"));
    $template->display("editqualitydetailsinfo.tpl");
    break;
  case "updateDetails":
    $detailsId = getArrayVal($_GET, "detailsId");
    $qualityId = getArrayVal($_GET, "qualityId");
    $quality = getArrayVal($_POST, "quality");
    $status = getArrayVal($_POST,"status");
    $rejectDesc = getArrayVal($_POST, "rejectDesc");
    $quantity = getArrayVal($_POST, "quantity");
    $requiredDesc = getArrayVal($_POST, "requiredDesc");
    $rootCause = getArrayVal($_POST, "rootCause");
    $containmentAction = getArrayVal($_POST, "containmentAction");
    $supplierShortTermCorrectiveAct = getArrayVal($_POST, "supplierShortTermCorrectiveAct");
    $shotTermImplementationDate = getArrayVal($_POST, "shotTermImplementationDate");
    $shortTermVerified = getArrayVal($_POST, "shortTermVerified");
    $supplierLongTermCorrectiveAct = getArrayVal($_POST, "supplierLongTermCorrectiveAct");
    $longTermImplementationDate = getArrayVal($_POST, "longTermImplementationDate");
    $longTermVerified = getArrayVal($_POST, "longTermVerified");
    $vendorProcessAuditPlanRevision = getArrayVal($_POST, "vendorProcessAuditPlanRevision");
    $fileId = getArrayVal($_POST, "fileId");
    $qualityDetails = new QualityDetails();
    $ins = $qualityDetails->update($detailsId,$status,$rejectDesc,$quantity,$requiredDesc,$rootCause,$containmentAction,$supplierShortTermCorrectiveAct,$shotTermImplementationDate,$shortTermVerified,$supplierLongTermCorrectiveAct,$longTermImplementationDate,$vendorProcessAuditPlanRevision,$longTermVerified);
    
    if(!empty($fileId)){
        $qualityDetails->attachFile($detailsId,$fileId);
    } 
    Header("Location: managequality.php?action=showEditDlg&id=".$qualityId);
    
    break;
   case "saveQuality":
    $mode = getArrayVal($_POST,"mode");
    if(!$mode){
      $mode = "add";
    }
    $qId = getArrayVal($_POST,"qId");
    $orderId = getArrayVal($_POST,"orderId");
    $projectId = getArrayVal($_POST,"projectId");
    $project = getArrayVal($_POST,"project");
    if($project != -1){
      $projectId = $project;
    }
    $actionNo = getArrayVal($_POST, "actionNo");
    $qualityNo = getArrayVal($_POST, "qualityNo");
    $issueDate = getArrayVal($_POST, "issueDate");
    $productNo = getArrayVal($_POST, "productNo");
    $productDesc = getArrayVal($_POST, "productDesc");
    $shipNo = getArrayVal($_POST, "shipNo");
    $lotQuantity = getArrayVal($_POST, "lotQuantity");
    $sampleSize = getArrayVal($_POST, "sampleSize");
    $defects = getArrayVal($_POST, "defects");
    $rejectRate = getArrayVal($_POST, "rejectRate");
    $quantityInInventory = getArrayVal($_POST, "quantityInInventory");
    $quantityInProcess = getArrayVal($_POST, "quantityInProcess");
    $containmentDesc = getArrayVal($_POST, "containmentDesc");
    $acknowledgeBy = getArrayVal($_POST, "acknowledgeBy");
    $acknowledgeDate = getArrayVal($_POST, "acknowledgeDate");
    $verifiedForClosureBy = getArrayVal($_POST, "verifiedForClosureBy");
    $verificationDate = getArrayVal($_POST, "verificationDate");
    $statusUpdate = getArrayVal($_POST, "statusUpdate");
    $oldStatusUpdate = getArrayVal($_POST,"oldStatusUpdate");
    if(strlen($statusUpdate) != strlen($oldStatusUpdate)){
      $dateFormat = CL_DATEFORMAT." H:i:s";
      $today = date($dateFormat);
      $statusUpdate .= " --".$_SESSION['username']." ".$today;
    }
    $statusUpdate = '';
    $notify = getArrayVal($_POST,"notify");
    $quality = new Quality();
    $ret = false;
    if($mode == "add"){
      $ret = $quality->add($projectId,$actionNo,$qualityNo,$issueDate,$productNo,$productDesc,$shipNo,$statusUpdate,$lotQuantity,$sampleSize,$defects,$rejectRate,$quantityInInventory,$quantityInProcess,$containmentDesc,$acknowledgeBy,$acknowledgeDate,$verifiedForClosureBy,$verificationDate,1,$orderId);
      if($ret){
        foreach($notify as $n){
          $quality->addNotifyList($ret,$n);
        }
      }
      $jUtils->sendQualityMail($ret,$settings,true);
    }else{
        $ret = $quality->update($qId,$actionNo,$qualityNo,$issueDate,$productNo,$productDesc,$shipNo,$statusUpdate,$lotQuantity,$sampleSize,$defects,$rejectRate,$quantityInInventory,$quantityInProcess,$containmentDesc,$acknowledgeBy,$acknowledgeDate,$verifiedForClosureBy,$verificationDate,1);
        if($ret){
        $quality->clearNotify($qId);
        foreach($notify as $n){
          $quality->addNotifyList($qId,$n);
          }
          $jUtils->sendQualityMail($qId,$settings,false);
        }
        
        Header("Location: managequality.php?action=showEditDlg&id=".$qId);
        return;
    }
    
    $loc = $url."managequality.php?action=showproject&id=$projectId&orderId=$orderId";
    header("Location: $loc");
    
    break;
  case "filterQuality":
     $projectId = getArrayVal($_POST,"projectId");
     $orderId = getArrayVal($_POST,"orderId");
     $customerName = getArrayVal($_POST,"customerName");
     $quality = new Quality();
     $qualityList = $quality->filterQuality($projectId,$orderId,$customerName);
     $template->assign("qualitys", $qualityList);
     $template->display("qualityTable.tpl");
    break;
  case "getProjectQuality":
    $id = getArrayVal($_POST, "id");
    echo $jUtils->getQualitiesByProjectId($id);
    break;
  case "showEditDlg":
    $id = getArrayVal($_GET, "id");
    $quality = new Quality();
    $q = $quality->get($id);
    $template->assign("quality", $q);
    $memberList = $jUtils->getProjectNotifyList($q['project']);
    $template->assign("memberList",$memberList);
    $notifyList = $quality->getNotifyList($id);
    $qualityDetails = new QualityDetails();
    $template->assign("projectId",$q['project']);
    $detailsList = $qualityDetails->getQualityDetailsByQualityId($id);
    $projects = $jUtils->getAllProjects();
    $template->assign("projects",$projects);
    $customers = $jUtils->getAllCustomers();
    $template->assign("qualityDetailsStatus",Status::getStatusByType("qualityDetails"));
    $template->assign("customers",$customers);
    $template->assign("details", $detailsList);
    $template->assign("qualityId", $id);
    $template->assign("notifyList",$notifyList);
    $groupedNotifyList = $jUtils->groupUsers($memberList);
    $template->assign("groupedNotifyList",$groupedNotifyList);

    $template->display("editQualityDlg.tpl");
    break;
  case 'printPreview':
    $id = getArrayVal($_GET, "id");
    $quality = new Quality();
    $q = $quality->get($id);
    $template->assign("quality", $q);
    $qualityDetails = new QualityDetails();
    $detailsList = $qualityDetails->getQualityDetailsByQualityId($id);
    $template->assign("details", $detailsList);
    $template->display("printquality.tpl");
    break;
  default:
    break;
}
?>