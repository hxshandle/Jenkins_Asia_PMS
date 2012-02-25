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

  function update($id, $name, $statusId, $startDate, $endDate, $phaseId, $desc, $valid = 1) {
    $id = (int) $id;
    $name = mysql_real_escape_string($name);
    $statusId = (int) $statusId;


    $phaseId = (int) $phaseId;
    $desc = mysql_real_escape_string($desc);
    $valid = (int) $valid;

    $upd = mysql_query("update deliverable_item set `name`='$name', `status`=$statusId, `start_date`='$startDate', `end_date`='$endDate', `phase`=$phaseId, `desc`='$desc', `valid`=$valid where ID = $id");
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
    if (!empty($item)) {
      $taskq = mysql_query("select * from tasks where deliverable_item = $item[ID]");
      $arrTask = array();
      while ($row = mysql_fetch_array($taskq)) {
        array_push($arrTask,$row);
      }
      if (!empty($arrTask)) {
        $item['tasks'] = $arrTask;
      } else {
        $item['tasks'] = array();
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
      array_push($ret, $item);
    }

    if (!empty($ret)) {
      return $ret;
    } else {
      return FALSE;
    }
  }

}

?>
