<?php

class JUtils
{

  function updateProjectRealDateByDeliverDate($projectId, $strLastEndDate)
  {
    $project = new Project();
    $pro = $project->getProject($projectId);
    $proEndDate = strtotime($pro["end_date"]);
    $proRealEndDate = $pro["read_end_date"];
    $deliverLastEndDate = strtotime($strLastEndDate);
    if ($deliverLastEndDate > $proRealEndDate) {
      $project->updateRealEndDate($projectId, $strLastEndDate);
    }
  }

  function getProjectNameById($id){
    $id = (int) $id;
    $sql = "select name from projekte where id = $id";
    $sel = mysql_query($sql);
    if($sel){
      $arr = mysql_fetch_array($sel);
      return $arr[0];
    }else{
      return "project not found";
    }


  }


  function getValidCCList($arrCC){
    $ret = Array();
    if($arrCC ==  null){
      return null;
    }else{
      foreach ($arrCC as $cc){
        if($this->_validateEmailAddress($cc)){
          array_push($ret,$cc);
        }
      }
    }
    return $ret;

  }

  function _validateEmailCCAddress($arrCC){
    if($arrCC!=null){
      foreach ($arrCC as $cc){
        if(!$this->_validateEmailAddress($cc)){
          return false;
        }
      }
    }
    return true;
  }

  function detechStringEncoding($str){
    return mb_detect_encoding($str, array('GB2312','GBK','ASCII','ISO-8859-1','UTF-8','CP936'));
  }

  function _validateEmailAddress($email){
    return filter_var($email,FILTER_VALIDATE_EMAIL);

  }

  function sendMail($email,$subject,$msg,$arrCC=null,$attachmentPath=null){
    if(!$this->_validateEmailAddress($email)){
      return "Wrong email address -> ".$email;
    }
    $arrCC = $this->getValidCCList($arrCC);
    $set = (object) new settings();
    $settings = $set->getSettings();
    $themail = new emailer($settings);
    $isDelayMail = false;
    if($attachmentPath!=null){
      $fileSize = filesize($attachmentPath);
      if($fileSize>5000000){//5mb
        $attachmentPath=null;
      }
    }
    if(null == $attachmentPath){
      $ret = $themail->send_mail($email, $subject,$msg,$arrCC,$attachmentPath);
    }else{
      $ret = $themail->doDelayMail($email, $subject,$msg,$arrCC,$attachmentPath);
    }

    //
    return $ret;
  }

  function getProjectStructure($id){
    $id = (int) $id;
    $project = array();
    $sql = "select * from projekte where id = $id";
    $proj = $this->Query($sql);
    $proj = $proj[0];
    $_pId = (int) $proj['ID'];
    $phaseSql = "select * from phase where project = $_pId";
    $phases = $this->Query($phaseSql);
    $phaseArr = array();
    foreach ($phases as $phase) {
      $_phaseId = (int) $phase['ID'];
      $deliverableSql = "select * from deliverable_item where phase = $_phaseId";
      $deliverableItems = $this->Query($deliverableSql);
      $deliverableArr = array();
      foreach ($deliverableItems as $deliverableItem) {
        $deliverableArr[$deliverableItem["ID"]] = array("name" =>$deliverableItem['name']);
      }
      $phaseArr[$phase["ID"]] = array("name" => $phase["name"],"deliverableItems" =>$deliverableArr);
    }
    $project[$proj["ID"]] = array("name" => $proj["name"],"phases" =>$phaseArr );
    return $project;
  }

  function Query($sql)
  {
    $sel = mysql_query($sql);
    $ret = array();
    while ($row = mysql_fetch_array($sel)) {
      array_push($ret, $row);
    }
    return $ret;
  }

  function getUserName($id){
    $id = (int)$id;
    $sql = "select `name` from user where id = $id";
    $ret = $this->Query($sql);
    if( count($ret) > 0){
      return $ret[0][0];
    }else{
      return "";
    }
  }

