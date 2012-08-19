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
    $sql = "select * from document_info order by insert_date DESC";
    $sel = mysql_query($sql);
    while($row = mysql_fetch_array($sel)){
      array_push($ret,$row);
    }
    return $ret;
  }
}
?>
