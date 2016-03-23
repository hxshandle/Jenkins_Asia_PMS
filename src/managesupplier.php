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
$Supplier = new Supplier();
switch ($action) {
    case "show":
        $id = getArrayVal($_GET,'id');
        $supplierInfo = $Supplier->getSupplierById($id)[0];
        $template->assign("supplier",$supplierInfo);
        $template->assign("projects",$supplierInfo['projects']);

        $template->display("supplierInfo.tpl");
        break;
    case "addSupplier":
        $name = getArrayVal($_POST,'name');
        $user = getArrayVal($_POST,'supplierLeaderId');
        $address = getArrayVal($_POST,'address');
        $phone_number = getArrayVal($_POST,'phone_number');
        $audit_history = getArrayVal($_POST,'audit_history');
        $ret = $Supplier->create($name,$user,$address,$phone_number,$audit_history);
        $loc = $url . "managesupplier.php";
        header("Location: $loc");
        break;
    case "saveSupplier":
        $id = getArrayVal($_POST,'id');
        $name = getArrayVal($_POST,'name');
        $user = getArrayVal($_POST,'supplierLeaderId');
        $address = getArrayVal($_POST,'address');
        $phone_number = getArrayVal($_POST,'phone_number');
        $audit_history = getArrayVal($_POST,'audit_history');
        $upd = $Supplier->update($id, $name, $user, $address, $phone_number, $audit_history);
        if($upd){
            echo "Ok";
        }else{
            echo "Fail";
        }
        break;
    default:
        // show supplier main page
        $suppliers = $Supplier->getSuppliers();
        $template->assign("suppliers",$suppliers);
        $template->display("supplier.tpl");
        break;
}