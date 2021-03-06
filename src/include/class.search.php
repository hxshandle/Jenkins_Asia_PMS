<?php
/**
 * This class provides methods for searching content
 *
 * @author Open Dynamics <info@o-dyn.de>
 * @name search
 * @version 0.4.6
 * @package Collabtive
 * @link http://www.o-dyn.de
 * @license http://opensource.org/licenses/gpl-license.php GNU General Public License v3 or later
 */
class search
{
    function __construct()
    {
    }

    function dosearch($query, $project = 0)
    {
        if (empty($query))
        {
            return false;
        }
        if ($project == 0)
        {
            $projects = $this->searchProjects($query);
            //$milestones = $this->searchMilestones($query);
            if ($_SESSION["adminstate"] > 0)
            {
                $messages = $this->searchMessage($query);
            }
            else
            {
                $messages = array();
            }
            $tasks = $this->searchTasks($query);
            // Commit for permission
            $files = $this->searchFiles($query);
            $user = $this->searchUser($query);

            $result = array_merge($projects, $tasks, $messages , $files, $user);
            //$result = array_merge($projects, $tasks, $messages , $user);
        }
        else
        {
            $milestones = $this->searchMilestones($query, $project);
            if ($_SESSION["adminstate"] > 0)
            {
                $messages = $this->searchMessage($query,$project);
            }
            else
            {
                $messages = array();
            }
            $tasks = $this->searchTasks($query, $project);
            $files = $this->searchFiles($query, $project);
            $user = $this->searchUser($query, $project);

            $result = array_merge($milestones, $tasks, $messages , $files, $user);
        }

        if (!empty($result))
        {
            return $result;
        }
        else
        {
            return false;
        }
    }

    function searchProjects($query)
    {
        $query = mysql_real_escape_string($query);

        $sel = mysql_query("SELECT `ID`,`name`,`desc`,`status` FROM projekte WHERE `name` LIKE '%$query%' OR `desc` LIKE '%$query%' OR ID = '$query' and valid=1");

        $projects = array();
        while ($result = mysql_fetch_array($sel))
        {
            if (!empty($result))
            {
                $result["type"] = "project";
                $result["icon"] = "projects.png";
                $result["name"] = stripslashes($result["name"]);
                $result["desc"] = stripslashes($result["desc"]);
                $result["url"] = "manageproject.php?action=showproject&amp;id=$result[ID]";
                array_push($projects, $result);
            }
        }

        if (!empty($projects))
        {
            return $projects;
        }
        else
        {
            return array();
        }
    }

    function searchMilestones($query, $project = 0)
    {
        $query = mysql_real_escape_string($query);
        $project = (int) $project;

        if ($project > 0)
        {
            $sel = mysql_query("SELECT `ID`,`name`,`desc`,`status`,`project` FROM milestones WHERE `name` LIKE '%$query%' OR `desc` LIKE '%$query%' HAVING project = $project AND valid=1 ");
        }
        else
        {
            $sel = mysql_query("SELECT `ID`,`name`,`desc`,`status`,`project` FROM milestones WHERE `name` LIKE '%$query%' OR `desc` LIKE '%$query%' HAVING valid=1");
        }

        $milestones = array();
        while ($result = mysql_fetch_array($sel))
        {
            if (!empty($result))
            {
                $project = mysql_query("SELECT name FROM projekte WHERE ID = $result[project]");
                $project = mysql_fetch_row($project);
                $project = $project[0];

                $result["pname"] = $project;
                $result["type"] = "milestone";
                $result["icon"] = "miles.png";
                $result["name"] = stripslashes($result["name"]);
                $result["desc"] = stripslashes($result["desc"]);
                $result["url"] = "managemilestone.php?action=showmilestone&amp;msid=$result[ID]&id=$result[project]";
                array_push($milestones, $result);
            }
        }

        if (!empty($milestones))
        {
            return $milestones;
        }
        else
        {
            return array();
        }
    }

    function searchMessage($query, $project = 0)
    {
        $query = mysql_real_escape_string($query);
        $project = (int) $project;

        if ($project > 0)
        {
            $sel = mysql_query("SELECT `ID`,`title`,`text`,`posted`,`user`,`username`,`project` FROM messages WHERE `title` LIKE '%$query%' OR `text` LIKE '%$query%' HAVING project = $project ");
        }
        else
        {
            $sel = mysql_query("SELECT `ID`,`title`,`text`,`posted`,`user`,`username`,`project` FROM messages WHERE `title` LIKE '%$query%' OR `text` LIKE '%$query%'");
        }

        $messages = array();
        while ($result = mysql_fetch_array($sel))
        {
            if (!empty($result))
            {
                $project = mysql_query("SELECT name FROM projekte WHERE ID = $result[project]");
                $project = mysql_fetch_row($project);
                $project = $project[0];

                $result["pname"] = $project;
                $result["type"] = "message";
                $result["icon"] = "msgs.png";
                $result["title"] = stripslashes($result["title"]);
                $result["text"] = stripslashes($result["text"]);
                $result["username"] = stripslashes($result["username"]);
                $posted = date("d.m.y - H:i", $result["posted"]);
                $result["endstring"] = $posted;
                $result["url"] = "managemessage.php?action=showmessage&amp;mid=$result[ID]&id=$result[project]";
                array_push($messages, $result);
            }
        }

        if (!empty($messages))
        {
            return $messages;
        }
        else
        {
            return array();
        }
    }

