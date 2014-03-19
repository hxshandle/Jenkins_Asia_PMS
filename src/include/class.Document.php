<?php

class Document{

  
  function delete($id){
    $id = (int) $id;
    $docInfo = $this->getDocumentInfo($id);
    $fileId = $docInfo['file'];
    $datei = new datei();
    $ret = $datei->loeschen($fileId);
    if($ret){
      $sql = " DELETE FROM `document_info` WHERE ID = $id";
      $del = mysql_query($sql);
      return true;
    }else{
      return false;
    }
  }

  function addDocumentNotify($id,$notifyUserIds){
    $id = (int) $id;
    if(empty($notifyUserIds)){
      return false;
    }
    foreach ($notifyUserIds as $userId) {
      $userId = (int) $userId;
      $sql = "insert into document_info_notify(`document_info_id`,`user_id`) values ($id,$userId)";
      $ins = mysql_query($sql);
    }
    return true;


  }
  function update($id,$docName,$docNo,$docVer,$docDesc,$projectId,$visibility){
    $id = (int) $id;
    $docName = mysql_escape_string($docName);
    $docVer = mysql_escape_string($docVer);
    $docDesc = mysql_escape_string($docDesc);
    $docNo = mysql_escape_string($docNo);
    $sql = "update document_info set 
    `name` = '$docName',
    `revision`='$docVer',
    `description`='$docDesc', 
    `document_no` = '$docNo',
    `visibility`='$visibility' 
    where ID=$id";
    $upd = mysql_query($sql);
    return $upd;
  }
  function add($docName,$docNo,$docVer,$docDesc,$fileId,$projectId,$taskId,$orderId,$qualityId,$visibility,$ecnId = -1){
    $docName = mysql_escape_string($docName);
    $docVer = mysql_escape_string($docVer);
    $docDesc = mysql_escape_string($docDesc);
    $docNo = mysql_escape_string($docNo);
    $fileId = (int) $fileId;
    $projectId = (int) $projectId;
    $taskId = (int) $taskId;
    $orderId = (int) $orderId;
    $qualityId = (int) $qualityId;
    $ecnId = (int) $ecnId;
    $sql = "
             INSERT INTO `document_info`
             (
             `name`,
             `document_no`,
             `revision`,
             `description`,
             `file`,
             `project`,
             `task`,
             `order`,
             `quality`,
             `visibility`,
             `ecn`)
             VALUES
             (
             '$docName',
             '$docNo',
             '$docVer',
             '$docDesc',
             $fileId,
             $projectId,
             $taskId,
             $orderId,
             $qualityId,
             '$visibility',
              $ecnId
             )";
    $ins = mysql_query($sql);
    if ($ins) {
      return mysql_insert_id();
    } else {
      return false;
    }
  }

  function getLatesUpdatedDocuments(){
    $ret = array();
    $userRole = $_SESSION["userRole"];;
    $sql = "select id from document_info where visibility like '%$userRole%' order by insert_date DESC,document_no,revision DESC";
    $sel = mysql_query($sql);
    while($row = mysql_fetch_array($sel)){
      $info = $this->getDocumentInfo($row[0]);
      array_push($ret,$info);
    }
    return $ret;
  }

  function groupDocumentsByDocNo($documents){
    $arr = array();
    foreach ($documents as $doc) {
      $arr[$doc['document_no']][$doc['revision']] = $doc;
    }
    ksort($arr,SORT_DESC);
    $ret = array();
    foreach ($arr as $docs) {
      $docRow = array();
      $docRow['latest'] = array_shift($docs);
      $docRow['old'] = $docs;
      array_push($ret,$docRow);
    }


    return $ret;
  }

  function filterDocuments($projectId,$orderId,$customerName){
    $userRole = $_SESSION["userRole"];;
    $sql = "select id from document_info where visibility like '%$userRole%'";
    if($projectId != "-1"){
      $projectId = (int) $projectId;
      $sql .= " and project = $projectId";
    }

    if($orderId != "-1"){
      $orderId = (int) $orderId;
      $sql .= " and `order` = $orderId";
    }

    if($customerName != "-1"){
      $sql2 = "select id from projekte where customer_name = '$customerName'";
      $sel2 = mysql_query($sql2);
      $pIds = array();
      while($pId = mysql_fetch_array($sel2)){
        array_push($pIds,$pId[0]);
      }
      $str =  implode(',', $pIds);
      $sql .= " and project in (".$str.")";
    }
    $sql .=" order by document_no,revision DESC,insert_date DESC";
    $ret = array();
    $sel = mysql_query($sql);
    while($row = mysql_fetch_array($sel)){
      $info = $this->getDocumentInfo($row[0]);
      if(!empty($info)){
          array_push($ret,$info);
      }
      
    }
    return $ret;
  }
  
  
  function getDocumentsByECNId($ecnId){
    $ecnId = (int) $ecnId;
    $sql = "select * from document_info where ecn = $ecnId";
    $sel = mysql_query($sql);
    $ret = array();
    while($row = mysql_fetch_array($sel)){
      $info = $this->getDocumentInfo($row[0]);
      array_push($ret,$info);
    }
    return $ret;
  }

  function getDocumentInfo($id){
    $id = (int) $id;
    
    $ret = array();
    $sql1 = "select di.*,p.name as project_name,p.customer_name as customer_name,fs.datei as download_url from document_info di,projekte p,files fs where di.project=p.id and fs.id = di.file and di.id = $id ";
    $sel = mysql_query($sql1);
    if($sel){
      $ret = mysql_fetch_array($sel);
      if(empty($ret)){
          return $ret;
      }
      if($ret['order'] == -1){
        $ret['order_name'] = "";
      }else{
        $order = new Order();
        $o = $order->get($ret['order']);
        $ret['order_name'] = $o['name'];
      }

      if($ret['quality'] == -1){
        $ret['quality_name'] = "";
      }else{
        $quality = new Quality();
        $q = $quality->get($ret['quality']);
        $ret['quality_name'] = $q['action_no'];
      }
    
    }
    return $ret;
  }
}
?>
