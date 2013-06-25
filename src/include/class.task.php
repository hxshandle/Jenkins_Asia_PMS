<?php

/**
 * This class provides methods to realize tasks
 *
 * @author Philipp Kiszka <info@o-dyn.de>
 * @name task
 * @package Collabtive
 * @version 0.5.5
 * @link http://www.o-dyn.de
 * @license http://opensource.org/licenses/gpl-license.php GNU General Public License v3 or later
 * @global $mylog
 */
class task {

  private $mylog;
  private $plugins;

  /**
   * Constructor
   * Initializes the event log
   */
  function __construct() {
    $this->mylog = new mylog;
  }
  
  
  function getDelayTasks(){
    $st1 = Status::getId("task", "completed");
    $st2 = Status::getId("task", "closed");
    $sql = "select ID from tasks where end_date < NOW() and status not in ($st1,$st2)";
    $sel = mysql_query($sql);
    $ret = array();
    while($row = mysql_fetch_array($sel)){
      array_push($ret,$row[0]);
    }
    return $ret;
  }
  
  function getDelayTasksByCustomerName($customer){
    $customer = mysql_escape_string($customer);
    $st1 = Status::getId("task", "completed");
    $st2 = Status::getId("task", "closed");
    $sql = "select t.ID from tasks t,projekte p where t.end_date < NOW() and t.status not in ($st1,$st2) and p.customer_name= '$customer' and t.project=p.id";
    $sel = mysql_query($sql);
    $ret = array();
    while($row = mysql_fetch_array($sel)){
      $tk = $this->getTask($row[0]);
      array_push($ret,$tk);
    }
    return $ret;
  }
  

  function add($startDate, $endDate, $title, $text, $liste, $status, $project, $phase, $deliverableItem, $parent, $location, $valid = 1) {
    $title = mysql_escape_string($title);
    $text = mysql_escape_string($text);
    $status = $status == NULL ? Status::getId("task", "not_start") : (int) $status;
    $project = (int) $project;
    $deliverableItem = (int) $deliverableItem;
    $parent = $parent == NULL ? 'NULL' : (int) $parent;
    $location = mysql_escape_string($location);
    $created_by = $_SESSION['userid'];
    $valid = (int) $valid;
    $sql = "INSERT INTO `tasks`
              (
              `start_date`,
              `end_date`,
              `title`,
              `text`,
              `liste`,
              `status`,
              `project`,
              `phase`,
              `deliverable_item`,
              `parent`,
              `location`,
              `created_by`,
              `valid`)
              VALUES
              (
              '$startDate',
              '$endDate',
              '$title',
              '$text',
              $liste,
              $status,
              $project,
              $phase,
              $deliverableItem,
              $parent,
              '$location',
              $created_by,
              $valid
              );
              ";
    $ins = mysql_query($sql);
    if ($ins) {
      return mysql_insert_id();
    } else {
      return false;
    }
  }

  function addAttachment($taskId, $fileId) {
    $taskId = (int) $taskId;
    $fileId = (int) $fileId;
    $sql = "INSERT INTO `task_attachement`
              (
              `taskId`,
              `fileId`)
              VALUES
              (
              $taskId,
              $fileId
              )";
    $ins = mysql_query($sql);
    
    if ($ins) {
      $insertId =  mysql_insert_id();
      $sql0 = "select name from files where id = $fileId";
      $sel0 = mysql_query($sql0);
      $fileName = "";
      while($row = mysql_fetch_row($sel0)){
        $fileName = $row[0];
      }
      $sql1 = "select status_update from tasks where id =  $taskId";
      $sel1 = mysql_query($sql1);
      while ($row = mysql_fetch_row($sel1)) {
       $updateStatus =  $row[0];
       $dateFormat = CL_DATEFORMAT." H:i:s";
       $today = date($dateFormat);
       $updateStatus .="<br/> added new file ".$fileName."<br/>  --".$_SESSION['username']." ".$today;
       $sql2 = "update tasks set status_update = '$updateStatus' where id = $taskId";
       mysql_query($sql2);
      }
      
      return $insertId;
    } else {
      return false;
    }
  }

