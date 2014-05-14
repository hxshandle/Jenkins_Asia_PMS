<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DeliverableItem
 *
 * @author huanghandle
 */
class DeliverableItem {

  //put your code here
  private $myLog;

  function __construct() {
    $this->myLog = new mylog;
  }

  function add($name, $statusId, $startDate, $endDate,$project, $phaseId, $desc, $valid = 1) {
    $name = mysql_real_escape_string($name);
    $statusId = (int) $statusId;
    $project = (int) $project;
    $phaseId = (int) $phaseId;
    $desc = mysql_real_escape_string($desc);
    $valid = (int) $valid;
    $sql = "insert into deliverable_item (
            `name`,
            `status`,
            `start_date`,
            `end_date`,
            `project`,
            `phase`,
            `desc`,
            `valid`
            ) values (
            '$name',
            $statusId,
            '$startDate',
            '$endDate',
            $project,
            $phaseId,
            '$desc',
            $valid)";
    $ins = mysql_query($sql);
    if ($ins) {
      $insid = mysql_insert_id();
      return $insid;
    } else {
      return FALSE;
    }
  }

  function updateDate($id,$startDate,$endDate){
    $id = (int) $id;
    $startDate = mysql_real_escape_string($startDate);
    $endDate = mysql_real_escape_string($endDate);
    $id = (int) $id;
    $sql ="update deliverable_item set end_date = '$endDate',start_date='$startDate' where id = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }

  function updateEndDate($id,$strDate){
    $id = (int) $id;
    $sql ="update deliverable_item set end_date = '$strDate' where id = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }

  function update($id, $name, $statusId, $startDate, $endDate, $phaseId, $desc, $valid = 1) {
    $id = (int) $id;
    $name = mysql_real_escape_string($name);
    $statusId = (int) $statusId;


    $phaseId = (int) $phaseId;
    $desc = mysql_real_escape_string($desc);
    $valid = (int) $valid;
    $sql = "update deliverable_item set ";
    if(null != $statusId){
      $sql = $sql." `status`=$statusId,";
    }
    $sql = $sql." `name`='$name',";
    $sql = $sql." `start_date`='$startDate',";
    $sql = $sql." `end_date`='$endDate',";
    $sql = $sql." `phase`=$phaseId,";
    $sql = $sql." `desc`='$desc',";
    $sql = $sql." `valid`=$valid";
    $sql = $sql." where ID = $id";
    

    //$upd = mysql_query("update deliverable_item set `name`='$name', `status`=$statusId, `start_date`='$startDate', `end_date`='$endDate', `phase`=$phaseId, `desc`='$desc', `valid`=$valid where ID = $id");
    $upd = mysql_query($sql);
    if ($upd) {
      return TRUE;
    } else {
      return FALSE;
    }
  }

  function del($id) {
    $id = (int) $id;
    $del = mysql_query("update deliverable_item set `valid`= 0 where ID = $id");
    if ($del) {
      return TRUE;
    } else {
      return FALSE;
    }
  }
  
  function delDeliverableItemByProjectId($id){
    $id = (int) $id;
    $task = new task();
    $task->delTasksByProjectId($id);
    $del = mysql_query("update `deliverable_item` set `valid` = 0 where `project` = $id");
    return $del;
  }
  function delDeliverableItemByPhaseId($id){
    $id = (int) $id;
    //delete tasks
    $task = new task();
    $task->delTasksByPhaseId($id);
    return mysql_query("update `deliverable_item` set `valid` = 0 where `phase` = $id");
  }
  
  function closeDeliverableItemByProjectId($id){
    $id = (int) $id;
    //delete tasks
    $task = new task();
    $task->closeTasksByProjectId($id);
    $status = Status::getId("deliverable", "closed");
    return mysql_query("update `deliverable_item` set `status` = $status where `project` = $id");
  }
  
  function closeDeliverableItemByPhaseId($id){
    $id = (int) $id;
    //delete tasks
    $task = new task();
    $task->closeTasksByPhaseId($id);
    $status = Status::getId("phase", "closed");
    $del = mysql_query("update `deliverable_item` set `status` = $status where `phase` = $id");
    return $del;
  }

  function getItem($id) {
    $id = (int) $id;
    $sel = mysql_query("select * from deliverable_item where ID = $id and valid =1");
    $item = mysql_fetch_array($sel);
    $count=0;
    $doneCount=0;
    $st1 = Status::getId("task", "completed");
    $st2 = Status::getId("task", "closed");
    if (!empty($item)) {
      $taskq = mysql_query("select * from tasks where deliverable_item = $item[ID]");
      $arrTask = array();
      while ($row = mysql_fetch_array($taskq)) {
        if($row['status'] == $st1 || $row['status'] == $st2){
          $doneCount++;
        }else{
          $count++;
        }
        array_push($arrTask,$row);
      }
      if (!empty($arrTask)) {
        $item['tasks'] = $arrTask;
        $item['percentcompleted'] =floor(($doneCount/($doneCount+$count))*100) ;
      } else {
        $item['tasks'] = array();
        $item['percentcompleted'] =100;
      }
      return $item;
    } else {
      return FALSE;
    }
  }

  function getDeliverableItemsByPhaseId($phaseId, $limit = 10) {
    $ret = array();
    $phaseId = (int) $phaseId;
    $sel = mysql_query("select * from deliverable_item where valid = 1 and phase = $phaseId LIMIT $limit");
    while ($items = mysql_fetch_array($sel)) {
      $item = $this->getItem($items["ID"]);
      $item = $this->checkStatus($item);
      array_push($ret, $item);
    }

    if (!empty($ret)) {
      return $ret;
    } else {
      return FALSE;
    }
  }
  
  
    
  function checkStatus($deliverItem){
    $startDate = strtotime($deliverItem['start_date']);
    $endDate = strtotime($deliverItem['end_date']);
    $now = strtotime(date(CL_DATEFORMAT));
    $stNotStart = Status::getId("deliverable","not_start");
    $stInProgress = Status::getId("deliverable","in_progress");
    $stCompleted = Status::getId("deliverable","closed");
    $st = $deliverItem['status'];
    if($st == $stCompleted){
      return $deliverItem;
    }
    if($now >= $startDate && $now <=$endDate && $st == $stNotStart){
      $this->updateStatus($deliverItem['ID'],$stInProgress);
      $deliverItem['status'] = $stInProgress;
      return $deliverItem;
    }
    if($now > $endDate && $st != $stCompleted){
      $this->updateStatus($deliverItem['ID'],$stInProgress);
      $deliverItem['status'] = $stInProgress;
      $deliverItem['delay'] =true;
    }
    return $deliverItem;

  }
  
  function updateStatus($id,$status){
    $sql = "update deliverable_item set status =$status where ID=$id";
    $upd = mysql_query($sql);
    return $upd;
  }
  
  function getDeliverableItemsByProjectId($id){
    $id = (int) $id;
    $sql = "select * from deliverable_item where `project` = $id and valid = 1";
    $sel = mysql_query($sql);
    $ret = array();
    while($items = mysql_fetch_array($sel)){
      array_push($ret,$items);
    }
    return $ret;
  }

}