  function updateDeliverItemStatus($deliverId)
  {
    $deliverId = (int) $deliverId;
    $deliverItem = new DeliverableItem();
    $stNotStart = Status::getId("task","not_start");
    $stInProgress = Status::getId("task","in_progress");
    $stDelayed = Status::getId("task","delayed");
    $sql = "select `status`,count(*) as `count` from tasks t where t.`deliverable_item` = $deliverId group by `status`";
    $ret = $this->Query($sql);
    $countArr = array();
    $toalCount = 0;
    $isCompleted = true;
    foreach ($ret as $stCount) {
      $toalCount += $stCount["count"];
      $st = $stCount["status"];
      if($st == $stNotStart || $st == $stInProgress || $st == $stDelayed){
        $isCompleted = false;
      }
    }

    if($isCompleted && $toalCount > 0 ){
      $stDeliverCompleted = Status::getId("deliverable","closed");
      $deliverItem->updateStatus($deliverId,$stDeliverCompleted);
    }
    return $isCompleted && $toalCount > 0 ;
  }

  function updateDeliverItemEndDate($deliverId, $strLastEndDate)
  {
    $deliverItem = new DeliverableItem();
    $deliverObj = $deliverItem->getItem($deliverId);
    $deliverEndDate = strtotime($deliverObj["end_date"]);
    $taskLastEndDate = strtotime($strLastEndDate);
    if ($taskLastEndDate > $deliverEndDate) {
      $deliverItem->updateEndDate($deliverId, $strLastEndDate);
      $this->updateProjectRealDateByDeliverDate($deliverObj["project"], $strLastEndDate);
    }
  }

  function isProjectLeader($projectId)
  {
    $flag = false;
    $project = new project();
    $proj = $project->getProject($projectId);
    if ($proj['project_leader'] == $_SESSION['userid']) {
      $flag = true;
    }
    return $flag;
  }

  function groupUsers($arrUsers)
  {
    $gu = array("admin" => array(), "manager" => array(), "staff" => array(), "customer" => array(), "supplier" => array());
    foreach ($arrUsers as $user) {
      switch ($user["role_type"]) {
        case "1":
        case "2":
          array_push($gu["admin"], $user);
          break;
        case "3":
        case "4":
          array_push($gu["manager"], $user);
          break;
        case "5":
          array_push($gu["staff"], $user);
          break;
        case "6":
        case "7":
          array_push($gu["customer"], $user);
          break;
        case "8":
        case "9":
          array_push($gu["supplier"], $user);
          break;
        default:
          break;
      }
    }
    return $gu;
  }


  function getDelayedTaskMailMsg($mailTo, $title, $text, $link, $taskComments)
  {
    $msg = "";
    $msg .= "Dear " . $mailTo . ",<br/><br/>";
    $msg .= "You have a delayed task request for <b>" . $projectName . "</b><br/>";
    $msg .= "<div style='background-color:#CDCDCD;padding:15px'>";
    $msg .= "<b>Status Update</b>";
    $msg .= "<hr/>";
    $msg .=$this->getTaskCommentsMailMsg($taskComments);
    $msg .= "<hr/>";
    $msg .= "<b>Task Name<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $title . "</p>";
    $msg .= "<hr/>";
    $msg .= "<b>Description</b>";
    $msg .= "<p style='padding-left:15px'>" . $text . "</p>";
    $msg .= "<hr/>";

    //$msg .= "<p style='padding-left:15px'>" . $statusUpdate . "</p>";
    $msg .= "</div>";
    $msg .= "Please click on the link below to access task details and to add any update.<br/><br/>";
    $msg .= "<a href=\"" . $link . "\">Go to task</a><br/><br/>";
    $msg .= "Thank you from JANUS.<br/>";
    //$msg .= "Please do not reply to this mail.<br/>";
    $msg .= "Please login to Janus first before clicking on the link<br/>";
    return $msg;
  }

  function getNewTaskMailMsg($mailTo, $projectName, $start_date, $end_date, $assigner, $link, $title, $text)
  {
    $msg = "";
    $msg .= "Dear " . $mailTo . ",<br/><br/>";
    $msg .= "You have a new task request for <b>" . $projectName . "</b><br/>";
    $msg .= "The task assigned on <b>" . $start_date . "</b> and is due on <b>" . $end_date . "</b> by <b>" . $assigner . "</b><br/>";
    $msg .= "<div style='background-color:#CDCDCD;padding:15px'>";
    $msg .= "<b>Task Name<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $title . "</p>";
    $msg .= "<hr/>";
    $msg .= "<b>Description</b>";
    $msg .= "<p style='padding-left:15px'>" . $text . "</p>";
    $msg .= "<hr/>";
    $msg .= "Please click on the link below to access task details and to add any update.<br/><br/>";
    $msg .= "<a href=\"" . $link . "\">Go to task</a><br/><br/>";
    $msg .= "Thank you from JANUS.<br/>";
    //$msg .= "Please do not reply to this mail.<br/>";
    $msg .= "Please login to Janus first before clicking on the link<br/>";
    return $msg;
  }

