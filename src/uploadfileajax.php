<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include("./init.php");
xdebug_disable();
// check if user is logged in
$id = getArrayVal($_POST, "id");
$name = getArrayVal($_POST, "name");
$desc = getArrayVal($_POST, "desc");
$tags = getArrayVal($_POST, "tags");
$title = getArrayVal($_POST, "title");
$upfolder = getArrayVal($_POST, "upfolder");

$myfile = new datei();
if (isset($_POST["PHPSESSID"])) {
session_id($_POST["PHPSESSID"]);
} else if (isset($_GET["PHPSESSID"])) {
session_id($_GET["PHPSESSID"]);
}

session_start();

if ($upfolder) {
    $thefolder = $myfile->getFolder($upfolder);
    $thefolder = $thefolder["name"];
    $upath = "files/" . CL_CONFIG . "/$id/" . $thefolder;
} else {
    $upath = "files/" . CL_CONFIG . "/$id";
    $upfolder = 0;
}
//echo "project".$id;
//echo "pp_>".$upath;
$ret = $myfile->upload("Filedata",$upath,$id,$upfolder);
echo $ret;
?>
