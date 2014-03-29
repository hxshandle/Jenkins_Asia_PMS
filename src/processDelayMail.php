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
  $arrCC = explode(",", $mail['cc']);
  $mailMgr->del($mail['ID']);
  $themail->send_mail($mail['to'],$mail['subject'],$mail['text'],$arrCC);
}

echo "DONE";