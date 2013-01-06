<?php
class Costing {
  private $myLog;
  function __construct(){
    $this->myLog = new mylog;
  }


  function get($id){
    $sql ="";
    $sel = mysql_query($sql);
    $arr = array();
    while($row = mysql_fetch_array($sel)){
      array_push($arr,$row);
    }
    return $arr;
  }
  function getCostingByProjectId($id){
    $id = (int) $id;
    $sql = "";
    $sel = mysql_query($sql);
    $arr = array();
    while($row = mysql_fetch_array($sel)){
      array_push($arr,$row);
    }
    return $arr;
  }
  function add($projectId,$project_no,$customer_model_number,$jenkins_model_number,$customer_assembly_number,$customer_parent_assembly_number,$jenkins_assembly_number,$jenkins_parent_assembly_number,$customer_part_number,$jenkins_part_number,$customer_drawing_number,$revision1,$jenkins_drawing_number,$revision2,$internal_budgetary_price,$external_budgetary_price,$internal_alpha_price,$external_alpha_price,$internal_beta_price,$external_beta_price,$internal_final_price,$quantity_per_product,$currency);
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
  function del($id){
    $id = (int) $id;
    $sql = "delete from `cost` where ID = $id";
    $del = mysql_query($sql);
    if($del){
      return true;
    }else{
      return false;
    }
  }
}
?>
