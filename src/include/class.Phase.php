<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Phase
 *
 * @author huanghandle
 */
class Phase {
  //put your code here
  private $myLog;
  
  function __construct() {
    $this->myLog = new mylog;
  }
  
  
  function get($id){
    $id = (int) $id;
    $sql = "select * from phase where `id` = '$id'";
    $query = mysql_query($sql);
    $ret = array();
    $start="";
    $end="";
    if(!empty($query)){
      $ret = mysql_fetch_array($query);
      $sql1 = "select min(start_date), max(end_date) from deliverable_item where phase =$id";
      $q1 = mysql_query($sql1);
      if($q1){
        $row = mysql_fetch_row($q1);
        $start = $row[0];
        $end = $row[1];
      }
      $ret["start_date"]=$start;
      $ret["end_date"]=$end;
      
    }
    return $ret;
  }
  
  function add($name,$desc,$project,$status,$valid=1,$parentPhase=-1,$childPhase=-1){
    $name = mysql_escape_string($name);
    $desc = mysql_escape_string($desc);
    $project = (int) $project;
    $status = (int) $status;
    $parentPhase= (int) $parentPhase;
    $childPhase = (int) $childPhase;
    $sql = "INSERT INTO `phase`
            (`name`,
            `desc`,
            `project`,
            `status`,
            `valid`,
            `parentPhase`,
            `childPhase`)
            VALUES
            (
            '$name',
            '$desc',
            $project,
            $status,
            $valid,
            $parentPhase,
            $childPhase
            )";
    $ins = mysql_query($sql);
    if($ins){
      return mysql_insert_id();
    }else{
      return false;
    }
  }
  
  function update($id,$desc,$status,$valid,$parentPhase=-1,$childPhase=-1){
    $id = (int) $id;
    $desc = mysql_escape_string($desc);
    $parentPhase = (int) $parentPhase;
    $childPhase = (int) $childPhase;
    $sql = "UPDATE `phase`
            SET
            `desc` = '$desc',
            `status` = $status,
            `valid` = $valid,
            `parentPhase` = $parentPhase,
            `childPhase` = $childPhase 
            WHERE ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }
  
  function del($id){
    $sql = "update `phase` set valid = 0 where ID = $id";
    $del = mysql_query($sql);
    if($del){
      return true;
    }else{
      return false;
    }
  }
  function delPhasesByProjectId($id){
    $id = (int) $id;
    $deliverable = new DeliverableItem();
    $deliverable->delDeliverableItemByProjectId($id);
    $del =  mysql_query("update `phase` set valid = 0 where `project` = $id");
    return $del;
  }
  function getPhasesDetailsByProjectId($id){
    $phases = $this->getPhasesByProjectId($id);
    $deliverableItem = new DeliverableItem();
    $ret = array();
    foreach ($phases as $phase) {
      $deliverableItems = $deliverableItem->getDeliverableItemsByPhaseId($phase["ID"], 100);
      if(!$deliverableItems){
        $deliverableItems = array();
      }
      $phase["deliverableItems"] = $deliverableItems;
      array_push($ret, $phase);
    }
    return $ret;
  }
  
  function closeByProjectId($id){
    $id = (int) $id;
    $deliverable = new DeliverableItem();
    $deliverable->closeDeliverableItemByProjectId($id);
    $status = Status::getId("phase", "closed");
    $del =  mysql_query("update `phase` set `status`=$status where `project` = $id");
    if($del){
      return true;
    }else{
      return false;
    }  
  }
  
  function getPhasesByProjectId($projectId){
    $projectId = (int) $projectId;
    $sql = "select * from `phase` where `project` = $projectId and valid = 1";
    $query = mysql_query($sql);
    $arr = array();
    while ($row = mysql_fetch_array($query)) {
      $phase = $this->get($row["ID"]);
      array_push($arr, $phase);
    }
    return $arr;
  }
  
}

?>
