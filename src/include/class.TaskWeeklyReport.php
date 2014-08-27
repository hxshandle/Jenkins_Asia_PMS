<?php
/**
 * Created by PhpStorm.
 * User: hhuang
 * Date: 1/17/14
 * Time: 7:47 PM
 */

class TaskWeeklyReport {

  function getAllUsers(){
    $sql = "select * from `user`";
    $sel = mysql_query($sql);
    $users = array();
    $userBean = array();
    while($row = mysql_fetch_array($sel)){
      $userBean[$row["ID"]] = $row;
      array_push($users,$row);
    }
    return array($users,$userBean);
  }

  function getUserWeeklySummary($user,$startDate){
    $task = new task();
    $summary = array();
    $newTasks = $task->getLastWeekNewTasks($user,$startDate);
    $openTasks = $task->getLastWeekOpenTasks($user,$startDate);
    $closedTasks = $task->getLastWeekClosedTasks($user,$startDate);
    $delayedTasks = $task->getLastWeekDelayTasks($user,$startDate);

    $newTasksCount = count($newTasks);
    $openTasksCount = count($openTasks);
    $closedTasksCount = count($closedTasks);
    $delayedTasksCount = count($delayedTasks);
    $summary["newTasks"] = $newTasks;
    $summary["openTasks"] = $openTasks;
    $summary["closedTasks"] = $closedTasks;
    $summary["delayedTasks"] = $delayedTasks;
    $summary["newTasksCount"] = $newTasksCount;
    $summary["openTasksCount"] = $openTasksCount;
    $summary["closedTasksCount"] = $closedTasksCount;
    $summary["delayedTasksCount"] = $delayedTasksCount;
    return $summary;
  }

  function _buildTaskTable($projectBeans,$userBeans,$tasks,$type){
    $h = "";
    $h .="<table style='border:1px solid #E9E9E9' cellpadding='0' cellspacing='0'>";
    // header
    $h .="<tr style='background:#C0C0C0'>";
    $h .="<th>Project</th>";
    $h .="<th>Task</th>";
    $h .="<th>Assigned by</th>";
    $h .="<th>Due Date</th>";
    if($type =="delay"){
      $h .="<th>Delayed</th>";
    }else{
      $h .="<th>Days Remaining</th>";
    }
    $h .="<th>link</th>";
    $h .="</tr>";
    // body
    $idx = 0;
    foreach ($tasks as $task) {
      $idx++;
      $bg = "background:#fff";
      if($idx%2 ==0){
        $bg="background:#F1F1F1";
      }
      $h .="<tr style='".$bg."'>";
      $h .="<td>".$projectBeans[$task["project"]]["name"]."</td>";
      $h .="<td>".$task["title"]."</td>";
      if($task["created_by"] != null){
        $h .="<td>".$userBeans[$task["created_by"]]["name"]."</td>";
      }else{
        $h .="<td>N/A</td>";
      }
      $dueDate = date("Y-m-d",strtotime($task["end_date"]));
      $h .="<td>".$dueDate."</td>";
      $now = date("Y-m-d");
      $date1 = new DateTime($now);
      $date2 = new DateTime($dueDate);
      $interval = date_diff($date1, $date2);
      $days = $interval->format('%a days');
      $h .="<td>".$days."</td>";
      $link = "http://janus.jenkins-asia.com/managetask.php?action=showtask&tid=".$task["ID"]."&id=".$task["project"];
      $h .="<td><a target='_blank' href='".$link."'>open</a></td>";
      $h .="<tr>";
    }


    $h .="</table>";
    return $h;
  }

  function _buildCSS(){
    $h = "";
    $h .= "<style>";
    $h .= "*{font-family:Helvetica,Calibri,Arial}";
    $h .= "td,th{padding:8px 8px;border-bottom:1px solid #E9E9E9}";
    $h .= "</style>";
    return $h;
  }

  function _buildMialContent($userId,$projectBeans,$userBeans,$taskSummary){
    $lineBreak = "<br/>";
    $h = $this->_buildCSS();
    $h .="Dear ".$userBeans[$userId]["name"].",";
    $h .="<p>This week’s Task Summary:</p>";
    $h .="<ul style='list-style:none'>";
    $h .="<li>New Tasks:".$taskSummary["newTasksCount"]."</li>";
    $h .="<li>Open Tasks:".$taskSummary["openTasksCount"]."</li>";
    $h .="<li>Closed Tasks:".$taskSummary["closedTasksCount"]."</li>";
    $h .="<li><span style='color:red'>Delayed Tasks:".$taskSummary["delayedTasksCount"]."</span></li>";
    $h .="</ul>";
    $h .= "<p>Please see below for outstanding tasks assigned to you.</p>";
    $h .= "<p>Logging on to Janus before clicking on the links will being you directly to the tasks. Thank you.</p>";

    //delay tasks;
    if($taskSummary["delayedTasksCount"] > 0){
      $h .="<div style='color:red;font-weight: bold;'>Delayed Tasks</div>";
      $h .= $this->_buildTaskTable($projectBeans,$userBeans,$taskSummary["delayedTasks"],"delay");
      $h .=$lineBreak;
    }


    if($taskSummary["newTasksCount"] > 0){
      $h .="<div style='font-weight: bold;'>New Tasks</div>";
      $h .= $this->_buildTaskTable($projectBeans,$userBeans,$taskSummary["newTasks"],"new");
      $h .=$lineBreak;
    }

    if($taskSummary["openTasksCount"] > 0){
      $h .="<div style='font-weight: bold;'>Open Tasks</div>";
      $h .= $this->_buildTaskTable($projectBeans,$userBeans,$taskSummary["openTasks"],"open");
      $h .=$lineBreak;
    }
    $h .="This is an automated email. Please do not reply.";
    return $h;
  }

  function generateReport($data,$userBeans){
    $reports = array();
    $project = new project();
    $projectBeans = $project->getProjectBeans();
    foreach ($data as $userId => $taskSummary) {
      $h = $this->_buildMialContent($userId,$projectBeans,$userBeans,$taskSummary);
      $userInfo = $userBeans[$userId];
      $mailEntry = array();
      $mailEntry["subject"] = "Janus Weekly Summary ".date("Y-m-d");
      $mailEntry["email"] = $userInfo["email"];
      $mailEntry["userName"] = $userInfo["name"];
      $mailEntry["mailContent"] = $h;
      array_push($reports,$mailEntry);
    }
    return $reports;

  }

  function getWeeklyReport(){
    $startDate = date("Y-m-d",mktime(0,0,0,date("m"),date("d")-7,date("Y")));
    $users = $this->getAllUsers();
    $usersRow = $users[0];
    $userBeans = $users[1];
    $task = new task();
    $task->updateDeleyTasks();
    $userTasks = array();
    foreach($usersRow as $user){
      $userWeeklyReport = $this->getUserWeeklySummary($user["ID"],$startDate);
      $userTasks[$user["ID"]] = $userWeeklyReport;
    }
    $report = $this->generateReport($userTasks,$userBeans);
    return $report;
  }

} 