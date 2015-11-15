<?php
require("init.php");
$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}
$jUtils = new JUtils();

$template->assign("userRole",$_SESSION['userRole']);

switch ($action) {
case "myorder":
  $order = new Order();
  $project = new project();
  $projects = $jUtils->getAllProjects();
  //$orderTab = $order->getOrdersByUser();
  $orderTab = Array();
  $template->assign("orderTab", $orderTab);
  $template->assign("projects",$projects);
  $customers = $jUtils->getAllCustomers();
  $template->assign("customers",$customers);
  //$orders = $jUtils->getAllOrders();
  //$orders =  Array();
  //$template->assign("orders",$orders);
  $template->display("order.tpl");
  break;
case "addOrder":
  $projectId = getArrayVal($_POST,"project");
  $orderName = getArrayVal($_POST, "newOrderName");
  $orderQuantity = getArrayVal($_POST, "newOrderQuantity");
  $orderTime = getArrayVal($_POST, "newOrderTime");
  $orderDesc = getArrayVal($_POST, "newOrderDesc");
  $customerPoNumber = getArrayVal($_POST, "newCustomerPoNumber");
  $files = getArrayVal($_POST, "files");
  $deliveryDateOne = getArrayVal($_POST, "newDeliveryDateOne");
  $deliveryDateTwo = getArrayVal($_POST, "newDeliveryDateTwo");
  $qualityIssueNote = getArrayVal($_POST, "qualityIssueNote");
  $ECNNote = getArrayVal($_POST, "ECNNote");
  $compliance = getArrayVal($_POST,"compliance");
  $arrFiles = explode(",",$files);
  $fileIds = array();
  foreach($arrFiles as $f){
    $fileItem = explode(":",$f);
    array_push($fileIds,$fileItem[0]);
  }
  $order = new Order();
  $st = Status::getId("order", "submitted");
  $orderId = $order->add($orderName, $projectId, $orderQuantity, $orderDesc, $orderTime, $st,$customerPoNumber,$attachment1,$deliveryDateOne,$deliveryDateTwo);
  if($orderId){
    $order->attachDocument($orderId,$fileIds);
    $order->addQuality($orderId,$qualityIssueNote);
    $order->addECN($orderId,$ECNNote);
    $order->addCompliance($orderId,$compliance);
  }
  $loc = $url . "manageorder.php?action=myorder";
  header("Location: $loc");
  break;
case "filterOrder":
  $projectId = getArrayVal($_POST,"projectId");
  $orderId = getArrayVal($_POST,"orderId");
  $customerName = getArrayVal($_POST,"customerName");
  $order = new Order();
  $orderTab = $order->filterOrder($projectId,$orderId,$customerName);
  $template->assign("orderTab", $orderTab);
  $template->display("orderTable.tpl");
  break;
case "editOrderDlg":
  $orderId = getArrayVal($_GET,"oId");
  $projects = $jUtils->getAllProjects();
  $template->assign("projects",$projects);
  $order = new Order();
  $orderItem = $order->get($orderId);
  $template->assign("status", Status::getStatusByType("order1"));
  $template->assign("orderStatus", Status::getStatusByType("order"));
  $template->assign("order", $orderItem);
  $orderQualitys = $order->getOrderTrackedQualities($orderId);
  $orderECNs = $order->getOrderTrackedECNs($orderId);
  $template->assign("qualityIssueNotes", $orderQualitys);
  $template->assign("ecns", $orderECNs);
  $compliances = $order->getOrderCompliances($orderId);
  $template->assign("compliances",$compliances);
  $template->display("editOrderForm.tpl");
  break;
case "editOrder":
  $orderId = getArrayVal($_POST, "orderId");
  $orderName = getArrayVal($_POST, "orderName");
  $projectId = getArrayVal($_POST, "project");
  $orderQuantity = getArrayVal($_POST, "orderQuantity");
  $orderTime = getArrayVal($_POST, "orderTime");
  $orderDesc = getArrayVal($_POST, "orderDesc");
  $attachment1 = getArrayVal($_POST, "attachment1");
  $jenkinsPoNumber = getArrayVal($_POST, "jenkinsPoNumber");
  $attachment2 = getArrayVal($_POST, "attachment2");
  $factory = getArrayVal($_POST, "factory");
  $terms = getArrayVal($_POST, "terms");
  $accountPayment = getArrayVal($_POST, "accountPayment");
  $customerModelNumber = getArrayVal($_POST, "customerModelNumber");
  $customerPartNumber = getArrayVal($_POST, "customerPartNumber");
  $jenkinsModelNumber = getArrayVal($_POST, "jenkinsModelNumber");
  $jenkinsPartNumber = getArrayVal($_POST, "jenkinsPartNumber");
  $paymentOneSchedule = getArrayVal($_POST, "paymentOneSchedule");
  $paymentOneStatus = getArrayVal($_POST, "paymentStatus1");
  $paymentTwoSchedule = getArrayVal($_POST, "paymentTwoSchedule");
  $paymentTwoStatus = getArrayVal($_POST, "paymentStatus2");
  $paymentThreeSchedule = getArrayVal($_POST, "paymentThreeSchedule");
  $paymentThreeStatus = getArrayVal($_POST, "paymentStatus3");  
  $finalTotalAmountReceived = getArrayVal($_POST, "finalTotalAmountReceived");
  $deliveryDateOne = getArrayVal($_POST, "deliveryDateOne");
  $deliveryStatus1 = getArrayVal($_POST, "deliveryStatus1");
  $deliveryDateTwo = getArrayVal($_POST, "deliveryDateTwo");
  $deliveryStatus2 = getArrayVal($_POST, "deliveryStatus2");
  $orderQualityNotes = getArrayVal($_POST,"qualityIssueNote");
  $compliance = getArrayVal($_POST,"orderComplinaces");
  $isFulfilled = getArrayVal($_POST,"fulfilled");
  $waiverDesc = getArrayVal($_POST, "waiverDesc");
  if(!$waiverDesc){
    $waiverDesc = "";
  }
  $orderECNs = getArrayVal($_POST,"ecnNote");
  $docs = getArrayVal($_POST,"files");
  $arrFiles = $jUtils->getUploadedFileIds($docs);
  $paymentOneAttachment = getArrayVal($_POST,"paymentfiles1");
  $arrP1Files = $jUtils->getUploadedFileIds($paymentOneAttachment);
  $paymentTwoAttachment = getArrayVal($_POST,"paymentfiles2");
  $arrP2Files = $jUtils->getUploadedFileIds($paymentTwoAttachment);
  $paymentThreeAttachment = getArrayVal($_POST,"paymentfiles3");
  $arrP3Files = $jUtils->getUploadedFileIds($paymentThreeAttachment);
  $compliancefilesAttachement = getArrayVal($_POST,"compliancefiles");
  $arrComplianceFiles = $jUtils->getUploadedFileIds($compliancefilesAttachement);

  $order = new Order();
  $upd = $order->updateOrder($orderId,$projectId,$orderName,$orderQuantity, $orderTime, $orderDesc,
                      $arrFiles, $jenkinsPoNumber, $attachment2,$factory,$terms,$accountPayment,
                      $customerModelNumber,$customerPartNumber,$jenkinsModelNumber,$jenkinsPartNumber,
                      $paymentOneSchedule,$paymentOneStatus,$arrP1Files,$paymentTwoSchedule,
                      $paymentTwoStatus,$arrP2Files,$paymentThreeSchedule,$paymentThreeStatus,
                      $arrP3Files,$arrComplianceFiles,$finalTotalAmountReceived,$deliveryDateOne,$deliveryStatus1,
                      $deliveryDateTwo,$deliveryStatus2,$waiverDesc,$isFulfilled);
  if($upd){
    $order->updateOrderQualityNotes($orderId,$orderQualityNotes);
    $order->updateOrderECNs($orderId,$orderECNs);
    $order->updateOrderCompliances($orderId,$compliance);
    
  }
  $template->display("editOrderFormSuccess.tpl");
  break;
case "showOrderSubInfo":
  $orderId = getArrayVal($_GET, "oId");
  $order = new Order();
  $orderItem = $order->get($orderId);
  $template->assign("order", $orderItem);
  $template->display("ordersubinfo.tpl");
  break;
default:
  break;
}
?>