  function getTaskCommentsMailMsg($taskComments){
    $msg = '<ul style="list-style:none">';
    foreach($taskComments as $tc){
      $msg .="<li>";
      $msg .=' <div style="font-size:18px;color:#fff;background:#6d83b4;padding-left:12px;line-height:24px;font-style:italic;">';
      $msg .=' <span>'.$tc['commnet_user_name'].'</span>';
      $msg .=' <span style="float:right;padding-right:12px;font-size:12px;">'.$tc['last_update'].'</span>';
      $msg .=" </div>";
      $msg .='<div style="padding:12px;">'.$tc['comment'].'</div>';
      $msg .="</li>";
    }
    $msg .= "</ul>";
    return $msg;
  }
  function getModifiedTaskMailMsg($projectName, $mailTo, $operator, $link, $title, $text, $taskComments)
  {
    $msg = "";
    $msg .= "Dear " . $mailTo . ",<br/><br/>";
    $msg .= "Task updated by " . $operator;
    $msg .= "<br/>";
    $msg .= "<div style='background-color:#CDCDCD;padding:15px'>";
    $msg .= "<b>Status Update</b>";
    $msg .= "<hr/>";
    $msg .=$this->getTaskCommentsMailMsg($taskComments);
    $msg .= "<hr/>";
    $msg .= "<b>Project Name<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $projectName . "</p>";
    $msg .= "<hr/>";
    $msg .= "<b>Task Name<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $title . "</p>";
    $msg .= "<hr/>";
    $msg .= "<b>Description</b>";
    $msg .= "<p style='padding-left:15px'>" . $text . "</p>";
    $msg .= "<hr/>";

    //$msg .= "<p style='padding-left:15px'>" . $statusUpdate . "</p>";

    $msg .= "</div>";
    $msg .= "Please click on the link below to access task details and to add any update.<br/><br/>";
    $msg .= "<a href=\"" . $link . "\">Go to task</a><br/><br/>";
    $msg .= "Thank you from JANUS.<br/>";
    //$msg .= "Please do not reply to this mail.<br/>";
    $msg .= "Please login to Janus first before clicking on the link<br/>";
    return $msg;
  }

  function getNewProjectMailMsg($mailTo, $projectName, $link)
  {
    $msg = "";
    $msg .= "Dear " . $mailTo . ",<br/><br/>";
    $msg .= $projectName . " was added.";
    $msg .= "please click on the link below to project update details and to add any updates";
    $msg .= "<a href=\"" . $link . "\">Go to Project</a><br/><br/>";
    $msg .= "Thank you from JANUS.<br/>";
    $msg .= "Please do not reply to this mail.<br/>";
    $msg .= "Please login to Janus first before clicking on the link<br/>";
    return $msg;
  }

  function getOrderQualities($id)
  {
    $id = (int)$id;
    $sql = "select * from quality where `order` = $id;";
    $sel = mysql_query($sql);
    $ret = "[";
    $qJSON = "";
    while ($o = mysql_fetch_array($sel)) {
      $qJSON .= "{";
      $qJSON .= "id:\"" . $o['ID'] . "\",";
      $qJSON .= "name:\"" . $o['action_no'] . "\"";
      $qJSON .= "},";
    }
    $qJSON = substr($qJSON, 0, -1);
    $ret .= $qJSON;
    $ret .= "]";
    return $ret;
  }

  function getQualitiesByProjectId($id)
  {
    $quality = new Quality();
    $qualities = $quality->getQualityByProjectId($id);
    $ret = "[";
    $qJSON = "";
    foreach ($qualities as $q) {
      $qJSON .= "{";
      $qJSON .= "id:\"" . $q['ID'] . "\",";
      $qJSON .= "name:\"" . $q['action_no'] . "\"";
      $qJSON .= "},";
    }
    $qJSON = substr($qJSON, 0, -1);
    $ret .= $qJSON;
    $ret .= "]";
    return $ret;
  }

