<?php
require("init.php");
$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}
$jUtils = new JUtils();
$instance = new Cost();
$projectInstance = new project();

$projectId = getArrayVal($_POST,"projectId");
if(!$projectId){
  $projectId = getArrayVal($_GET,"projectId");
}
if($projectId){
  $template->assign("projectId",$projectId);
}

$template->assign("currency", Currency::$Currencys);

switch($action){
  case "editform":
    $id = getArrayVal($_GET,"id");
    if($id){
      $entry = $instance->get($id);
      $template->assign("cost",$entry);
    }else{
      $entry = array();
      $project = $projectInstance->getProject($projectId);
      $entry['project'] = $projectId;
      $entry['project_no'] =$project['project_no'];
      $template->assign("cost",$entry);
    }
    $template->display("editcostform.tpl");
    break;
  case "update":
    $costId = getArrayVal($_POST, "costId");
    
      $project = getArrayVal($_POST, "project");
    
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
    
    if(!$costId){
      $ret = $instance->add($project,$project_no,$customer_model_number,$jenkins_model_number,$customer_assembly_number,$customer_parent_assembly_number,$jenkins_assembly_number,$jenkins_parent_assembly_number,$customer_part_number,$jenkins_part_number,$customer_drawing_number,$revision1,$jenkins_drawing_number,$revision2,$internal_budgetary_price,$external_budgetary_price,$internal_alpha_price,$external_alpha_price,$internal_beta_price,$external_beta_price,$internal_final_price,$quantity_per_product,$currency);
      $costId = $ret;
    }else{
      $ret = $instance->update($costId,$project,$project_no,$customer_model_number,$jenkins_model_number,$customer_assembly_number,$customer_parent_assembly_number,$jenkins_assembly_number,$jenkins_parent_assembly_number,$customer_part_number,$jenkins_part_number,$customer_drawing_number,$revision1,$jenkins_drawing_number,$revision2,$internal_budgetary_price,$external_budgetary_price,$internal_alpha_price,$external_alpha_price,$internal_beta_price,$external_beta_price,$internal_final_price,$quantity_per_product,$currency);
    }
    Header("Location: managecost.php?action=show&id=".$costId);
    break;
  case "getList":
    $id = getArrayVal($_GET,"id");
    $list = $instance->get($id);
    $template->assign("costlist",$list);
    $template->display("costtable.tpl");
    break;
  case "del":
    $id = getArrayVal($_GET,"id");
    $ret = $instance->del($id);
    echo $ret;
    break;
  case "show":
    $id = getArrayVal($_GET,"id");
    $entry = $instance->get($id);
    $template->assign("cost",$entry);
    $internalpricebreakdown = new Internalpricebreakdown();
    $internalEntry = $internalpricebreakdown->getInternalpricebreakdownByCostId($id);
    $template->assign("internalpricebreakdownlist",$internalEntry);
    $template->display("costview.tpl");
}

?>