  /**
   * Edit a task
   *
   * @param int $id Task ID
   * @param string $end Due date
   * @param string $title Title of the task
   * @param string $text Task description
   * @param int $liste Tasklist
   * @param int $assigned ID of the user who has to complete the task
   * @return bool
   */
  function edit($id, $start, $end, $title, $text, $taskStatus,$statusUpdate, $parentTask, $location) {
    $end = mysql_real_escape_string($end);
    $title = mysql_real_escape_string($title);
    $text = mysql_real_escape_string($text);
    $statusUpdate = mysql_real_escape_string($statusUpdate);
    $id = (int) $id;
    $liste = (int) $liste;
    $taskStatus = (int) $taskStatus;
    $parentTask = (int) $parentTask;
    $location = mysql_real_escape_string($location);

    //$end = strtotime($end);
    $sql = "UPDATE tasks SET `start_date`='$start', `end_date`='$end',`title`='$title', `status`=$taskStatus ,`status_update`='$statusUpdate',`parent`=$parentTask ,`location`='$location' WHERE ID = $id";
    $upd = mysql_query($sql);
    mysql_query("DELETE FROM tasks_assigned WHERE `task` = $id");
    mysql_query("DELETE FROM task_distribution WHERE `task_id` = $id");


    if ($upd) {
      $nameproject = $this->getNameProject($id);
      $this->mylog->add($nameproject[0], 'task', 2, $nameproject[1]);
      return true;
    } else {
      return false;
    }
  }

  function getMyRequestedTasks(){
    $userId = $_SESSION['userid'];
    $st1 = Status::getId("task","closed");
    $st2 = Status::getId("task","completed");
    $sql = "select ID from tasks where created_by = $userId and status not in ($st1,$st2)";
    $sel = mysql_query($sql);
    $ret = array();
    while ($tk = mysql_fetch_array($sel)){
      $task = $this->getTask($tk["ID"]);
      array_push($ret,$task);
    }
    return $ret;
  }


  /**
   * Delete a task
   *
   * @param int $id Task ID
   * @return bool
   */
  function del($id) {

    return $this->close($id);
    /*
    $nameproject = $this->getNameProject($id);
    $del = mysql_query("DELETE FROM tasks WHERE ID = $id LIMIT 1");
    if ($del) {
      $del2 = mysql_query("DELETE FROM tasks_assigned WHERE task=$id");
      $this->mylog->add($nameproject[0], 'task', 3, $nameproject[1]);
      return true;
    } else {
      return false;
    }*/
  }

  function delTasksByDeliverableItemId($id) {
    $id = (int) $id;
    $del = mysql_query("update `tasks` set `valid` = 0 where `deliverable_item`=$id");
    return $del;
  }

  function delTasksByProjectId($id) {
    $id = (int) $id;
    $del = mysql_query("update `tasks` set `valid` = 0 where `project`=$id");
    return $del;
  }

  function delTasksByPhaseId($id) {
    $id = (int) $id;
    $del = mysql_query("update `tasks` set `valid` = 0 where `phase`=$id");
    return $del;
  }

  function closeTasksByDeliverableItemId($id) {
    $id = (int) $id;
    $status = Status::getId("task", "closed");
    $del = mysql_query("update `tasks` set `status` = $status where `deliverable_item`=$id");
    return $del;
  }

  function closeTasksByPhaseId($id) {
    $id = (int) $id;
    $status = Status::getId("task", "closed");
    $del = mysql_query("update `tasks` set `status` = $status where `phase`=$id");
    return $del;
  }

  function closeTasksByProjectId($id) {
    $id = (int) $id;
    $status = Status::getId("task", "closed");
    $del = mysql_query("update `tasks` set `status` = $status where `project`=$id");
    return $del;
  }