  function getProjectOrders($pId)
  {
    $order = new Order();
    $orders = $order->getOrders($pId);
    $ret = "[";
    $oJSON = "";
    foreach ($orders as $o) {
      $oJSON .= "{";
      $oJSON .= "id:\"" . $o['ID'] . "\",";
      $oJSON .= "name:\"" . $o['name'] . "\"";
      $oJSON .= "},";
    }
    $oJSON = substr($oJSON, 0, -1);
    $ret .= $oJSON;
    $ret .= "]";
    return $ret;
  }

  function getProjectDeliverable($pId)
  {
    $deliverable = new DeliverableItem();
    $deliverables = $deliverable->getDeliverableItemsByProjectId($pId);
    $ret = "[";
    $oJSON = "";
    foreach ($deliverables as $o) {
      $oJSON .= "{";
      $oJSON .= "id:\"" . $o['ID'] . "\",";
      $oJSON .= "name:\"" . $o['name'] . "\"";
      $oJSON .= "},";
    }
    $oJSON = substr($oJSON, 0, -1);
    $ret .= $oJSON;
    $ret .= "]";
    return $ret;
  }

  function getProjectSubInfo($pId)
  {
    $task = new task();
    $tasks = $task->getTasksByProjectId($pId);
    $ret = "{";
    //tasks
    if (!empty($tasks)) {
      $ret .= "tasks:[";
      $taskJSON = " ";
      foreach ($tasks as $tk) {
        $taskJSON .= "{";
        $taskJSON .= "id:" . $tk['ID'] . ",";
        $taskJSON .= "name:" . "\"" . $tk['title'] . "\"";
        $taskJSON .= "},";
      }
      $taskJSON = substr($taskJSON, 0, -1);
      $ret .= $taskJSON;
      $ret .= "]";
    } else {
      $ret .= "tasks:[]";
    }
    //end tasks
    //orders

    $order = new Order();
    $orders = $order->getOrders($pId);
    if (!empty($tasks)) {
      $ret .= ",orders:[";
      $orderJSON = " ";
      foreach ($orders as $ord) {
        $orderJSON .= "{";
        $orderJSON .= "id:" . $ord['ID'] . ",";
        $orderJSON .= "name:" . "\"" . $ord['name'] . "\"";
        $orderJSON .= "},";
      }
      $orderJSON = substr($orderJSON, 0, -1);
      $ret .= $orderJSON;
      $ret .= "]";
    } else {
      $ret .= ",orders:[]";
    }

    //Quality
    $quality = new Quality();
    $qualitys = $quality->getQualityByProjectId($pId);
    if (!empty($qualitys)) {
      $ret .= ",qualitys:[";
      $qualityJSON = " ";
      foreach ($qualitys as $quy) {
        $qualityJSON .= "{";
        $qualityJSON .= "id:" . $quy['ID'] . ",";
        $qualityJSON .= "name:" . "\"" . $quy['action_no'] . "\"";
        $qualityJSON .= "},";
      }
      $qualityJSON = substr($qualityJSON, 0, -1);
      $ret .= $qualityJSON;
      $ret .= "]";
    } else {
      $ret .= ",qualitys:[]";
    }
    //ECN
    $ecn = new EngineeringChangeNote();
    $ecns = $ecn->getEcnsByProjectId($pId);
    if (!empty($ecns)) {
      $ret .= ",ecns:[";
      $ecnJSON = " ";
      foreach ($ecns as $e) {
        $ecnJSON .= "{";
        $ecnJSON .= "id:" . $e['ID'] . ",";
        $ecnJSON .= "name:" . "\"" . $e['name'] . "\"";
        $ecnJSON .= "},";
      }
      $ecnJSON = substr($ecnJSON, 0, -1);
      $ret .= $ecnJSON;
      $ret .= "]";
    } else {
      $ret .= ",ecns:[]";
    }

    $ret .= "}";
    return $ret;

  }

