<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include("init.php");
if (!isset($_SESSION["userid"]))
{
    $template->assign("loginerror", 0);
    $template->display("login.tpl");
    die();
}
$action = getArrayVal($_GET, "action");
$projectId = getArrayVal($_GET, "id");

switch ($action){
  case "load":
    $project = new project();
    $ganttBuilder = new GanttXml();
    $text = $ganttBuilder->buildProject($projectId);
    header( 'Content-Type:   text/xml '); 
    echo $text;
    break;
  default:
    break;
}
?>