  /**
   * Reactivate / open a task
   *
   * @param int $id Task ID
   * @return bool
   */
  function open($id) {
    $id = (int) $id;

    $upd = mysql_query("UPDATE tasks SET status = 1 WHERE ID = $id");
    if ($upd) {
      $nameproject = $this->getNameProject($id);
      $this->mylog->add($nameproject[0], 'task', 4, $nameproject[1]);
      return true;
    } else {
      return false;
    }
  }

  /**
   * Close a task. If it's the last task of its tasklist, the list gets closed, too.
   *
   * @param int $id Task ID
   * @return bool
   */
  function close($id) {
    $id = (int) $id;

    $upd = mysql_query("UPDATE tasks SET status = 0 WHERE ID = $id");

    /*
      $sql = mysql_query("SELECT liste FROM tasks WHERE ID = $id");
      $liste = mysql_fetch_row($sql);
      $sql2 = mysql_query("SELECT count(*) FROM tasks WHERE liste = $liste[0] AND status = 1");
      $cou = mysql_fetch_row($sql2);
      // if this is the last task in its list, close the list too.
      if ($cou[0] == 0)
      {
      $tasklist = new tasklist();
      $tasklist->close_liste($liste[0]);
      }
     */

    if ($upd) {
      $nameproject = $this->getNameProject($id);
      $this->mylog->add($nameproject[0], 'task', 5, $nameproject[1]);
      return true;
    } else {
      return false;
    }
  }


  function addDistribution($task,$userId){
    $task = (int) $task;
    $userId = (int) $userId;
    $sql = "
            INSERT INTO `task_distribution`
            (
            `task_id`,
            `user_id`)
            VALUES
            (
            $task,
            $userId
            )";

    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }

  /**
   * Assign a task to a user
   *
   * @param int $task Task ID
   * @param int $id User ID
   * @return bool
   */
  function assign($task, $id) {
    $task = (int) $task;
    $id = (int) $id;

    $upd = mysql_query("INSERT INTO tasks_assigned (user,task) VALUES ($id,$task)");
    if ($upd) {
      return true;
    } else {
      return false;
    }
  }

  /**
   * Delete the assignment of a task to a user
   *
   * @param int $task Task ID
   * @param int $id User ID
   * @return bool
   */
  function deassign($task, $id) {
    $task = (int) $task;
    $id = (int) $id;

    $upd = mysql_query("DELETE FROM tasks_assigned WHERE user = $id AND task = $task");
    if ($upd) {
      return true;
    } else {
      return false;
    }
  }

