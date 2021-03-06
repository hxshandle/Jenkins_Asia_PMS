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
        $Tag = new Tag();
        $allTags = $Tag->getAllTags();
        $allTagStr = "";
        foreach ($allTags as $tag) {
            $allTagStr .= $tag['name'] . ",";
        }
        $allTagStr = rtrim($allTagStr, ",");
        $sysSuppliers = $Supplier->getAllSystemSupplierUsers();
        $allSupplierStr = "";
        foreach ($sysSuppliers as $sp) {
            $allSupplierStr .= $sp['name'] . ",";
        }
        $allSupplierStr = rtrim($allSupplierStr, ",");
        $id = getArrayVal($_GET, 'id');
        $supplierInfo = $Supplier->getSupplierById($id)[0];
        $template->assign("supplier", $supplierInfo);
        $template->assign("projects", $supplierInfo['projects']);
        $template->assign("SCAs", $supplierInfo['SCA']);
        $template->assign("orders", $supplierInfo['orders']);
        $template->assign("files", $supplierInfo['files']);
        $template->assign("allTagStr", $allTagStr);
        $template->assign("allSupplierStr", $allSupplierStr);

        $template->display("supplierInfo.tpl");
        break;
    case "addSupplier":
        $name = getArrayVal($_POST, 'name');
        $users = getArrayVal($_POST, 'users');
        $tags = getArrayVal($_POST,'tags');
        $address = getArrayVal($_POST, 'address');
        $phone_number = getArrayVal($_POST, 'phone_number');
        $audit_history = getArrayVal($_POST, 'audit_history');
        $newId = $Supplier->create($name, $users, $address, $phone_number, $audit_history);
        if($newId){
            $Tag = new Tag();
            $Tag->saveSupplierTags($newId,$tags);
        }
        $loc = $url . "managesupplier.php";
        header("Location: $loc");
        break;
    case "saveSupplier":
        $id = getArrayVal($_POST, 'id');
        $name = getArrayVal($_POST, 'name');
        $users = getArrayVal($_POST,'users');
        $tags = getArrayVal($_POST,'tags');
        $address = getArrayVal($_POST, 'address');
        $phone_number = getArrayVal($_POST, 'phone_number');
        $audit_history = getArrayVal($_POST, 'audit_history');
        $upd = $Supplier->update($id, $name, $users, $address, $phone_number, $audit_history);
        $Tag = new Tag();
        $Tag->saveSupplierTags($id,$tags);
        if ($upd) {
            echo "Ok";
        } else {
            echo "Fail";
        }
        break;
    case "uploadDocument":
        $id = getArrayVal($_POST, 'id');
        $uploaddir = CL_ROOT . "/files/" . CL_CONFIG . "/supplierDocuments/$id/";

        if (!file_exists($uploaddir)) {
            if (!mkdir($uploaddir, 0777, true)) {
                return "Error to create folder " . $makefolder;
            }
        }
        // do upload file
        $timestamp = (new DateTime())->getTimestamp();
        $pathInfo = pathinfo($_FILES['userfile']['name']);
        $fileNameWithST = $pathInfo['filename'] . '_' . $timestamp . '.' . $pathInfo['extension'];
        $uploadfile = $uploaddir . $fileNameWithST;

        if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
            $file_path = "/supplierDocuments/$id/".$fileNameWithST;
            $Supplier->uploadFile($_POST,$file_path);
        } else {

        }
        $loc = $url . "managesupplier.php?action=show&id=" . $id;
        header("Location: $loc");
        break;
    default:
        // show supplier main page
        $Tag = new Tag();
        $allTags = $Tag->getAllTags();
        $allTagStr = "";
        foreach ($allTags as $tag) {
            $allTagStr .= $tag['name'] . ",";
        }
        $allTagStr = rtrim($allTagStr, ",");

        $sysSuppliers = $Supplier->getAllSystemSupplierUsers();
        $allSupplierStr = "";
        foreach ($sysSuppliers as $sp) {
            $allSupplierStr .= $sp['name'] . ",";
        }
        $allSupplierStr = rtrim($allSupplierStr, ",");
        $suppliers = $Supplier->getSuppliers();
        $template->assign("suppliers", $suppliers);
        $template->assign("allTagStr", $allTagStr);
        $template->assign("allSupplierStr", $allSupplierStr);
        $template->display("supplier.tpl");
        break;
}