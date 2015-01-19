<?php

require("./init.php");
if (!isset($_SESSION["userid"])) {
  $template->assign("loginerror", 0);
  $template->display("login.tpl");
  die();
}
$jUtils = new JUtils();

$task = (object) new task();

$action = getArrayVal($_GET, "action");
$tasklist = getArrayVal($_GET, "tasklist");
$mode = getArrayVal($_GET, "mode");
$tid = getArrayVal($_GET, "tid");
$end = getArrayVal($_POST, "end");
$project = getArrayVal($_POST, "project");
$assigned = getArrayVal($_POST, "assigned");
$distribution = getArrayVal($_POST, "distribution");
$tasklist = getArrayVal($_POST, "tasklist");
$text = getArrayVal($_POST, "text");
$title = getArrayVal($_POST, "title");
$start = getArrayVal($_POST, "start");
$location = getArrayVal($_POST, "location");
$parentTask = getArrayVal($_POST, "parent");
$taskStatus = getArrayVal($_POST, "status");
$fileId = getArrayVal($_POST, "fileId");
$statusUpdate = getArrayVal($_POST,"statusUpdate");
$oldStatusUpdate = getArrayVal($_POST,"oldStatusUpdate");

$redir = getArrayVal($_GET, "redir");
$id = getArrayVal($_GET, "id");
$deliverableId = getArrayVal($_POST, "deliverableItems");
$project = array();
$project['ID'] = $id;
$template->assign("project", $project);

// define the active tab in the project navigation
$classes = array("overview" => "overview", "msgs" => "msgs", "tasks" => "tasks_active", "miles" => "miles", "files" => "files", "users" => "users", "tracker" => "tracking");
$template->assign("classes", $classes);

$template->assign("mode", $mode);