  /**
   * Return a task
   *
   * @param int $id Task ID
   * @return array $task Task details
   */
  function getTask($id) {
    $id = (int) $id;

    $sel = mysql_query("SELECT * FROM tasks WHERE ID = $id");
    $task = mysql_fetch_array($sel, MYSQL_ASSOC);
    if (!empty($task)) {
      // format datestring according to dateformat option

      if (is_numeric($task['end_date'])) {
        $endstring = date(CL_DATEFORMAT, $task["end_date"]);
      } else {
        $endstring = date(CL_DATEFORMAT, strtotime($task["end_date"]));
      }
      // get list and projectname of the task
      $details = $this->getTaskDetails($task);
      $list = $details["list"];
      $pname = $details["pname"];
      // get remainig days until due date
      $tage = $this->getDaysLeft($task['end_date']);

      $usel = mysql_query("SELECT user FROM tasks_assigned WHERE task = $task[ID]");
      $users = array();
      while ($usr = mysql_fetch_row($usel)) {
        array_push($users, $usr[0]);
        $task["user"] = "All";
        $task["user_id"] = $users;
      }
      if (count($users) == 1) {
        $usrobj = new user();
        $usr = $users[0];
        $user = $usrobj->getProfile($usr);
        $task["user"] = stripslashes($user["name"]);
        $task["users"] = array($user);
        $task["user_id"] = $user["ID"];
      } elseif (count($users) > 1) {

        $usrobj = new user();
        $task["users"] = array();
        $task["user"] = "";
        $task["user_id"] = 0;
        foreach ($users as $user) {
          $usr = $usrobj->getProfile($user);
          $task["user"] .= $usr["name"] . " ";
          array_push($task["users"], $usr);
        }
      }

      $sql4 = "select user_id from task_distribution where task_id = $id";
      $query4 = mysql_query($sql4);
      $task["distribution"] = array();
      while ($ccUser = mysql_fetch_row($query4)) {
        array_push($task["distribution"],$ccUser[0]);
      }
      
      $sql2 = "select fileId from task_attachement where taskId = $id;";
      $sel2 = mysql_query($sql2);
      $attachments = array();
      while ($fId = mysql_fetch_row($sel2)) {
        $sql3 = "select * from files where id = $fId[0];";
        $sel3 = mysql_query($sql3);
        while($file = mysql_fetch_array($sel3)){
          array_push($attachments, $file);
        }
      }
      $task["endstring"] = $endstring;
      $task["attachments"] = $attachments;
      $task["title"] = stripslashes($task["title"]);
      $task["text"] = stripslashes($task["text"]);
      $task["pname"] = stripslashes($pname);
      $task["list"] = $list;
      $task["daysleft"] = $tage;
      $this->checkStatus($task);

      return $task;
    } else {
      return false;
    }
  }
  
  
  function checkStatus($tk){
    $startDate = strtotime($tk['start_date']);
    $endDate = strtotime($tk['end_date']);
    $now = strtotime(date(CL_DATEFORMAT));
    $stNotStart = Status::getId("task","not_start");
    $stInProgress = Status::getId("task","in_progress");
    $stClosed = Status::getId("task","closed");
    $stCompleted = Status::getId("task","completed");
    $st = $tk['status'];
    if($st == $stCompleted || $st ==$stClosed){
      return $tk;
    }
    if($now >= $startDate && $now <=$endDate && $st == $stNotStart){
      $this->updateStatus($tk['ID'],$stInProgress);
      $tk['status'] = $stInProgress;
      return $tk;
    }
    if($now > $endDate && $st != $stCompleted && $st !=$stClosed){
      $this->updateStatus($tk['ID'],$stInProgress);
      $tk['status'] = $stInProgress;
      $tk['delay'] =true;
    }
    return $deliverItem;
  }

  function updateStatus($id,$status){
    $sql = "update tasks set status =$status where ID=$id";
    $upd = mysql_query($sql);
    return $upd;
  }
  
  /**
   * Return all open tasks of a project
   *
   * @param int $project Project ID
   * @return array $lists Tasks
   */
  function getProjectTasks($project, $valid = 1) {
    $project = (int) $project;
    $valid = (int) $valid;

    $lists = array();
    if ($valid !== false) {
      $sel2 = mysql_query("SELECT ID FROM tasks WHERE project = $project AND valid=$valid");
    } else {
      $sel2 = mysql_query("SELECT ID FROM tasks WHERE project = $project");
    }
    while ($tasks = mysql_fetch_array($sel2, MYSQL_ASSOC)) {
      $task = $this->getTask($tasks["ID"]);
      array_push($lists, $task);
    }

    if (!empty($lists)) {
      return $lists;
    } else {
      return false;
    }
  }

