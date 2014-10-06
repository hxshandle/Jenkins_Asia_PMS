<?php
/**
 * Created by PhpStorm.
 * User: hhuang
 * Date: 3/29/14
 * Time: 9:04 PM
 */

include("init.php");

$mailMgr = new DelayMail();
$jUtils = new JUtils();
$mails = $mailMgr->getDelayMails();
$themail = new emailer($settings);
//clear db first
foreach ($mails as $mail){
  $mailMgr->del($mail['ID']);
}
foreach ($mails as $mail) {
  $arrCC = null;
  if(!empty($mail['cc'])){
    $arrCC = explode(",", $mail['cc']);
  }
  $arrCC = $jUtils->getValidCCList($arrCC);

  $attachment = $mail['attachments'];
  if(empty($attachment)){
    $attachment = null;
  }
  if($jUtils->_validateEmailAddress($mail['to'])){
    $themail->send_mail($mail['to'],$mail['subject'],$mail['text'],$arrCC,$attachment);
  }else{
    echo " drop email -> ".$mail['to']."<br/>";
  }

}

echo "DONE";