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
  
  function add($name,$desc,$project,$status,$valid=1){
    $name = mysql_escape_string($name);
    $desc = mysql_escape_string($desc);
    $project = (int) $project;
    $status = (int) $status;
    $sql = "INSERT INTO `phase`
            (`name`,
            `desc`,
            `project`,
            `status`,
            `valid`)
            VALUES
            (
            '$name',
            '$desc',
            $project,
            $status,
            $valid
            )";
    $ins = mysql_query($sql);
    if($ins){
      return mysql_insert_id();
    }else{
      return false;
    }
  }
  
  function update($id,$desc,$status,$valid){
    $id = (int) $id;
    $desc = mysql_escape_string($desc);
    $sql = "UPDATE `phase`
            SET
            `desc` = '$desc',
            `status` = $status,
            `valid` = $valid
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
  
  function getPhasesByProjectId($projectId){
    $projectId = (int) $projectId;
    $sql = "select * from `phase` where `project` = $projectId and valid = 1";
    $query = mysql_query($sql);
    $arr = array();
    while ($row = mysql_fetch_array($query)) {
      array_push($arr, $row);
    }
    return $arr;
  }
  
}

?>