  /**
   * Return all active / open tasks of a given project
   *
   * @param int $project Project ID
   * @param int $limit Number of tasks to return
   * @return array $lists Tasks
   */
  function getMyProjectTasks($project, $limit = 10, $userId = -1) {
    $project = (int) $project;
    $limit = (int) $limit;
    $user = $_SESSION['userid'];
    if ($userId != -1) {
      $user = $userId;
    }

    $lists = array();
    $now = time();

    $sel2 = mysql_query("SELECT ID FROM tasks WHERE project = $project AND status!=$st AND end_date > $now ORDER BY `end_date` ASC LIMIT $limit");

    while ($tasks = mysql_fetch_array($sel2, MYSQL_ASSOC)) {
      $chk = mysql_fetch_row(mysql_query("SELECT ID FROM tasks_assigned WHERE user = $user AND task = $tasks[ID]"));
      $chk = $chk[0];
      if ($chk) {
        $task = $this->getTask($tasks["ID"]);
        array_push($lists, $task);
      }
    }

    if (!empty($lists)) {
      return $lists;
    } else {
      return false;
    }
  }

  function getTodayTasksByUserAndProject($m, $y, $d, $project, $user, $limit = 100) {
    $project = (int) $project;
    $user = (int) $user;
    $st1 = Status::getId("task", "completed");
    $st2 = Status::getId("task", "closed");
    $dt = $y . "-" . $m . "-" . $d;
    $sql = "SELECT t.* FROM tasks t, tasks_assigned ta WHERE t.id = ta.task and ta.user=$user and t.project = $project AND t.status not in ($st1,$st2) and t.start_date<= '$dt' and t.end_date >= '$dt' ORDER BY t.end_date ASC LIMIT $limit";
    $sel = mysql_query($sql);
    $ret = array();
    while ($tk = mysql_fetch_array($sel)) {
      array_push($ret, $tk);
    }
    return $ret;
  }

  /**
   * Return open tasks from a given project a user
   *
   * @param int $project Project ID
   * @param int $limit Number of tasks to return
   * @param int $user User ID (0 means the user, to whom the session belongs)
   * @return array $lists Tasks
   */
  function getAllMyProjectTasks($project, $limit = 10, $user = 0) {
    $project = (int) $project;
    $limit = (int) $limit;
    $user = (int) $user;

    if ($user < 1) {
      $user = $_SESSION['userid'];
    }
    $lists = array();
    $now = time();
    $stNotStart = Status::getId("task", "not_start");
    $stInProgress = Status::getId("task", "in_progress");
    $sql = "SELECT tasks.*,tasks_assigned.user FROM tasks,tasks_assigned WHERE tasks.ID = tasks_assigned.task HAVING tasks_assigned.user = $user AND tasks.project = $project AND status in($stNotStart,$stInProgress) ORDER BY `end_date` ASC ";
    $sel2 = mysql_query($sql);

    while ($tasks = mysql_fetch_array($sel2, MYSQL_ASSOC)) {
      $task = $this->getTask($tasks["ID"]);
      array_push($lists, $task);
    }

    if($_SESSION['userRole'] >= 8 ){
      $st1 = Status::getId("task", "not_start");
      $st2 = Status::getId("task", "in_progress");
      $sql3 = "select ts.id from tasks ts, task_distribution td where ts.project = $project and ts.id = td.task_id and td.user_id = $user and ts.status in ($st1,$st2)";
      $sel = mysql_query($sql3);
      while($row = mysql_fetch_array($sel)){
        $task = $this->getTask($row['id']);
        $task['editable'] = 'false';
        array_push($lists, $task);
      }
    }

    if (!empty($lists)) {
      return $lists;
    } else {
      return false;
    }
  }

  function getTasksByDeliverableId($id) {
    $id = (int) $id;
    $sql = "select * from tasks where deliverable_item = $id";
    $sel = mysql_query($sql);
    $ret = array();
    $st1 = Status::getId("task", "completed");
    $st2 = Status::getId("task", "closed");
    $st3 = Status::getId("task", "not_start");
    while ($row = mysql_fetch_array($sel)) {
      $sd = strtotime($row['start_date']);
      $ed = strtotime($row['end_date']);
      $totalDays = round(($ed - $sd) / 3600 / 24);
      $now = time();
      $tpc = 100;
      if ($now < $sd) {
        $tpc = 0;
      }
      if ($now < $ed && $now > $sd) {
        $done = round(($now - $sd) / 3600 / 24);
        $tpc = floor(($done / $totalDays) * 100);
      }
      if ($now > $ed && ($row['status'] == $st1 || $row['status'] == $st2)) {
        $tpc = 99;
      }
      if ($row['status'] == $st3) {
        $tpc = 0;
      }
      $row["percentcompleted"] = $tpc;
      array_push($ret, $row);
    }
    return $ret;
  }