    function hasTaskPermission($task)
    {
      $user = $_SESSION['userid'];
      $roleType = $_SESSION['userRole'];
      $ret = false;

      $sql1 = "select * from `tasks_assigned` where `task` = $task and `user` = $user";
      $sel1 = mysql_query($sql1);
      while($result = mysql_fetch_array($sel1)){
        if(!empty($result)){
          $ret = true;
        }
      }

      return $ret;
    }

    function searchTasks($query, $project = 0)
    {
        $query = mysql_real_escape_string($query);
        $project = (int) $project;
        $st1 = Status::getId("task","completed");
        $st2 = Status::getId("task","closed");

        if ($project > 0)
        {
            $sel = mysql_query("SELECT `ID`,`title`,`text`,`status`,`project` FROM tasks WHERE `title` LIKE '%$query%' OR `text` LIKE '%$query%' HAVING project = $project AND status not in ($st1,$st2)");
        }
        else
        {
            $sel = mysql_query("SELECT `ID`,`title`,`text`,`status`,`project` FROM tasks WHERE `title` LIKE '%$query%' OR `text` LIKE '%$query%' and status not in ($st1,$st2)");
        }

        $tasks = array();
        while ($result = mysql_fetch_array($sel))
        {
            if (!empty($result))
            {
                $project = mysql_query("SELECT name FROM projekte WHERE ID = $result[project]");
                $project = mysql_fetch_row($project);
                $project = $project[0];

                $result["pname"] = $project;
                $result["type"] = "task";
                $result["icon"] = "task.png";
                $result["title"] = stripslashes($result["title"]);
                $result["text"] = stripslashes($result["text"]);
                $result["url"] = "managetask.php?action=showtask&amp;tid=$result[ID]&id=$result[project]";
                if($this->hasTaskPermission($result["ID"])){
                  array_push($tasks, $result);
                }

            }
        }

        if (!empty($tasks))
        {
            return $tasks;
        }
        else
        {
            return array();
        }
    }



    function hasFilePermission($file){
      $user = $_SESSION['userid'];
      $roleType = $_SESSION['userRole'];
      if($roleType < 3){
        return true;
      }
      if($roleType > 5){
        return false;
      }

      $sql = "select projekt as projectId from `projekte_assigned` where user = $user";
      $sel= mysql_query($sql);
      $userProjects = mysql_fetch_array($sel);
      if( in_array($file['project'],$userProjects) && strpos($roleType,$file["visibility"])){
        return true;
      }
      return false;
    }

    function searchFiles($query, $project = 0)
    {
        $query = mysql_real_escape_string($query);
        $project = (int) $project;

        if ($project > 0)
        {
            $sel = mysql_query("SELECT `ID`,`name`,`document_no`,`project`,`visibility` FROM `document_info` WHERE `name` LIKE '%$query%' OR `document_no` LIKE '%$query%'  HAVING project = $project");
        }
        else
        {
            $sel = mysql_query("SELECT `ID`,`name`,`document_no`,`project`,`visibility` FROM `document_info` WHERE `name` LIKE '%$query%' OR `document_no` LIKE '%$query%'");
        }

        $files = array();
        $doc = new Document();
        while ($result = mysql_fetch_array($sel))
        {
            if (!empty($result))
            {
                $project = mysql_query("SELECT name FROM projekte WHERE ID = $result[project]");
                $project = mysql_fetch_row($project);
                $project = $project[0];

                $result["pname"] = $project;
                $result["ftype"] = str_replace("/", "-", $result["type"]);
                $set = new settings();
                $settings = $set->getSettings();
                $myfile = CL_ROOT . "/templates/" . $settings["template"] . "/images/symbols/files.png";
                if (stristr($result["type"], "image"))
                {
                    $result["imgfile"] = 1;
                } elseif (stristr($result['type'], "text"))
                {
                    $result["imgfile"] = 2;
                }
                else
                {
                    $result["imgfile"] = 0;
                }

                if (!file_exists($myfile))
                {
                    $result["ftype"] = "none";
                }
                $result["name"] = stripslashes($result["name"]);
                $result["desc"] = stripslashes($result["document_no"]);
                $docInfo = $doc->getDocumentInfo($result["ID"]);
                $result["download_url"] = $docInfo["download_url"];
                // $result["tags"] = stripslashes($result["tags"]);
                $result["type"] = "file";
                $result[3] = "file";
                $result["icon"] = "files.png";
                if($this->hasFilePermission($result)){
                  array_push($files, $result);
                }
            }
        }

        if (!empty($files))
        {
            return $files;
        }
        else
        {
            return array();
        }
    }

    function searchUser($query)
    {
        $query = mysql_real_escape_string($query);

        $sel = mysql_query("SELECT `ID`,`email`,`name`,`avatar`,`lastlogin` FROM user WHERE name LIKE '%$query%'");

        $user = array();
        while ($result = mysql_fetch_array($sel))
        {
            if (!empty($result))
            {
                $result["type"] = "user";
                $result["name"] = stripslashes($result["name"]);
                $result["url"] = "manageuser.php?action=profile&amp;id=$result[ID]";
                $result["type"] = "user";
                $result[3] = "user";
                $result["icon"] = "user.png";
                array_push($user, $result);
            }
        }

        if (!empty($user))
        {
            return $user;
        }
        else
        {
            return array();
        }
    }

    function limitResult(array $result, $userid)
    {
        $finresult = array();
        $userid = (int) $userid;
        foreach($result as $res)
        {
            if ($res["type"] != "project" and $res["type"] != "user")
            {
                if (chkproject($userid, $res["project"]))
                {
                    array_push($finresult, $res);
                }
            }
            else
            {
                if (chkproject($userid, $res["ID"]))
                {
                    array_push($finresult, $res);
                }
            }
        }
        return $finresult;
    }
}

?>