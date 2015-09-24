<?php
require("init.php");
$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}
$jUtils = new JUtils();
switch ($action) {
  case "sendMail":
    $to = getArrayVal($_POST, "to");
    $subject = getArrayVal($_POST, "subject");
    $content = getArrayVal($_POST, "content");
    $msg = $jUtils->sendMail($to, $subject,$content);
    $template->assign("msg",$msg."ddddddddd");
    $template->display("emailValidator.tpl");

    break;
  default:
    $template->display("emailValidator.tpl");
    break;
}