<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

require("init.php");
$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}
$jUtils = new JUtils();
switch ($action) {
  case "showAddFinanceDlg":
    $template->assign("currency", Currency::$Currencys);
    $template->display("addFinanceDlg.tpl");
    break;
    
}
?>
