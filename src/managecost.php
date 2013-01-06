<?php
require("init.php");
$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}
$jUtils = new JUtils();
$template->assign("currency", Currency::$Currencys);

switch($action){
$cost = new Costing();
case "getProjectCost":
  $proejctId = getArrayVal($_GET, "projectId");
  $costs = $cost->getCostingByProjectId($projectId);
  $template->assign("costs", $costs);
  $template->display("costable.tpl");
  break;
case "updateCost":
  $costId = getArrayVal($_POST, "costId");
  $projectId = getArrayVal($_POST, "projectId");
  $project_no = getArrayVal($_POST, "project_no");
  $customer_model_number = getArrayVal($_POST, "customer_model_number");
  $jenkins_model_number = getArrayVal($_POST, "jenkins_model_number");
  $customer_assembly_number = getArrayVal($_POST, "customer_assembly_number");
  $customer_parent_assembly_number = getArrayVal($_POST, "customer_parent_assembly_number");
  $jenkins_assembly_number = getArrayVal($_POST, "jenkins_assembly_number");
  $jenkins_parent_assembly_number = getArrayVal($_POST, "jenkins_parent_assembly_number");
  $customer_part_number = getArrayVal($_POST, "customer_part_number");
  $jenkins_part_number = getArrayVal($_POST, "jenkins_part_number");
  $customer_drawing_number = getArrayVal($_POST, "customer_drawing_number");
  $revision1 = getArrayVal($_POST, "revision1");
  $jenkins_drawing_number = getArrayVal($_POST, "jenkins_drawing_number");
  $revision2 = getArrayVal($_POST, "revision2");
  $internal_budgetary_price = getArrayVal($_POST, "internal_budgetary_price");
  $external_budgetary_price = getArrayVal($_POST, "external_budgetary_price");
  $internal_alpha_price = getArrayVal($_POST, "internal_alpha_price");
  $external_alpha_price = getArrayVal($_POST, "external_alpha_price");
  $internal_beta_price = getArrayVal($_POST, "internal_beta_price");
  $external_beta_price = getArrayVal($_POST, "external_beta_price");
  $internal_final_price = getArrayVal($_POST, "internal_final_price");
  $quantity_per_product = getArrayVal($_POST, "quantity_per_product");
  $currency = getArrayVal($_POST, "currency");
  $isNew = getArrayVal($_POST, "isNew");
  if($isNew == '1'){
    $ret = $cost->add($projectId,$project_no,$customer_model_number,$jenkins_model_number,$customer_assembly_number,$customer_parent_assembly_number,$jenkins_assembly_number,$jenkins_parent_assembly_number,$customer_part_number,$jenkins_part_number,$customer_drawing_number,$revision1,$jenkins_drawing_number,$revision2,$internal_budgetary_price,$external_budgetary_price,$internal_alpha_price,$external_alpha_price,$internal_beta_price,$external_beta_price,$internal_final_price,$quantity_per_product,$currency);
  }else{
    $ret = $cost->update($id,$projectId,$project_no,$customer_model_number,$jenkins_model_number,$customer_assembly_number,$customer_parent_assembly_number,$jenkins_assembly_number,$jenkins_parent_assembly_number,$customer_part_number,$jenkins_part_number,$customer_drawing_number,$revision1,$jenkins_drawing_number,$revision2,$internal_budgetary_price,$external_budgetary_price,$internal_alpha_price,$external_alpha_price,$internal_beta_price,$external_beta_price,$internal_final_price,$quantity_per_product,$currency);
  }
  break;
}
?>
