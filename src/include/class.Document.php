<?php

class Document{

  function add($docName,$docVer,$docDesc,$fileId,$projectId,$taskId,$orderId,$qualityId,$visibility){
    $docName = mysql_escape_string($docName);
    $docVer = mysql_escape_string($docVer);
    $docDesc = mysql_escape_string($docDesc);
    $fileId = (int) $fileId;
    $projectId = (int) $projectId;
    $taskId = (int) $taskId;
    $orderId = (int) $orderId;
    $qualityId = (int) $qualityId;
    $sql = "
             INSERT INTO `document_info`
             (
             `name`,
             `revision`,
             `description`,
             `file`,
             `project`,
             `task`,
             `order`,
             `quality`,
             `visibility`)
             VALUES
             (
             '$docName',
             '$docVer',
             '$docDesc',
             $fileId,
             $projectId,
             $taskId,
             $orderId,
             $qualityId,
             '$visibility'
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
    $sql = "select id from document_info where visibility like '%$userRole%' order by insert_date DESC";
    $sel = mysql_query($sql);
    while($row = mysql_fetch_array($sel)){
      $info = $this->getDocumentInfo($row[0]);
      array_push($ret,$info);
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
    $ret = array();
    $sel = mysql_query($sql);
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