  /**
   * Returns all late tasks of a user from a given project
   *
   * @param int $project Project ID
   * @param int $limit Number of tasks to return
   * @return array $lists Tasks
   */
  function getMyLateProjectTasks($project, $limit = 10) {
    $project = (int) $project;
    $limit = (int) $limit;

    $user = $_SESSION["userid"];
    $lists = array();
    $tod = date("d.m.Y");
    $now = strtotime($tod);

    $sel2 = mysql_query("SELECT tasks.*,tasks_assigned.user FROM tasks,tasks_assigned WHERE tasks.ID = tasks_assigned.task HAVING tasks_assigned.user = $user AND tasks.project = $project  AND status=1 AND end_date < $now ORDER BY `end_date` ASC LIMIT $limit");
    while ($tasks = mysql_fetch_array($sel2, MYSQL_ASSOC)) {
      $task = $this->getTask($tasks["ID"]);
      array_push($lists, $task);
    }

    if (!empty($lists)) {
      return $lists;
    } else {
      return false;
    }
  }

  /**
   * Returns all tasks of today of a user from a given project
   *
   * @param int $project Project ID
   * @param int $limit Number of tasks to return
   * @return array $lists Tasks
   */
  function getMyTodayProjectTasks($project, $limit = 10) {
    $project = (int) $project;
    $limit = (int) $limit;

    $user = $_SESSION["userid"];
    $tod = date("d.m.Y");
    $lists = array();
    $now = strtotime($tod);

    $sel2 = mysql_query("SELECT tasks.*,tasks_assigned.user FROM tasks,tasks_assigned WHERE tasks.ID = tasks_assigned.task HAVING tasks_assigned.user = $user AND tasks.project = $project  AND status=1 AND end_date = '$now' ORDER BY `end_date` ASC LIMIT $limit");

    while ($tasks = mysql_fetch_array($sel2, MYSQL_ASSOC)) {
      $task = $this->getTask($tasks["ID"]);
      array_push($lists, $task);
    }

    if (!empty($lists)) {
      return $lists;
    } else {
      return false;
    }
  }

  /**
   * Return all done tasks of a user from a given project
   *
   * @param int $project Project ID
   * @param int $limit Number of tasks to return
   * @return array $lists Tasks
   */
  function getMyDoneProjectTasks($project, $limit = 5) {
    $project = (int) $project;
    $limit = (int) $limit;

    $user = $_SESSION["userid"];
    $lists = array();
    $now = time();

    $sel2 = mysql_query("SELECT tasks.*,tasks_assigned.user FROM tasks,tasks_assigned WHERE tasks.ID = tasks_assigned.task HAVING tasks_assigned.user = $user AND tasks.project = $project AND status=0 ORDER BY `end_date` ASC LIMIT $limit");

    while ($tasks = mysql_fetch_array($sel2, MYSQL_ASSOC)) {
      $task = $this->getTask($tasks["ID"]);
      array_push($lists, $task);
    }

    if (!empty($lists)) {
      return $lists;
    } else {
      return false;
    }
  }

