<?php
require("./init.php");
// check if user is logged in
if (!isset($_SESSION["userid"]))
{
    $template->assign("loginerror", 0);
    $template->display("login.tpl");
    die();
}
$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}


switch ($action) {
  case "showproject":
    $id = getArrayVal($_GET, "id");
    $myproject = new project();
    $quality = new Quality();
    $pro = $myproject->getProject($id);
    $qualityList = $quality->getQualityByProjectId($id);
    $projectname = $pro['name'];
    $template->assign("project", $pro);
    $template->assign("qualitys", $qualityList);
    $template->assign("projectname", $projectname);
    $template->display("projectquality.tpl");
    break;
  default:
    break;
}
?>