<?php
/**
 * Created by PhpStorm.
 * User: hhuang
 * Date: 3/29/14
 * Time: 9:04 PM
 */

include("init.php");

$mailMgr = new DelayMail();
$mails = $mailMgr->getDelayMails();
$themail = new emailer($settings);
foreach ($mails as $mail) {
  $arrCC = null;
  if(!empty($mail['cc'])){
    $arrCC = explode(",", $mail['cc']);
  }

  $attachment = $mail['attachments'];
  if(empty($attachment)){
    $attachment = null;
  }
  $mailMgr->del($mail['ID']);
  $themail->send_mail($mail['to'],$mail['subject'],$mail['text'],$arrCC,$attachment);
}

echo "DONE";