  function getQualityMailMsg($qualityId, $isNew)
  {
    $qualityId = (int)$qualityId;
    $quality = new Quality();
    $q = $quality->get($qualityId);
    $projectId = $q["project"];
    $project = new project();
    $p = $project->getProject($projectId);
    $msg = "";
    $msg .= "Dear " . $mailTo . ",<br/><br/>";
    if ($isNew) {
      $msg .= "New quality issue note -" . $q['action_no'] . " was created by " . $_SESSION["username"] . ".";
    } else {
      $msg .= "Quality issue note - " . $q['action_no'] . " was updated by " . $_SESSION["username"] . ".";
    }
    $msg .= "Click <a href='http://janus.jenkins-asia.com/managequality.php?action=showEditDlg&id=" . $q['ID'] . "'>here</a> for more details.";
    $msg .= "<div style='background-color:#CDCDCD;padding:15px'>";

    $msg .= "<b>Project<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $p['name'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>Action No<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['action_no'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>Issue Date<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['issue_date'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>Product No<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['product_no'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>Product Description<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['product_desc'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>PO/Ship No<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['ship_no'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>Ship quantity<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['lot_quantity'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>Sample size<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['Sample_size'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>Defects<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['defects'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>Reject rate<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['reject_rate'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>Quantity In Inventory<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['quantity_in_inventory'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>Quantity In Process<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['quantity_in_process'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>containment Desc<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['containment_desc'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>Acknowledge By<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['acknowledge_by'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>acknowledge Date<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['acknowledge_date'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>Verified for closure by<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['verified_for_closure_by'] . "</p>";
    $msg .= "<hr/>";

    $msg .= "<b>Verification date<br/></b>";
    $msg .= "<p style='padding-left:15px'>" . $q['verification_date'] . "</p>";
    $msg .= "<hr/>";


    $msg .= "</div>";
    $msg .= "Please login to Janus first before clicking on the link<br/>";
    return $msg;
  }

  function sendQualityMail($qualityId, $settings, $isNew = false)
  {
    $qualityId = (int)$qualityId;
    $sql = "select u.name,u.email from quality_notify qn, user u where qn.userId = u.id and qn.qualityId = $qualityId";
    $quality = new Quality();
    $q = $quality->get($qualityId);
    $sel = mysql_query($sql);
    while ($row = mysql_fetch_array($sel)) {
      $themail = new emailer($settings);
      $msg = $this->getQualityMailMsg($qualityId, $isNew);
      $subject = "JANUS notification - New quality issue " . $q['action_no'];
      if (!$isNew) {
        $subject = "JANUS notification - Quality Issue updated " . $q['action_no'];
      }
      if($this->_validateEmailAddress($row["email"])){
        $themail->send_mail($row["email"], $subject, $msg);
      }
    }
  }

  function getDocumentMailMsg($doc, $mailTo)
  {
    $now = date('Y-m-d H:i:s');
    $msg = "";
    $msg .= "Dear " . $mailTo . ",<br/><br/>";
    $msg .= "Document " . $doc["document_no"] . " Revision " . $doc["revision"] . ": " . $doc["name"] . " has been uploaded by " . $_SESSION["username"] . " on " . $now . ".";
    $msg .= "<br/>";
    $msg .= "Description:";
    $msg .= "<br/>";
    $desc = $doc['description'];
    if(empty($desc)){
      $desc="N/A";
    }
    $msg .=$desc;
    $msg .= "<br/>";
    $msg .= "Please click on the <a href='http://janus.jenkins-asia.com/" . $doc["download_url"] . "'/>here</a> to access the document. Thank you.";
    $msg .= "Please login to Janus first before clicking on the link<br/>";
    return $msg;
  }

  function sendDocumentMail($documentId, $notifyUserIds, $settings)
  {
    $document = new Document();
    $docInfo = $document->getDocumentInfo($documentId);
    foreach ($notifyUserIds as $userId) {
      $themail = new emailer($settings);
      $user = new user();
      $userId = (int)$userId;
      $u = $user->getProfile($userId);
      $msg = $this->getDocumentMailMsg($docInfo, $u['name']);
      $subject = "Upload: " . $docInfo["document_no"] . " " . $docInfo["name"];
      if($this->_validateEmailAddress($u["email"])){
        $themail->send_mail($u["email"], $subject, $msg);
      }

    }
  }

  function getAllProjects()
  {
    $project = new project();
    $userRole = $_SESSION['userRole'];
    if ($userRole == "1" || $userRole == "3") {
      return $project->getProjects(1, 5000);
    }
    $pIds = $project->getMyProjectIds($_SESSION['userid']);
    $arrRet = array();
    foreach ($pIds as $pId) {
      $d = $project->getProject($pId[0]);
      array_push($arrRet, $d);
    }
    return $arrRet;
  }

