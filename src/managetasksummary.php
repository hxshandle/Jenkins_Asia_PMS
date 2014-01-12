<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 * 
 */

require("./init.php");

$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}


$jUtils = new JUtils();

switch ($action) {
  case "showtasks":
    $customers = $jUtils->getAllCustomers();
    $projectLeaders = $jUtils->getAllProjectLeaders();
    $template->assign("customers",$customers);
    $template->assign("projectLeaders",$projectLeaders);
    $template->display("taskSummary.tpl");
    break;
  case "filterTasks":
    $customer = getArrayVal($_GET, "customer");
	  $projectLeader = getArrayVal($_GET,"projectLeader");
    $task = new task();
    if(empty($projectLeader)){
      $tasks = $task->getTaskSummaryByCustomerName($customer);
    }else{
      $tasks = $task->getTaskSummaryByProjectLeader($projectLeader);
    }
    $template->assign("tasks",$tasks);
    $template->assign("groupedTasks",$tasks);
    $template->display("_tasksGroupedByProject.tpl");
    break;
  default:
    echo "coming soon...";
    break;
}


?>
