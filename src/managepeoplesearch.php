<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
require("init.php");

$action = getArrayVal($_POST, "action");
if(!$action){
  $action = getArrayVal($_GET, "action");
}

switch ($action){
  case "findUser":
    $query = getArrayVal($_POST, "query");
    $user = new user();
    $ret = $user->searchUser($query);
    echo "<ul>";
    foreach ($ret as $item) {
      echo '<li id="'.$item["ID"].'">'.$item["name"].'</li>';
    }
    echo "</ul>";
    break;
  default:
    break;
}
?>
