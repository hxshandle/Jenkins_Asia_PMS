<?php

class ECNImpacts
{
  private $jUtil;

  function __construct()
  {
    $this->jUtil = new JUtils();
  }

  /**
   * $record is a array with valid table data
   */
  function addRecord($tableName, $record)
  {
    $sql = "insert into `$tableName` (%s) values (%s)";
    $keys = "";
    $values = "";
    $hasSubTable = false;
    $subTableName = "";
    $subTableData = null;
    // prepare sql
    foreach ((array)$record as $key => $value) {
      if (!is_string($key)) {
        continue;
      }
      if (is_array($value)) {
        $hasSubTable = true;
        $subTableName = $tableName . "_" . $key;
        $subTableData = $value;
        continue;
      }
      $keys .= "`" . $key . "`,";
      if (is_string($value)) {
        $values .= "'" . mysql_real_escape_string($value) . "',";
      } else {
        $values .= $value . ",";
      }
    }
    if (strlen($keys) > 1) {
      $keys = substr($keys, 0, -1);
    }
    if (strlen($values) > 1) {
      $values = substr($values, 0, -1);
    }
    $sql = sprintf($sql, $keys, $values);
    $ins = mysql_query($sql);
    // insert sub attachment data
    if ($ins && $hasSubTable) {
      $insId = mysql_insert_id();
      $key = $tableName . "_id";
      $docSql = "insert into `$subTableName` (`$key`,`document_id`) values ($insId,%d)";
      foreach ($subTableData as $docId) {
        $docInsSql = sprintf($docSql, (int)$docId);
        mysql_query($docInsSql);
      }
    }
    return $ins ? true : false;
  }

  /**
   * $data should by array [[row1],[row2]]
   */
  function addRecords($tableName, $ecnId, $recoreds)
  {
    $ret = array(
      "status" => true,
      "errors" => array()
    );
    foreach ($recoreds as $record) {
      $record['ecn_id'] = $ecnId;
      $ins = $this->addRecord($tableName, $record);
      if (!$ins) {
        array_push($ret['errors'], "insert error for $record");
      }
    }
    return $ret;
  }

  function delRecords($tableName,$strId){
    $sql = "update $tableName set valid = 0 where id in ($strId)";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }

  function update($tableName, $record)
  {
    //check for id
    if (empty($record['ID']) && empty($record['id'])) {
      return;
    }
    $id = empty($record['ID']) ? $record['id'] : $record['ID'];
    $id = (int)$id;
    $sql = "update `$tableName` set %s where id = $id ";
    $setStr = "";
    foreach ((array)$record as $key => $value) {
      if (strtolower($key) == "id") {
        continue;
      }
      // don't update array it should be the sub table.
      if (is_array($value)) {
        continue;
      }
      $setStr .= "`" . $key . "`= ";
      if (is_string($value)) {
        $setStr .= "'" . $value . "',";
      } else {
        $setStr .= $value . ",";
      }
    }
    if (strlen($setStr) > 1) {
      $setStr = substr($setStr, 0, -1);
    }
    $sql = sprintf($sql, $setStr);

    $upd = mysql_query($sql);
    return $upd ? true : false;
  }

  function _getDocumentAttachments($tableName, $id)
  {
    $relTableName = $tableName . "_attachment";
    $relKey = $tableName . "_id";
    $id = (int)$id;
    $sql = "select * from $relTableName t,document_info di,files fl where t.document_id = di.id and fl.id=di.file and $relKey = $id";
    return $this->jUtil->Query($sql);
  }

  function _getAttachments($tableName, $records)
  {
    $ret = array();
    foreach ((array)$records as $record) {
      $attachments = $this->_getDocumentAttachments($tableName, $record['ID']);
      $record['attachments'] = $attachments;
      array_push($ret, $record);
    }
    return $ret;

  }

  function getImpactsByECNId($id)
  {
    $id = (int)$id;
    $tables = array("ecn_impact_part", "ecn_impact_tool", "ecn_impact_other", "ecn_impact_process", "ecn_impact_documentation");
    $ret = array();
    foreach ($tables as $tableName) {
      $sql = "select * from `$tableName` where ecn_id = $id and valid = 1";
      $tableResult = $this->jUtil->Query($sql);
      if ($tableName == "ecn_impact_process" || $tableName == "ecn_impact_documentation") {
        // get document attachements
        $tableResult = $this->_getAttachments($tableName, $tableResult);
      }
      $ret[$tableName] = $tableResult;
    }
    return $ret;
  }

  function deleteImpacts($arr){
    if (!is_array($arr)) {
      return;
    }
    foreach ((array)$arr as $tableName => $deletedIds) {
      $strIds = implode(",",$deletedIds);
      $this->delRecords($tableName,$strIds);
    }
  }

  function addImpacts($ecnId,$arr)
  {
    if (!is_array($arr)) {
      return;
    }
    foreach ((array)$arr as $tableName => $tableData) {
      $tableName = "ecn_impact_".$tableName;
      $this->addRecords($tableName,$ecnId,$tableData);
    }

  }
}

?>
