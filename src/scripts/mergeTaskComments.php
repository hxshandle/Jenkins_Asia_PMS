<?php
/**
 * Created by PhpStorm.
 * User: I073349
 * Date: 9/3/14
 * Time: 6:12 PM
 */




require("../init.php");
$jUtils = new JUtils();
$comments = new Comments();

$sql = "select * from tasks where 1=1";
$ret = $jUtils->Query($sql);
$regex1 = '/--\w*\s\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}/';

function insertDB($taskId,$comentContent,$userName,$ts){
  global $comments;
  //echo "insert db [ ".$comentContent." ] ".$userName.":".$ts."<br/>";
  $comments->mergeComments($comentContent,0,$userName,$ts,$taskId);
}

function getUserInfo($userStr){
  $nameReg = '/[a-z|A-Z]+[_]?[a-z|A-Z]+/';
  $tsReg = '/\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}/';
  preg_match($nameReg,$userStr,$nameMatches);
  preg_match($tsReg,$userStr,$tsMatchs);
//  echo "----------getUserInfo--------";
//  var_dump($nameMatches);
//  var_dump($tsMatchs);
  return [$nameMatches[0],$tsMatchs[0]];
}


function splitComment($comments,$taskId){
  $regex1 = '/--\w*\s\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}/';
  $commentUserList = array();
  $commentArr = preg_split($regex1,$comments);
  var_dump($commentArr);
  if(preg_match_all($regex1, $comments, $commentUserList)){
    var_dump($commentUserList);
    foreach ($commentUserList[0] as $idx => $userInfo) {
      $commentInfo = getUserInfo($userInfo);
      $comentContent = $commentArr[$idx];
      $cmt = preg_replace("/<\/br>|<br[\s]?\/>/","",$comentContent);
      //echo $cmt."\n ".$commentInfo[0]." : ".$commentInfo[1]."<br/>";
      insertDB($taskId,$cmt,$commentInfo[0],$commentInfo[1]);
    }
    $count1 = count($commentArr);
    $count2 = count($commentUserList);
    if($count1 > $count2 && strlen($commentArr[$count1-1]) > 0){
      $dateFormat = CL_DATEFORMAT . " H:i:s";
      $today = date($dateFormat);
      $cmt = preg_replace("/<\/br>|<br[\s]?\/>|--/","",$commentArr[$count1-1]);
      insertDB($taskId,$cmt,"System",$today);
    }

  }else{
    $dateFormat = CL_DATEFORMAT . " H:i:s";
    $today = date($dateFormat);
    insertDB($taskId,$comments,"System",$today);
  }
}

//$regex1 = '/br/';
foreach ($ret as $task) {
  echo "processing task-> ".$task["project"].$task['ID'].": ".$task["title"];
  $oldComents = $task["status_update"];
  $taskId = $task["ID"];
  var_dump($oldComents);
  if(strlen($oldComents)>0){
    splitComment($oldComents,$taskId);
  }else{
    echo "escape...";
  }
  echo "<hr/>";
}

