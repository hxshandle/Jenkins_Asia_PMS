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
$html2 = "";
$count = 0;
$count2 = 0;
foreach ($allDeliveryItems as $item) {
  if($jUtils->updateDeliverItemStatus($item["ID"])){
    $count++;
    $html.=$item["ID"]." : ".$item["name"];
    $html.="<br/>";
  }else{
    $count2++;
    $html2.="<span style='color:gray'>";
    $html2.=$item["ID"]." : ".$item["name"];
    $html2.="</span>";
    $html2.="<br/>";
  }
}

echo "<h2>total count: $count</h2>";
echo $html;
echo "<hr/>";
echo "<h2>total invalid: $count2</h2>";
echo $html2;