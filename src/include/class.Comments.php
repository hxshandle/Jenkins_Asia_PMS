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
    $this->jUtils = new JUtils();
  }


  function insertMailComments($comments,$userId,$commentUserName,$taskId,$mailId){
    //$comments = "中文的内容哦";
    mysql_query("SET NAMES UTF8");
    $comments = mysql_real_escape_string($comments);
    $userId = (int)$userId;
    $commentUserName = mysql_real_escape_string($commentUserName);
    $taskId = (int) $taskId;
    $mailId = (int) $mailId;
    $sql = "INSERT INTO `task_comments`
            (
            `comment`,
            `is_from_email`,
            `comment_by`,
            `commnet_user_name`,
            `email_id`,
            `task`)
            VALUES
            (
            '$comments',
            1,
            $userId,
            '$commentUserName',
            $mailId,
            $taskId)
            ";
    $sel = mysql_query($sql);
    if($sel){
      return mysql_insert_id();
    }else{
      return false;
    }
  }

  function mergeComments($comments,$isFromEmail,$commentUserName,$ts,$taskId){
    $comments = mysql_real_escape_string($comments);
    $isFromEmail = (int) $isFromEmail;
    $commentUserName = mysql_real_escape_string($commentUserName);
    $taskId = (int) $taskId;
    $sql = "INSERT INTO `task_comments`
            (
            `comment`,
            `is_from_email`,
            `comment_by`,
            `commnet_user_name`,
            `isMergeData`,
            `last_update`,
            `task`)
            VALUES
            (
            '$comments',
            $isFromEmail,
            0,
            '$commentUserName',
            1,
            '$ts',
            $taskId)
            ";
    $sel = mysql_query($sql);
    if($sel){
      return mysql_insert_id();
    }else{
      return false;
    }
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

  function getTaskComments($taskId){
    $taskId = (int) $taskId;
    $sql = "select * from task_comments where task = $taskId and valid = 1 order by last_update DESC ";
    return $this->jUtils->Query($sql);

  }
} 