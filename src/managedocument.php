<?php
require("init.php");
$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}

switch ($action) {
case "mydocument":
  $template->display("document.tpl");
  break;
default:
  break;
}
?>
