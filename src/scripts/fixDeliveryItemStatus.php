<?php
/**
 * Created by PhpStorm.
 * User: handle
 * Date: 1/27/14
 * Time: 3:49 PM
 */

require("../init.php");
$task = new task();
$delivery = new DeliverableItem();
$jUtils = new JUtils();
$stClosed = Status::getId("deliverable","closed");

$sql1 = "select * from `deliverable_item` where `status`!= $stClosed";
$allDeliveryItems = $jUtils->Query($sql1);
$html = "";
$cont = 0;
foreach ($allDeliveryItems as $item) {
  if($jUtils->updateDeliverItemStatus($item["ID"])){
    $count++;
    $html.=$item["name"];
    $html.="<br/>";
  }
}
echo $html;
echo "<h2>total count: $count</h2>";