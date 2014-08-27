<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 14-7-29
 * Time: 下午10:49
 */
require("../init.php");
$jUtils = new JUtils();
$tasklist = new tasklist();

$sql = "select * from tasks where liste = 1 and project !=1";
$list = $jUtils->Query($sql);
foreach ($list as $item) {
  $taskListId = $tasklist->getTasklistIdByProjectId($item["project"]);
  $taskListId = (int) $taskListId;
  $taskId = $item["ID"];
  $upSql = "update tasks set liste=$taskListId where ID = $taskId";
  echo $upSql;
  echo "<br/>";
  mysql_query($upSql);
}

