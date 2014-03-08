<?php
/**
 * Created by PhpStorm.
 * User: handle
 * Date: 2/21/14
 * Time: 1:27 PM
 */

require("./init.php");
if (!isset($_SESSION["userid"])) {
  $template->assign("loginerror", 0);
  $template->display("login.tpl");
  die();
}
$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}
$jUtils = new JUtils();
switch ($action) {
  case "show":
    break;
  default:
    $template->display("supplier.tpl");
    break;
}