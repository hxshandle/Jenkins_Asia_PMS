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
  
  function add($name,$status,$project,$totalCount,$tagId,$desc){
    $name = mysql_escape_string($name);
    $desc = mysql_escape_string($desc);
    $tagId = mysql_escape_string($tagId);
    $status = (int) $status;
    $project = (int) $project;
    $totalCount = (int) $totalCount;
    
    $sql = "INSERT INTO `sample`
            (
            `name`,
            `status`,
            `project`,
            `total_count`,
            `available_count`,
            `tag_id`,
            `description`,
            `valid`)
            VALUES
            (
            '$name',
            $status,
            $project,
            $totalCount,
            $totalCount,
            '$tagId',
            '$desc',
            1
            )";
    $ins = mysql_query($sql);
    if($ins){
      return mysql_insert_id();
    }else{
      return false;
    }
  }
  
  function updateAvailableCount($id,$count){
    $id = (int) $id;
    $count = (int) $count;
    $sql = "update `sample` set `available_count` = $count where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }
}

?>
