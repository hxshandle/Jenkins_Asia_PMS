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
    echo "<ul><li>abc</li><li>efg</li><li>hh</li></ul>";
    break;
  default:
    break;
}
?>
