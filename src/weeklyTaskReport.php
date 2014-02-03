<?php
/**
 * Created by PhpStorm.
 * User: hhuang
 * Date: 1/17/14
 * Time: 7:38 PM
 */
require("init.php");


$action = getArrayVal($_GET, "action");
$mail = getArrayVal($_GET, "mail");
switch($action){
  case "A":
break;
default:
$report = new TaskWeeklyReport();
$reports = $report->getWeeklyReport();
$themail = new emailer($settings);
if($mail){
  echo "<h1>DEBUG: send mail is true</h1>";
}else{
  echo "<h1>DEBUG: will not send mail</h1>";
}
foreach ($reports as $p) {
  echo "Send mail to :".$p["email"];
  echo "<br/>";
  echo "Subject:".$p["subject"];
  echo "<br/>";
  echo $p["mailContent"];
  echo "<hr/>";
  if($mail){
  $mailSend = $themail->send_mail($p["email"], $p["subject"],$p["mailContent"]);
  echo "mail sent: ".$mailSend;
  echo "<br/>";
  }
}
}


