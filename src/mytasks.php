<?php
include("init.php");
if (!isset($_SESSION["userid"])) {
  $template->assign("loginerror", 0);
  $template->display("login.tpl");
  die();
}

$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}



$customer = getArrayVal($_GET, "customer");
$projectLeader = getArrayVal($_GET, "projectLeader");

function queryTasks($template,$myprojects,$langfile){
  $task = new task();
  $jUtils = new JUtils();
  $project = new project();
  $milestone = new milestone();
  $milestones = array();
  $cou = 0;
  $tasknum = 0;
  $ltasksa = array();
  $tlist = new tasklist();
  if (!empty($myprojects)) {
    foreach ($myprojects as $proj) {
      $tasks = $task->getAllMyProjectTasks($proj["ID"], 10000);
      $lists = $tlist->getProjectTasklists($proj["ID"], 1);
      $donetasks = $task->getMyDoneProjectTasks($proj["ID"], 10000);

      $myprojects[$cou]['tasks'] = $tasks;
      $myprojects[$cou]['oldtasks'] = $donetasks;
      $myprojects[$cou]['lists'] = $lists;

      if (!empty($tasks)) {
        $pcount = count($tasks);
      } else {
        $pcount = 0;
      }
      $myprojects[$cou]['tasknum'] = $pcount;
      if (!empty($tasks)) {
        $tcount = count($tasks);
        $tasknum = $tasknum + $tcount;
      }
      $cou = $cou + 1;
    }
  }

  $customers = $jUtils->getAllCustomers();
  $projectLeaders = $jUtils->getAllProjectLeaders();
  $template->assign("customers", $customers);
  $template->assign("projectLeaders", $projectLeaders);

  $title = $langfile['mytasks'];
  $template->assign("title", $title);
  $template->assign("tasknum", $tasknum);
  $template->assign("myprojects", $myprojects);
}

function convertProjectId($myprojects){
  $projectIds = array();
  foreach($myprojects as $id){
    array_push($projectIds,$id[0]);
  }
  return $projectIds;
}

switch ($action) {
  case "filterMyTask":
    $myprojects = $project->getMyProjectIds($userid);
    if($customer && $customer !="-1"){
      $projectIds = convertProjectId($myprojects);
      $myprojects = $project->filterMyProjectIdsByCustomer($projectIds,$customer);
    }
    if($projectLeader && $projectLeader!="-1"){
      $projectIds = convertProjectId($myprojects);
      $myprojects = $project->filterMyProjectIdsByProjectLeader($projectIds,$projectLeader);
    }

    queryTasks($template,$myprojects,$langfile);
    $template->display("mytasks_sections.tpl");
    break;
  default:

    $myprojects = $project->getMyProjectIds($userid);
    queryTasks($template,$myprojects,$langfile);
    $template->display("mytasks.tpl");
    break;

}

?>