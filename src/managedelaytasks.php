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
  case "showdelaytasks":
    $customers = $jUtils->getAllCustomers();
    $projectLeaders = $jUtils->getAllProjectLeaders();
    $template->assign("customers",$customers);
    $template->assign("projectLeaders",$projectLeaders);
    $template->display("delaytasks.tpl");
    break;
  case "filterDelayTasks":
    $customer = getArrayVal($_GET, "customer");
	  $projectLeader = getArrayVal($_GET,"projectLeader");
    $task = new task();
    if(empty($projectLeader)){
      $tasks = $task->getDelayTasksByCustomerName($customer);
    }else{
      $tasks = $task->getDelayTasksByProjectLeader($projectLeader);
    }

    $template->assign("tasks",$tasks);
    $template->assign("groupedTasks",$tasks);
    $template->display("delaytaskTable.tpl");
    break;
  case "sendReminder":
    $strids = getArrayVal($_POST, "ids");
    $delaytasks = explode(",", $strids);
    $task = new task();
    if(!empty($delaytasks)){
      foreach($delaytasks as $tId){
        $t = $task->getTask($tId);
        $users = $t['users'];
        $projectId = $t['project'];
        $link = $url."managetask.php?action=showtask&id=$projectId&tid=$tId";
        foreach($users as $user){
          if (!empty($user["email"])) {
            $themail = new emailer($settings);
            $msg = $jUtils->getDelayedTaskMailMsg($user["name"],$t['title'],$t['text'],$link,$t['status_update']);
            $themail->send_mail($user["email"], $langfile["taskdelayedsubject"]." | ".$t['title'], $msg);
          }
        }
      }
    }
    echo "Ok";
    break;
  default:
    echo "coming soon...";
    break;
}


?>
