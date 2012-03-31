<?php
include("./init.php");
// check if user is logged in
if (!isset($_SESSION["userid"])) {
    $template->assign("loginerror", 0);
    $template->display("login.tpl");
    die();
}
$action = getArrayVal($_POST, "action");
if(!$action){
  $action = getArrayVal($_GET, "action");
}
$projectId = getArrayVal($_GET,"id");
$userId = getArrayVal($_GET, "userId");
switch ($action){
  case "getcal":

    $thisd = date("j");
    $thism = date("n");
    $thisy = date("Y");

    $m = getArrayVal($_GET, "m");
    $y = getArrayVal($_GET, "y");
    if (!$m){
        $m = $thism;
    }
    if (!$y){
        $y = $thisy;
    }

    $nm = $m + 1;
    $pm = $m -1;
    if ($nm > 12){
        $nm = 1;
        $ny = $y + 1;
    }else{
        $ny = $y;
    }
    if ($pm < 1){
        $pm = 12;
        $py = $y-1;
    }else{
        $py = $y;
    }
    $today = date("d");

    $rc = new ResourceCalendar();
    $cal = $rc->getCal($m, $y,$projectId,$userId);
    $weeks = $cal->calendar;
    $mstring = strtolower(date('F', mktime(0, 0, 0, $m, 1, $y)));
    $mstring = $langfile[$mstring];
    $template->assign("mstring", $mstring);

    $template->assign("m", $m);
    $template->assign("y", $y);
    $template->assign("thism", $thism);
    $template->assign("thisd", $thisd);
    $template->assign("thisy", $thisy);
    $template->assign("nm", $nm);
    $template->assign("pm", $pm);
    $template->assign("ny", $ny);
    $template->assign("py", $py);
    $template->assign("weeks", $weeks);
    $template->display("resourcecalbody.tpl");

    break;
  case "showproject":
    $project = new project();
    
    $users = $project->getProjectMembers($projectId);
    $tproject = $project->getProject($projectId);
    $template->assign("project", $tproject);
    $template->assign("users", $users);
    $template->display("resourcecal.tpl");
    break;
}
?>