  /**
   * Return all tasks (from a project) due on the specified date
   *
   * @param int $m Month
   * @param int $y Year
   * @param int $d Day
   * @param int $project Project ID (Default: 0 = all projects)
   * @return array $timeline Tasks
   */
  function getTodayTasks($m, $y, $d, $project = 0, $userId = -1) {
    $m = (int) $m;
    $y = (int) $y;

    if ($m > 9) {
      $startdate = date($d . "." . $m . "." . $y);
    } else {
      $startdate = date($d . ".0" . $m . "." . $y);
    }
    $starttime = strtotime($startdate);

    $user = (int) $_SESSION["userid"];
    if ($userId != -1) {
      $user = $userId;
    }
    $timeline = array();

    if ($project > 0) {
      $sql = "SELECT * FROM tasks  WHERE status=1 AND project = $project AND end_date = '$starttime'";
    } else {
      $sql = "SELECT tasks.*,tasks_assigned.user,projekte.name AS pname FROM tasks,tasks_assigned,projekte WHERE tasks.ID = tasks_assigned.task AND tasks.project = projekte.ID HAVING tasks_assigned.user = $user AND status=1 AND end_date = '$starttime'";
    }
    $sel1 = mysql_query($sql);

    while ($stone = mysql_fetch_array($sel1, MYSQL_ASSOC)) {
      $stone["daysleft"] = $this->getDaysLeft($stone["end_date"]);
      array_push($timeline, $stone);
    }

    if (!empty($timeline)) {
      return $timeline;
    } else {
      return array();
    }
  }

  function getTaskCCList($taskId){
    $arrCC = array();
    $sql = "select u.email as email from user u,task_distribution td where td.user_id = u.ID and td.task_id = $taskId";
    $query = mysql_query($sql);
    while ($cc = mysql_fetch_array($query)) {
      array_push($arrCC,$cc[0]);
    }
    return $arrCC;

  }

  /**
   * Return the owner of a given task
   *
   * @param int $id Task ID
   * @return array $user ID of the user who has to complete the task
   */
  function getUser($id) {
    $id = (int) $id;

    $sql = mysql_query("SELECT user FROM tasks_assigned WHERE task = $id");
    $user = mysql_fetch_row($sql);

    if (!empty($user)) {
      $sel2 = mysql_query("SELECT name FROM user WHERE ID = $user[0]");
      $uname = mysql_fetch_row($sel2);
      $uname = $uname[0];
      $user[1] = stripslashes($uname);

      return $user;
    } else {
      return false;
    }
  }

  /**
   * Return the owner of a given task
   *
   * @param int $id Task ID
   * @return array $user ID of the users who has to complete the task
   */
  function getUsers($id) {
    $id = (int) $id;

    $sql = mysql_query("SELECT user FROM tasks_assigned WHERE task = $id");
    if (mysql_num_rows($sql) > 0) {
      $result = array();
      while ($user = mysql_fetch_row($sql)) {


        $sel2 = mysql_query("SELECT name FROM user WHERE ID = $user[0]");
        $uname = mysql_fetch_row($sel2);
        $uname = $uname[0];
        $user[1] = stripslashes($uname);

        $result[] = $user;
      }
      return $result;
    } else {
      return false;
    }
  }


