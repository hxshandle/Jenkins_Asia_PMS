<?php
/**
 * Created by Handle.
 * User: I073349
 * Date: 9/2/14
 * Time: 2:14 PM
 */

class Comments {

  private $jUtils;

  function __construct() {
    $this->$jUtils = new JUtils();
  }

  function addTaskComments($comments,$isFromEmail,$commentBy,$commentUserName,$taskId){
    $comments = mysql_real_escape_string($comments);
    $commentBy = (int) $commentBy;
    $isFromEmail = (int) $isFromEmail;
    $commentUserName = mysql_real_escape_string($commentUserName);
    $taskId = (int) $taskId;
    $sql = "INSERT INTO `task_comments`
            (
            `comment`,
            `is_from_email`,
            `comment_by`,
            `commnet_user_name`,
            `task`)
            VALUES
            (
            '$comments',
            $isFromEmail,
            $commentBy,
            '$commentUserName',
            $taskId)
            ";
    $sel = mysql_query($sql);
    if($sel){
      return mysql_insert_id();
    }else{
      return false;
    }
  }
  function updateTaskComments($id,$comments){
    $id = (int)$id;
    $coments = mysql_real_escape_string($comments);
    $sql = "UPDATE `task_comments`
            SET
            `comment` = '$coments'
            WHERE `ID` = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }

  function getComments($taskId){
    $taskId = (int) $taskId;
    $sql = "select * from task_comments where id = $taskId and valid = 1";
    return $this->jUtils->Query($sql);

  }
} 