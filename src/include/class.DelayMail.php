<?php
/**
 * Created by PhpStorm.
 * User: hhuang
 * Date: 3/29/14
 * Time: 7:44 PM
 */

class DelayMail {

  private $jUtils;

  function __construct()
  {
    $this->jUtils = new JUtils();
  }

  function createDelayMail($to,$subject,$text,$strCC,$attachment=null){
    $to = mysql_real_escape_string($to);
    $subject = mysql_real_escape_string($subject);
    $text = mysql_real_escape_string($text);
    $strCC = mysql_real_escape_string($strCC);
    $attachment = mysql_real_escape_string($attachment);
    $sql = "INSERT INTO `delay_mail`
            (
            `to`,
            `subject`,
            `cc`,
            `text`,
            `attachments`
            )
            VALUES
            (
            '$to',
            '$subject',
            '$strCC',
            '$text',
            '$attachment')";
    $ins = mysql_query($sql);
    return $ins;
  }

  function getDelayMails(){
    $sql = "select * from `delay_mail`";
    return $this->jUtils->Query($sql);
  }

  function del($id){
    $id = (int) $id;
    $sql = "DELETE FROM `delay_mail` where ID = $id";
    $del = mysql_query($sql);
    return $del;
  }

} 