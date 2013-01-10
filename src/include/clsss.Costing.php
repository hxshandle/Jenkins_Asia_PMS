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

  $project = (int) $project;
  $project_no = mysql_escape_string( $project_no);
  $customer_model_number = mysql_escape_string( $customer_model_number);
  $jenkins_model_number = (int) $jenkins_model_number;
  $customer_assembly_number = mysql_escape_string( $customer_assembly_number);
  $customer_parent_assembly_number = mysql_escape_string( $customer_parent_assembly_number);
  $jenkins_assembly_number = mysql_escape_string( $jenkins_assembly_number);
  $jenkins_parent_assembly_number = mysql_escape_string( $jenkins_parent_assembly_number);
  $customer_part_number = mysql_escape_string( $customer_part_number);
  $jenkins_part_number = mysql_escape_string( $jenkins_part_number);
  $customer_drawing_number = mysql_escape_string( $customer_drawing_number);
  $revision1 = mysql_escape_string( $revision1);
  $jenkins_drawing_number = (int) $jenkins_drawing_number;
  $revision2 = mysql_escape_string( $revision2);
  $internal_budgetary_price = (double) $internal_budgetary_price;
  $external_budgetary_price = (double) $external_budgetary_price;
  $internal_alpha_price = (double) $internal_alpha_price;
  $external_alpha_price = (double) $external_alpha_price;
  $internal_beta_price = (double) $internal_beta_price;
  $external_beta_price = (double) $external_beta_price;
  $internal_final_price = (double) $internal_final_price;
  $quantity_per_product = (double) $quantity_per_product;
  $currency = mysql_escape_string( $currency);
  $sql = "
    insert into `cost` (
    `project`,
    `project_no`,
    `customer_model_number`,
    `jenkins_model_number`,
    `customer_assembly_number`,
    `customer_parent_assembly_number`,
    `jenkins_assembly_number`,
    `jenkins_parent_assembly_number`,
    `customer_part_number`,
    `jenkins_part_number`,
    `customer_drawing_number`,
    `revision1`,
    `jenkins_drawing_number`,
    `revision2`,
    `internal_budgetary_price`,
    `external_budgetary_price`,
    `internal_alpha_price`,
    `external_alpha_price`,
    `internal_beta_price`,
    `external_beta_price`,
    `internal_final_price`,
    `quantity_per_product`,
    `currency`) 
    values 
    (
    $project,
    '$project_no',
    '$customer_model_number',
    $jenkins_model_number,
    '$customer_assembly_number',
    '$customer_parent_assembly_number',
    '$jenkins_assembly_number',
    '$jenkins_parent_assembly_number',
    '$customer_part_number',
    '$jenkins_part_number',
    '$customer_drawing_number',
    '$revision1',
    $jenkins_drawing_number,
    '$revision2',
    $internal_budgetary_price,
    $external_budgetary_price,
    $internal_alpha_price,
    $external_alpha_price,
    $internal_beta_price,
    $external_beta_price,
    $internal_final_price,
    $quantity_per_product,
    '$currency')
    ";
    $ins = mysql_query($sql);
    if($ins){
      return mysql_insert_id();
    }else{
      return false;
    }
  }
  function update($id,$project_no,$customer_model_number,$jenkins_model_number,$customer_assembly_number,$customer_parent_assembly_number,$jenkins_assembly_number,$jenkins_parent_assembly_number,$customer_part_number,$jenkins_part_number,$customer_drawing_number,$revision1,$jenkins_drawing_number,$revision2,$internal_budgetary_price,$external_budgetary_price,$internal_alpha_price,$external_alpha_price,$internal_beta_price,$external_beta_price,$internal_final_price,$quantity_per_product,$currency);
  $id = (int) $id;
  $project_no = mysql_escape_string( $project_no);
  $customer_model_number = mysql_escape_string( $customer_model_number);
  $jenkins_model_number = (int) $jenkins_model_number;
  $customer_assembly_number = mysql_escape_string( $customer_assembly_number);
  $customer_parent_assembly_number = mysql_escape_string( $customer_parent_assembly_number);
  $jenkins_assembly_number = mysql_escape_string( $jenkins_assembly_number);
  $jenkins_parent_assembly_number = mysql_escape_string( $jenkins_parent_assembly_number);
  $customer_part_number = mysql_escape_string( $customer_part_number);
  $jenkins_part_number = mysql_escape_string( $jenkins_part_number);
  $customer_drawing_number = mysql_escape_string( $customer_drawing_number);
  $revision1 = mysql_escape_string( $revision1);
  $jenkins_drawing_number = (int) $jenkins_drawing_number;
  $revision2 = mysql_escape_string( $revision2);
  $internal_budgetary_price = (double) $internal_budgetary_price;
  $external_budgetary_price = (double) $external_budgetary_price;
  $internal_alpha_price = (double) $internal_alpha_price;
  $external_alpha_price = (double) $external_alpha_price;
  $internal_beta_price = (double) $internal_beta_price;
  $external_beta_price = (double) $external_beta_price;
  $internal_final_price = (double) $internal_final_price;
  $quantity_per_product = (double) $quantity_per_product;
  $currency = mysql_escape_string( $currency);
  $sql = " 
    update `cost` set 
    `project`= $project,
    `project_no`= '$project_no',
    `customer_model_number`= '$customer_model_number',
    `jenkins_model_number`= $jenkins_model_number,
    `customer_assembly_number`= '$customer_assembly_number',
    `customer_parent_assembly_number`= '$customer_parent_assembly_number',
    `jenkins_assembly_number`= '$jenkins_assembly_number',
    `jenkins_parent_assembly_number`= '$jenkins_parent_assembly_number',
    `customer_part_number`= '$customer_part_number',
    `jenkins_part_number`= '$jenkins_part_number',
    `customer_drawing_number`= '$customer_drawing_number',
    `revision1`= '$revision1',
    `jenkins_drawing_number`= $jenkins_drawing_number,
    `revision2`= '$revision2',
    `internal_budgetary_price`= $internal_budgetary_price,
    `external_budgetary_price`= $external_budgetary_price,
    `internal_alpha_price`= $internal_alpha_price,
    `external_alpha_price`= $external_alpha_price,
    `internal_beta_price`= $internal_beta_price,
    `external_beta_price`= $external_beta_price,
    `internal_final_price`= $internal_final_price,
    `quantity_per_product`= $quantity_per_product,
    `currency`= '$currency',
     where ID = $id
    ";
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