  /**
   * Export all tasks of a user via iCal
   *
   * @param int $user User ID
   * @return bool
   */
  function getIcal($user) {
    $user = (int) $user;

    $username = $_SESSION["username"];
    $project = new project();
    $myprojects = $project->getMyProjects($user);
    $tasks = array();
    if (!empty($myprojects)) {
      foreach ($myprojects as $proj) {
        $task = $this->getAllMyProjectTasks($proj["ID"], 10000);

        if (!empty($task)) {
          array_push($tasks, $task);
        }
      }
    }

    $etasks = reduceArray($tasks);
    require("class.ical.php");
    $heute = date("d-m-y");

    $cal = new vcalendar();
    $fname = "tasks_" . $username . ".ics";
    $cal->setConfig('directory', CL_ROOT . '/files/' . CL_CONFIG . '/ics');
    $cal->setConfig('filename', $fname);
    $cal->setConfig('unique_id', '');
    $cal->setProperty('X-WR-CALNAME', "Collabtive Aufgaben für " . $username);
    $cal->setProperty('X-WR-CALDESC', '');
    $cal->setProperty('CALSCALE', 'GREGORIAN');
    $cal->setProperty('METHOD', 'PUBLISH');
    foreach ($etasks as $etask) {
      // split date in Y / M / D / h / min / sek variables
      $jahr = date("Y", $etask["start"]);
      $monat = date("m", $etask["start"]);
      $tag = date("d", $etask["start"]);
      $std = date("h", $etask["start"]);
      $min = date("i", $etask["start"]);
      $sek = date("s", $etask["start"]);
      // split date in Y / M / D / h / min / sek variables
      $ejahr = date("Y", $etask['end_date']);
      $emonat = date("m", $etask['end_date']);
      $etag = date("d", $etask['end_date']);
      $estd = date("h", $etask['end_date']);
      $emin = date("i", $etask['end_date']);
      $esek = date("s", $etask['end_date']);

      $e = new vevent();
      $e->setProperty('categories', $etask['list']);
      $e->setProperty('dtstart', $jahr, $monat, $tag, $std, $min); // 24 dec 2007 19.30
      $e->setProperty('due', $ejahr, $emonat, $etag, $estd, $emin); // 24 dec 2007 19.30
      $e->setProperty('dtend', $ejahr, $emonat, $etag, $estd, $emin);
      $e->setProperty('description', $etask["text"]);
      $e->setProperty('status', "NEEDS-ACTION");
      // $e->setProperty('comment' , $etask[text]);
      $e->setProperty('summary', $etask["title"]);

      $e->setProperty('location', 'Work');
      $cal->setComponent($e);
    }
    $cal->returnCalendar();

    return true;
  }

  /**
   * Return a tasks project name and tasklist name
   *
   * @param array $task Task ID
   * @return array $details Name of associated project and tasklist
   */
  private function getTaskDetails(array $task) {
    $psel = mysql_query("SELECT name FROM projekte WHERE ID = $task[project]");
    $pname = mysql_fetch_row($psel);
    $pname = stripslashes($pname[0]);

    $list = mysql_query("SELECT name FROM tasklist WHERE ID = $task[liste]");
    $list = mysql_fetch_row($list);
    $list = stripslashes($list[0]);

    if (isset($list) or isset($pname)) {
      $details = array("list" => $list, "pname" => $pname);
    }

    if (!empty($details)) {
      return $details;
    } else {
      return false;
    }
  }

  /**
   * Return the number of left days until a task is due
   *
   * @param string $end Timestamp of the date the task is due
   * @return int $days Days left
   */
  private function getDaysLeft($end) {
    $tod = date("Y-m-d");
    $now = strtotime($tod);
    $endDate = strtotime($end);
    $diff = $endDate - $now;
    $days = floor($diff / 86400);
    return $days;
  }

  function getTasksByProjectId($pId){
    $pId = (int) $pId;
    $st1 = Status::getId("task", "closed");
    $st2 = Status::getId("task", "completed");
    $sql = "select * from tasks where project = $pId and status not in($st1,$st2) ";
    $sel = mysql_query($sql);
    $ret = array();
    while($task = mysql_fetch_array($sel)){
      array_push($ret,$task);
    }
    return $ret;
  }

  /**
   * Return the name of the associated project and text of a given task
   *
   * @param int $id Task ID
   * @return array $nameproject Name and project
   */
  private function getNameProject($id) {
    $id = (int) $id;

    $nam = mysql_query("SELECT text,liste,title FROM tasks WHERE ID = $id");
    $nam = mysql_fetch_row($nam);
    $text = stripslashes($nam[2]);
    $list = $nam[1];
    $sel2 = mysql_query("SELECT project FROM tasklist WHERE ID = $list");
    $project = mysql_fetch_row($sel2);
    $project = $project[0];
    $nameproject = array($text, $project);

    if (!empty($nameproject)) {
      return $nameproject;
    } else {
      return false;
    }
  }

}

?>
