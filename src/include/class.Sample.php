<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Sample
 *
 * @author huanghandle
 */
class Sample {
  //put your code here
  private $myLog;
  
  function __construct() {
    $this->myLog = new mylog;
  }
  
  function add($name,$status,$project,$totalCount,$availableCount,$tagId,$desc,$datei){
    $name = mysql_escape_string($name);
    $desc = mysql_escape_string($desc);
    $tagId = mysql_escape_string($tagId);
    $status = (int) $status;
    $project = (int) $project;
    $totalCount = (int) $totalCount;
    $availableCount = (int) $availableCount;
    $datei = mysql_escape_string($datei);
    $sql = "INSERT INTO `sample`
            (
            `name`,
            `status`,
            `project`,
            `total_count`,
            `available_count`,
            `tag_id`,
            `description`,
            `datei`,
            `valid`)
            VALUES
            (
            '$name',
            $status,
            $project,
            $totalCount,
            $availableCount,
            '$tagId',
            '$desc',
            '$datei',
            1
            )";
    $ins = mysql_query($sql);
    if($ins){
      return mysql_insert_id();
    }else{
      return false;
    }
  }
  
  function updateCount($id,$totalCount,$availableCount){
    $id = (int) $id;
    $count = (int) $count;
    $sql = "update `sample` set `available_count` = $availableCount,`total_count` = $totalCount where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }
  
  function getSampleDetailsByProjectId($id){
    $samples = $this->getSampleByProjectId($id);
    $ret = array();
    foreach ($samples as $sample) {
      array_push($ret, $sample);
    }
    return $ret;
  }
  
  function getSampleByProjectId($projectId){
    $projectId = (int) $projectId;
    $sql = "select * from `sample` where `project` = $projectId and valid = 1";
    $query = mysql_query($sql);
    $arr = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arr, $row);
    }
    return $arr;
  }
  
  function del($id){
    $sql = "update `sample` set valid = 0 where ID = $id";
    $del = mysql_query($sql);
    if($del){
      return true;
    }else{
      return false;
    }
  } 
  function get($id){
    $id = (int) $id;
    $sql = "select * from sample where `id` = '$id'";
    $query = mysql_query($sql);
    $ret = array();
    if(!empty($query)){
      $ret = mysql_fetch_array($query);
    }
    return $ret;
  }
  
  function reduceCount($id){
    $id = (int) $id;
    $sql = "update `sample` set `available_count` = `available_count` - 1 where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }
  
  function addCount($id){
    $id = (int) $id;
    $sql = "update `sample` set `available_count` = `available_count` + 1 where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }
}

?>