  function convertProjectId($myprojects)
  {
    $projectIds = array();
    foreach ($myprojects as $id) {
      array_push($projectIds, $id[0]);
    }
    return $projectIds;
  }


  function getAllCustomers()
  {
    $ret = array();
    $sql = "select DISTINCT customer_name from projekte where 1=1 ";
    $sqlCondition = $this->getMyProjectSqlCondition();
    $sql .= $sqlCondition;
    $sql .= " order by customer_name";
    $sel = mysql_query($sql);
    while ($row = mysql_fetch_row($sel)) {
      array_push($ret, $row);
    }
    return $ret;
  }

  function getAllProjectLeaders()
  {
    $ret = array();
    $sql = "select * from user where id in (select DISTINCT project_leader from projekte) order by `name`";
    $sel = mysql_query($sql);
    while ($user = mysql_fetch_array($sel)) {
      array_push($ret, $user);
    }
    return $ret;
  }

  function getAllCustomerLeaders(){
    $ret = array();
    $sql = "select * from user where id in (select DISTINCT customer_leader from projekte) order by `name`";
    $sel = mysql_query($sql);
    while ($user = mysql_fetch_array($sel)) {
      array_push($ret, $user);
    }
    return $ret;
  }


  function getAllEngineerLeaders(){
    $ret = array();
    $sql = "select * from user where id in (select DISTINCT engineer_leader from projekte) order by `name`";
    $sel = mysql_query($sql);
    while ($user = mysql_fetch_array($sel)) {
      array_push($ret, $user);
    }
    return $ret;
  }

  function getAllQualityLeaders(){
    $ret = array();
    $sql = "select * from user where id in (select DISTINCT quality_leader from projekte) order by `name`";
    $sel = mysql_query($sql);
    while ($user = mysql_fetch_array($sel)) {
      array_push($ret, $user);
    }
    return $ret;
  }


  function getAllOrders()
  {
    $ret = array();
    $sql = "select * from `order` where 1=1 ";
    $sqlCondition = $this->getMyProjectSqlCondition("", "project");
    $sql .= $sqlCondition;
    $sel = mysql_query($sql);
    while ($row = mysql_fetch_array($sel)) {
      array_push($ret, $row);
    }
    return $ret;
  }

  function getUploadedFileIds($data)
  {
    $arrFiles = explode(",", $data);
    $fileIds = array();
    foreach ($arrFiles as $f) {
      $fileItem = explode(":", $f);
      array_push($fileIds, $fileItem[0]);
    }
    return $fileIds;
  }


  function getProjectNotifyList($projectId)
  {
    $projectId = (int)$projectId;
    $sql = "select distinct(u.id),u.name,u.role_type from projekte_assigned pa, user u  where pa.projekt = $projectId and u.id=pa.user or u.role_type in (1,3);";
    $sel = mysql_query($sql);
    $ret = array();
    while ($row = mysql_fetch_array($sel)) {
      $row["user_id"] = $row["id"];
      array_push($ret, $row);
    }
    return $ret;
  }

  function getProjectNotifyListJSON($projectId)
  {
    $data = $this->getProjectNotifyList($projectId);
    $json = "[";
    $nJson = "";
    foreach ($data as $e) {
      $nJson .= "{";
      $nJson .= "id:" . $e['id'] . ",";
      $nJson .= "name:" . "\"" . $e['name'] . "\"";
      $nJson .= "},";
    }
    $nJson = substr($nJson, 0, -1);
    $json .= $nJson;
    $json .= "]";
    return $json;
  }

  function getMyProjectSqlCondition($prefix = "", $filedName = "id")
  {
    $userRole = $_SESSION['userRole'];
    if ($userRole == "1" || $userRole == "3") {
      return "";
    }
    $project = new project();
    $pIds = $project->getMyProjectIds($_SESSION['userid']);
    $str = "";
    foreach ($pIds as $pId) {
      $str .= $pId[0] . ",";
    }
    if ($str != "") {
      $str = substr($str, 0, -1);
    }
    if ($prefix == "") {
      $ret = " and $filedName in (" . $str . ")";
    } else {
      $ret = " and $prefix.$filedName in (" . $str . ")";
    }

    return $ret;
  }


}

?>
