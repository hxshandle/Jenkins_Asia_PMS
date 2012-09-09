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


switch ($action) {
  case "showproject":
    $id = getArrayVal($_GET, "id");
    $orderId = getArrayVal($_GET,"orderId");
    if(!$orderId){
      $orderId = -1;
    }
    $myproject = new project();
    $quality = new Quality();
    $pro = $myproject->getProject($id);
    $qualityList = $quality->getQualityByProjectId($id);
    $projectname = $pro['name'];
    $template->assign("project", $pro);
    $template->assign("projectId", $id);
    $template->assign("qualitys", $qualityList);
    $template->assign("orderId", $orderId);
    $template->assign("projectname", $projectname);
    $template->display("projectquality.tpl");
    break;
  case "saveDetails":
    $projectId = getArrayVal($_GET, "pId");
    $quality = getArrayVal($_POST, "quality");
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
    $ins = $qualityDetails->add($quality,$rejectDesc,$quantity,$requiredDesc,$rootCause,$containmentAction,$supplierShortTermCorrectiveAct,$shotTermImplementationDate,$shortTermVerified,$supplierLongTermCorrectiveAct,$longTermImplementationDate,$vendorProcessAuditPlanRevision,$longTermVerified);
    Header("Location: managequality.php?action=showproject&id=".$projectId); 
    break;
  case "getQualityDetailsInfo":
    $detailsId = getArrayVal($_GET, "detailsId");
    $projectId = getArrayVal($_GET, "projectId");
    $qualityDetails = new QualityDetails();
    $data = $qualityDetails->get($detailsId);
    $template->assign("data", $data[0]);
    $template->assign("projectId", $projectId);
    $template->assign("detailsId", $detailsId);
    $template->display("editqualitydetailsinfo.tpl");
    break;
  case "updateDetails":
    $detailsId = getArrayVal($_GET, "detailsId");
    $projectId = getArrayVal($_GET, "projectId");
    $quality = getArrayVal($_POST, "quality");
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
    $ins = $qualityDetails->update($detailsId,$rejectDesc,$quantity,$requiredDesc,$rootCause,$containmentAction,$supplierShortTermCorrectiveAct,$shotTermImplementationDate,$shortTermVerified,$supplierLongTermCorrectiveAct,$longTermImplementationDate,$vendorProcessAuditPlanRevision,$longTermVerified);
    
    if(!empty($fileId)){
        $qualityDetails->attachFile($detailsId,$fileId);
    } 
    Header("Location: managequality.php?action=showproject&id=".$projectId);
    
    break;
   case "saveQuality":
    $mode = getArrayVal($_POST,"mode");
    if(!$mode){
      $mode = "add";
    }
    $qId = getArrayVal($_POST,"qId");
    $orderId = getArrayVal($_POST,"orderId");
    $projectId = getArrayVal($_POST,"projectId");
    $actionNo = getArrayVal($_POST, "actionNo");
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
    $quality = new Quality();
    $ret = false;
    if($mode == "add"){
      $ret = $quality->add($projectId,$actionNo,$issueDate,$productNo,$productDesc,$shipNo,$lotQuantity,$sampleSize,$defects,$rejectRate,$quantityInInventory,$quantityInProcess,$containmentDesc,$acknowledgeBy,$acknowledgeDate,$verifiedForClosureBy,$verificationDate,1,$orderId);
    }else{
        $ret = $quality->update($qId,$actionNo,$issueDate,$productNo,$productDesc,$shipNo,$lotQuantity,$sampleSize,$defects,$rejectRate,$quantityInInventory,$quantityInProcess,$containmentDesc,$acknowledgeBy,$acknowledgeDate,$verifiedForClosureBy,$verificationDate,1);
    }
    
    $loc = $url."managequality.php?action=showproject&id=$projectId&orderId=$orderId";
    header("Location: $loc");
    break;
  default:
    break;
}
?>