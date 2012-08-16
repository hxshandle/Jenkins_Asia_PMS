<?php
require("init.php");
$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}

switch ($action) {
case "mydocument":
  $template->assign("projectId",-1);
  $template->display("document.tpl");
  break;
default:
  break;
}
?>
