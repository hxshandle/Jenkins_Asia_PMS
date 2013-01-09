<?php
class ExternalPriceBreakdown(){
  function __construct(){
  }
  function get($id){
    $id = (int) $id;
    $sql ="select * from external_price_breakdown where ID = $id";
    $sel = mysql_query($sql);
    $arr = array();
    while($row = mysql_fetch_array($sel)){
      array_push($arr,$row);
    }
    return $arr;
  }
  function getInteralPriceByCostingId($id){
    $id = (int) $id;
    $sql = "select * from external_price_breakdown where cost=$id";
    $sel = mysql_query($sql);
    $arr = array();
    while($row = mysql_fetch_array($sel)){
      array_push($arr,$row);
    }
    return $arr;
  }
  function add(){
    $sql = "";
    $ins = mysql_query($sql);
    if($ins){
      return mysql_insert_id();
    }else{
      return false;
    }
  }
  function update(){
    $sql = "";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }
  function del(){
    $id = (int) $id;
    $sql = "delete from external_price_breakdown where ID = $id";
    $del = mysql_query($sql);
    if($del){
      return true;
    }else{
      return false;
    }
  }
}
?>
