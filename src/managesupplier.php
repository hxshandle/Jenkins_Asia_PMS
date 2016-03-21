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
    case "addSupplier":
        $name = getArrayVal($_POST,'name');
        $user = getArrayVal($_POST,'supplierLeaderId');
        $address = getArrayVal($_POST,'name');
        $phone_number = getArrayVal($_POST,'phone_number');
        $audit_history = getArrayVal($_POST,'audit_history');
        $Supplier = new Supplier();
        $ret = $Supplier->create($name,$user,$address,$phone_number,$audit_history);
        $loc = $url . "managesupplier.php";
        header("Location: $loc");
        break;
    default:
        // show supplier main page
        $Supplier = new Supplier();
        $suppliers = $Supplier->getSuppliers();
        $template->assign("suppliers",$suppliers);
        $template->display("supplier.tpl");
        break;
}