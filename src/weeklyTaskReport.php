<?php
/**
 * Created by PhpStorm.
 * User: hhuang
 * Date: 1/17/14
 * Time: 7:38 PM
 */
require("init.php");


$action = getArrayVal($_GET, "action");
switch($action){
  case "A":
break;
default:
$report = new TaskWeeklyReport();
$reports = $report->getWeeklyReport();
$themail = new emailer($settings);
foreach ($reports as $p) {
  //echo "Send mail to :".$p["email"];
  echo "<br/>";
  echo "Subject:".$p["subject"];
  echo "<br/>";
  echo $p["mailContent"];
  echo "<hr/>";
  $mailSend = $themail->send_mail($p["email"], $p["subject"],$p["mailContent"]);
  //echo "mail sent: ".$mailSend;
}
}