if ($action == "addform") {
  // check if user has appropriate permissions
  if (!$userpermissions["tasks"]["add"]) {
    $errtxt = $langfile["nopermission"];
    $noperm = $langfile["accessdenied"];
    $template->assign("errortext", "<h2>$errtxt</h2><br>$noperm");
    $template->display("error.tpl");
    die();
  }

  $day = getArrayVal($_GET, "theday");
  $month = getArrayVal($_GET, "themonth");
  $year = getArrayVal($_GET, "theyear");

  $project = new project();
  $tlist = new tasklist();

  $lists = $lists = $tlist->getProjectTasklists($id, 1);
  $project_members = $project->getProjectMembers($id);

  $template->assign("year", $year);
  $template->assign("month", $month);
  $template->assign("day", $day);
  $template->assign("assignable_users", $project_members);
  $template->assign("tasklists", $lists);
  $template->assign("tasklist_id", $tasklist);
  $template->display("addtaskform.tpl");
} elseif ($action == "add") {
  // check if user has appropriate permissions
  if (!$userpermissions["tasks"]["add"]) {
    $errtxt = $langfile["nopermission"];
    $noperm = $langfile["accessdenied"];
    $template->assign("errortext", "<h2>$errtxt</h2><br>$noperm");
    $template->display("error.tpl");
    die();
  }
  if(!$id){
    $id = getArrayVal($_POST,'id');
  }
  $projectId = $id;
  $projectIns = new project();
  $project = $projectIns->getProject($id);
  $deliverableItem = new DeliverableItem();
  $deliverableItemObj = $deliverableItem->getItem($deliverableId);
  // Since for quick added task the deliverable id maybe empty
  if(!$deliverableItemObj){
    $deliverableItemObj = array("phase" => -1, "ID" => -1);
  }
  // add the task
  $tid = $task->add($start, $end, $title, $text, $tasklist, $taskStatus, $projectId, $deliverableItemObj["phase"], $deliverableItemObj["ID"], $parentTask, $location);
  
  $jUtils->updateDeliverItemEndDate($deliverableItemObj["ID"],$end);
  // if tasks was added and mailnotify is activated, send an email
  $attachmentPath = null;
  if ($tid) {
    if(!empty($fileId)){
      $task->addAttachment($tid,$fileId);
      $datei = new datei();
      $fileInfo = $datei->getFile($fileId);
      $attachmentPath=CL_ROOT."/".$fileInfo['datei'];

    }

    foreach ($assigned as $member) {
      $task->assign($tid, $member);
    }
    foreach($distribution as $member){
      $task->addDistribution($tid,$member);
    }

    if ($settings["mailnotify"]) {
      $link = "http://janus.jenkins-asia.com/"."managetask.php?action=showtask&id=$id&tid=$tid";
      foreach ($assigned as $member) {
        $usr = (object) new user();
        $user = $usr->getProfile($member);
        if (!empty($user["email"])) {
          // send email
          $themail = new emailer($settings);
          $msg = $jUtils->getNewTaskMailMsg($user["name"],$project["name"],$start,$end, $_SESSION["username"],$link,$title,$text);
          $jUtils->sendMail($user["email"], $langfile["taskassignedsubject"]." | ".$title." [JTiD-".$tid."]",$msg,null,$attachmentPath);
        }
      }
    }
    $loc = $url . "managetask.php?action=showproject&id=$id&mode=added";
    header("Location: $loc");
  }
} elseif ($action == "editform") {
  // check if user has appropriate permissions
  if (!$userpermissions["tasks"]["edit"]) {
    $errtxt = $langfile["nopermission"];
    $noperm = $langfile["accessdenied"];
    $template->assign("errortext", "<h2>$errtxt</h2><br>$noperm");
    $template->display("error.tpl");
    die();
  }

  $thistask = $task->getTask($tid);
  $project = new project();
  $deliverable = new DeliverableItem();
  $deliverableItems = $deliverable->getDeliverableItemsByProjectId($id);
  $members = $project->getProjectMembers($id, $project->countMembers($id));
  $tasklist = new tasklist();
  $tasklists = $tasklist->getProjectTasklists($id);
  $tl = $tasklist->getTasklist($thistask['liste']);
  $thistask['listid'] = $tl['ID'];
  $thistask['listname'] = $tl['name'];
  $parentTasks = $tasklist->getTasksFromList($thistask['liste']);

  $user = $task->getUser($thistask['ID']);
  $thistask['username'] = $user[1];
  $thistask['userid'] = $user[0];

  $tmp = $task->getUsers($thistask['ID']);
  if ($tmp) {
    foreach ($tmp as $value) {
      $thistask['users'][] = $value[0];
    }
  }
  $title = $langfile["edittask"];

  $template->assign("members", $members);
  $groupedUser = $jUtils->groupUsers($members);
  $template->assign("grouped_members", $groupedUser);
  $template->assign("title", $title);
  $template->assign("tasklists", $tasklists);
  $template->assign("tl", $tl);
  $template->assign("task", $thistask);
  $template->assign("isProjectLeader", $jUtils->isProjectLeader($id));
  $template->assign("pid", $id);
  $template->assign("deliverableItems", $deliverableItems);
  $taskStatus = Status::getStatusByType("task");
  $st1 = Status::getId("task","closed");
  $st2 = Status::getId("task","completed");
  $template->assign("completeStatusId", $st2);
  $template->assign("closeStatusId", $st1);
  $filterTaskStatus = array();
  foreach( $taskStatus as $ts){
    if($ts['id'] == $st1 || $ts['id'] == $st2){
      continue;
    }else{
      array_push($filterTaskStatus,$ts);
    }
  }

  $template->assign("taskStatus", $filterTaskStatus);
  $template->assign("parentTasks", $parentTasks);

  $template->display("edittask.tpl");
} elseif ($action == "edit") {
  // check if user has appropriate permissions
  if (!$userpermissions["tasks"]["edit"]) {
    $errtxt = $langfile["nopermission"];
    $noperm = $langfile["accessdenied"];
    $template->assign("errortext", "<h2>$errtxt</h2><br>$noperm");
    $template->display("error.tpl");
    die();
  }
  $len1 = strlen($statusUpdate);
  $deliverableItemId = getArrayVal($_POST,"deliverableItems");
//  $len2 = strlen($oldStatusUpdate);
  $cmt = $statusUpdate;
//  if($len1 > 0){
//    $statusUpdate = $oldStatusUpdate.'</br></br>'.$statusUpdate;
//    $dateFormat = CL_DATEFORMAT." H:i:s";
//    $today = date($dateFormat);
//    $statusUpdate .= "</br> --".$_SESSION['username']." ".$today;
//  }else{
//    $statusUpdate = $oldStatusUpdate;
//  }
  $statusUpdate = $oldStatusUpdate;
  $taskComments = new Comments();
  if($len1 > 0){
    $taskComments->addTaskComments($cmt,0,$_SESSION["userid"],$_SESSION["username"],$tid);
  }

  $completeStatus = Status::getId("task", "completed");
  $closeStatus = Status::getId("task", "closed");
  $taskStatusAction = getArrayVal($_POST,"task_status_action");
  $isSendMail = getArrayVal($_POST,"save_and_send_mail");
  $isSendMail = $isSendMail == "true";

  if(!empty($taskStatusAction)){
    $taskStatus = $taskStatusAction;
  }
  if($taskStatus ==$completeStatus || $taskStatus == $closeStatus ){
    $dateFormat = CL_DATEFORMAT." H:i:s";
    $today = date($dateFormat);
    if($taskStatus == $completeStatus){
      //$statusUpdate .= "</br> -- Task marked as completed by ".$_SESSION['username']." ".$today;
      //$cmt = "Task marked as completed by ".$_SESSION['username'];
      $taskComments->addTaskComments($cmt,0,$_SESSION["userid"],$_SESSION["username"],$tid);
    }else{
      //$cmt = " Task closed by ".$_SESSION['username'];
      $taskComments->addTaskComments($statusUpdate,0,$_SESSION["userid"],$_SESSION["username"],$tid);
      //$statusUpdate .= "</br> -- Task closed by ".$_SESSION['username']." ".$today;
    }
    
  }
  // if deliverableItem id is -1 should reset $phose id to -1;
  $deliverableItemIns = new DeliverableItem();
  $deliverableObj = $deliverableItemIns->getItem($deliverableItemId);
  if(!$deliverableObj){
    $deliverableObj = array("phase"=>-1, "ID"=>-1);
  }
  $upd = $task->edit($tid, $start, $end, $title, $text, $taskStatus,$statusUpdate, $parentTask, $location,$deliverableObj["ID"],$deliverableObj["phase"]);
  $tk = $task->getTask($tid);
  $jUtils->updateDeliverItemEndDate($tk["deliverable_item"],$end);
  $jUtils->updateDeliverItemStatus($tk["deliverable_item"]);
  $project = new project();
  $proj = $project->getProject($tk['project']);



  // edit the task
  if ($upd) {
    // distribution list
    if(!empty($distribution)){
      foreach($distribution as $ccUser){
        $task->addDistribution($tid,$ccUser);
      }
    }

    $redir = urldecode($redir);
    if (!empty($assigned)) {
      $arrCC = $task->getTaskCCList($tid);
      $hasCCed = false;
      foreach ($assigned as $assignee) {
        $assignChk = $task->assign($tid, $assignee);
        $link = "http://janus.jenkins-asia.com/"."managetask.php?action=showtask&id=$id&tid=$tid";
        if ($assignChk) {
          if ($settings["mailnotify"] && $isSendMail) {
            $usr = (object) new user();
            $user = $usr->getProfile($assignee);
            if (!empty($user["email"])) {
              // send email
              $themail = new emailer($settings);
              $mailSubject = $langfile["taskmodifiedsubject"];
              if($taskStatus ==$completeStatus || $taskStatus == $closeStatus ){
                $mailSubject = $langfile["taskclosedsubject"];
              }
              $tComments = $taskComments->getTaskComments($tid);
              $msg = $jUtils->getModifiedTaskMailMsg($proj['name'],$user["name"],$_SESSION["username"],$link,$title,$text,$tComments);
              if($hasCCed){
                if(!$themail->send_mail($user["email"], $mailSubject." | ".$title." [JTiD-".$tid."]", $msg)){
                  $template->assign("mailErr",'true');$template->assign("mailErr",'true');
                }
              }else{
                if(!$themail->send_mail($user["email"], $mailSubject." | ".$title." [JTiD-".$tid."]", $msg,$arrCC)){
                  $template->assign("mailErr",'true');
                }
                $hasCCed = true;
              }
            }
          }
        }
      }
    }
    if ($_SESSION['userRole'] > 7) {
      $redir = $url . "mytasks.php";
      header("Location: $redir");
    } else {
      $loc = $url . "managetask.php?action=showproject&id=$id&mode=edited";
      header("Location: $loc");
    }
  } else {
    $template->assign("edittask", 0);
  }
} elseif ($action == "del") {
  // check if user has appropriate permissions
  if (!$userpermissions["tasks"]["del"]) {
    $errtxt = $langfile["nopermission"];
    $noperm = $langfile["accessdenied"];
    $template->assign("errortext", "<h2>$errtxt</h2><br>$noperm");
    $template->display("error.tpl");
    die();
  }
  if ($task->del($tid)) {
    // $redir = urldecode($redir);
    if ($redir) {
      $redir = $url . $redir;
      header("Location: $redir");
    } else {
      echo "ok";
    }
  } else {
    $template->assign("deltask", 0);
  }
} elseif ($action == "open") {
  // check if user has appropriate permissions
  if (!$userpermissions["tasks"]["close"]) {
    $errtxt = $langfile["nopermission"];
    $noperm = $langfile["accessdenied"];
    $template->assign("errortext", "<h2>$errtxt</h2><br>$noperm");
    $template->display("error.tpl");
    die();
  }

  if ($task->open($tid)) {
    $redir = urldecode($redir);
    if ($redir) {
      $redir = $url . $redir;
      header("Location: $redir");
    } else {
      echo "ok";
    }
  } else {
    $template->assign("opentask", 0);
  }
} elseif ($action == "close") {
  // check if user has appropriate permissions
  if (!$userpermissions["tasks"]["close"]) {
    $errtxt = $langfile["nopermission"];
    $noperm = $langfile["accessdenied"];
    $template->assign("errortext", "<h2>$errtxt</h2><br>$noperm");
    $template->display("error.tpl");
    die();
  }
  if ($task->close($tid)) {
    $redir = urldecode($redir);
    if ($redir) {
      $redir = $url . $redir;
      header("Location: $redir");
    } else {
      echo "ok";
    }
  } else {
    $template->assign("closetask", 0);
  }
} elseif ($action == "assign") {
  if ($task->assign($id, $user)) {
    if ($settings["mailnotify"]) {
      $usr = (object) new user();
      $user = $usr->getProfile($user);

      if (!empty($user["email"])) {
        // send email
        $themail = new emailer($settings);
        $mailSent = $themail->send_mail($user["email"], $langfile["taskassignedsubject"]." [JTiD-".$id."]", $langfile["hello"] . ",<br /><br/>" . $langfile["taskassignedtext"] . " <a href = \"" . "http://janus.jenkins-asia.com/" . "managetask.php?action=showtask&id=$id&tid=$tid\">$title</a>");
        if(!$mailSent){
          $template->assign("mailErr","true");
        }
      }
    }
    $template->assign("assigntask", 1);
    $template->display("mytasks.tpl");
  } else {
    $template->assign("assigntask", 0);
  }
} elseif ($action == "deassign") {
  if ($task->deassign($id, $user)) {
    $template->assign("deassigntask", 1);
    $template->display("mytasks.tpl");
  } else {
    $template->assign("deassigntask", 0);
  }
} elseif ($action == "showproject") {
  if (!chkproject($userid, $id)) {
    $errtxt = $langfile["notyourproject"];
    $noperm = $langfile["accessdenied"];
    $template->assign("errortext", "$errtxt<br>$noperm");
    $template->display("error.tpl");
    die();
  }
  $tasklist = new tasklist();
  $lists = $tasklist->getProjectTasklists($id);
  $groupedTasks = $tasklist->groupTasks($lists,$id);
  $oldlists = $tasklist->getProjectTasklists($id, 0);

  $myproject = new project();
  $project_members = $myproject->getProjectMembers($id, $myproject->countMembers($id));

  $milestone = new milestone;
  $milestones = $milestone->getAllProjectMilestones($id);

  $deliverable = new DeliverableItem();
  $deliverableItems = $deliverable->getDeliverableItemsByProjectId($id);

  $planSt1 = Status::getId("project","planning");
  $planSt2 = Status::getId("project","need_approve");
  $pro = $myproject->getProject($id);
  $projectname = $pro["name"];
  $title = $langfile['tasks'];
  $curUserId = $_SESSION["userid"];
  if(($pro["status"] == $planSt1 || $pro["status"] == $planSt2 )&& ($pro["project_leader"] || $_SESSION["userRole"] <= 4)){
    $template->assign("canEditDeilverableItem", true);
  }

  $template->assign("title", $title);
  $template->assign("milestones", $milestones);
  $template->assign("deliverableItems", $deliverableItems);
  $template->assign("projectname", $projectname);
  $template->assign("projectId", $id);
  $template->assign("uploadType", "task");
  $template->assign("assignable_users", $project_members);
  $groupedUser = $jUtils->groupUsers($project_members);
  $template->assign("grouped_assignable_users", $groupedUser);
  $taskStatus = Status::getStatusByType("task");
  $template->assign("taskStatus", $taskStatus);

  $template->assign("lists", $lists);
  $template->assign("groupedTasks",$groupedTasks);

  $template->assign("oldlists", $oldlists);
  //$template->assign("oldlists", $a);
  $template->debugging = false;
  $template->display("projecttasks.tpl");
}elseif($action == "quickAddTask"){
  $myProjects = $jUtils->getAllProjects();
  $taskStatus = Status::getStatusByType("task");
  $template->assign("taskStatus", $taskStatus);
  $template->assign("myProjects", $myProjects);
  $template->display("quickAddTask.tpl");
}elseif ($action == "showtask") {
  if (!chkproject($userid, $id)) {
    $errtxt = $langfile["notyourproject"];
    $noperm = $langfile["accessdenied"];
    $template->assign("errortext", "$errtxt<br>$noperm");
    $template->display("error.tpl");
    die();
  }
  $myproject = new project();
  $pro = $myproject->getProject($id);
  $projectname = $pro["name"];

  $title = $langfile['task'];

  $mytask = new task();
  $task = $mytask->getTask($tid);
  $comments = new Comments();
  $commentsList = $comments->getTaskComments($tid);

  $members = $myproject->getProjectMembers($id, $myproject->countMembers($id));
  $tasklist = new tasklist();
  $tasklists = $tasklist->getProjectTasklists($id);
  $tl = $tasklist->getTasklist($task['liste']);
  $task['listid'] = $tl['ID'];
  $task['listname'] = $tl['name'];

  $tmp = $mytask->getUsers($task['ID']);
  if ($tmp) {
    foreach ($tmp as $value) {
      $task['users'][] = $value[0];
    }
  }

  $user = $mytask->getUser($task['ID']);
  $task['username'] = $user[1];
  $task['userid'] = $user[0];
  $deliverable = new DeliverableItem();
  $deliverableItems = $deliverable->getDeliverableItemsByProjectId($id);

  if($_SESSION['userRole'] >=8){
    $isAssignee = false;
    foreach($task['users'] as $u){
      if($u['ID'] == $_SESSION['userid']){
        $isAssignee = true;
      }
    }
    if(!$isAssignee){
      $template->assign("editable", 'false');      
    }
  }

  $template->assign("members", $members);
  $groupedUser = $jUtils->groupUsers($members);
  $template->assign("grouped_members", $groupedUser);
  $template->assign("projectId", $id);
  $template->assign("tasklists", $tasklists);
  $template->assign("deliverableItems", $deliverableItems);
  $template->assign("isProjectLeader", $jUtils->isProjectLeader($id));
  $template->assign("taskComments",$commentsList);
  $taskStatus = Status::getStatusByType("task");

  $st1 = Status::getId("task","closed");
  $st2 = Status::getId("task","completed");
  $template->assign("completeStatusId", $st2);
  $template->assign("closeStatusId", $st1);
  $filterTaskStatus = array();
  foreach( $taskStatus as $ts){
    if($ts['id'] == $st1 || $ts['id'] == $st2){
      continue;
    }else{
      array_push($filterTaskStatus,$ts);
    }
  }

  $template->assign("taskStatus", $filterTaskStatus);
  $parentTasks = $tasklist->getTasksFromList($task['liste']);
  $template->assign("parentTasks", $parentTasks);
  $template->assign("tl", $tl);
  $template->assign("pid", $id);

  $template->assign("projectname", $projectname);
  $template->assign("title", $title);
  $template->assign("task", $task);
  $template->assign("files",$task["attachments"]);
  $template->display("task.tpl");
} elseif ($action == "ical") {
  $mytask = new task();
  $task = $mytask->getIcal($userid);
}
