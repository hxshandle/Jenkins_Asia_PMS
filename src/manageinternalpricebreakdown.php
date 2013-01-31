<?php
require("init.php");
$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}
$jUtils = new JUtils();
$instance = new Internalpricebreakdown;

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
      $template->assign("internalpricebreakdown",$entry);
    }else{
      $entry = array();
      $cost = new Cost();
      $costId = getArrayVal($_GET,"costId");
      $costEntry = $cost->get($costId);
      $entry['cost'] = $costId;
      $entry['project_no'] =$costEntry['project_no'];
      $template->assign("internalpricebreakdown",$entry);
    }
    $template->display("editinternalpricebreakdownform.tpl");
    break;
  case "update":
    $internalpricebreakdownId = getArrayVal($_POST, "internalpricebreakdownId");
    
      $cost = getArrayVal($_POST, "cost");
    
      $project_no = getArrayVal($_POST, "project_no");
    
      $customer_model_number = getArrayVal($_POST, "customer_model_number");
    
      $jenkins_model_number = getArrayVal($_POST, "jenkins_model_number");
    
      $customer_assembly_number = getArrayVal($_POST, "customer_assembly_number");
    
      $jenkins_assembly_number = getArrayVal($_POST, "jenkins_assembly_number");
    
      $customer_part_number = getArrayVal($_POST, "customer_part_number");
    
      $jenkins_part_number = getArrayVal($_POST, "jenkins_part_number");
    
      $customer_drawing_number = getArrayVal($_POST, "customer_drawing_number");
    
      $revision1 = getArrayVal($_POST, "revision1");
    
      $jenkins_drawing_number = getArrayVal($_POST, "jenkins_drawing_number");
    
      $revision2 = getArrayVal($_POST, "revision2");
    
      $material = getArrayVal($_POST, "material");
    
      $additional_material_specification = getArrayVal($_POST, "additional_material_specification");
    
      $finish = getArrayVal($_POST, "finish");
    
      $material_cost = getArrayVal($_POST, "material_cost");
    
      $assembly_cost = getArrayVal($_POST, "assembly_cost");
    
      $overhead = getArrayVal($_POST, "overhead");
    
      $factory_profit = getArrayVal($_POST, "factory_profit");
    
      $tax = getArrayVal($_POST, "tax");
    
      $customs = getArrayVal($_POST, "customs");
    
      $freight = getArrayVal($_POST, "freight");
    
      $handling = getArrayVal($_POST, "handling");
    
      $internal_budgetary_price = getArrayVal($_POST, "internal_budgetary_price");
    
      $currency = getArrayVal($_POST, "currency");
    
    if(!$internalpricebreakdownId){
      $ret = $instance->add($cost,$project_no,$customer_model_number,$jenkins_model_number,$customer_assembly_number,$jenkins_assembly_number,$customer_part_number,$jenkins_part_number,$customer_drawing_number,$revision1,$jenkins_drawing_number,$revision2,$material,$additional_material_specification,$finish,$material_cost,$assembly_cost,$overhead,$factory_profit,$tax,$customs,$freight,$handling,$internal_budgetary_price,$currency);
      $internalpricebreakdownId = $ret;
    }else{
      $ret = $instance->update($internalpricebreakdownId,$cost,$project_no,$customer_model_number,$jenkins_model_number,$customer_assembly_number,$jenkins_assembly_number,$customer_part_number,$jenkins_part_number,$customer_drawing_number,$revision1,$jenkins_drawing_number,$revision2,$material,$additional_material_specification,$finish,$material_cost,$assembly_cost,$overhead,$factory_profit,$tax,$customs,$freight,$handling,$internal_budgetary_price,$currency);
    }
    
    $template->display("successclose.tpl");
    break;
  case "getList":
    $id = getArrayVal($_GET,"id");
    $list = $instance->get($id);
    $template->assign("internalpricebreakdownlist",$list);
    $template->display("internalpricebreakdowntable.tpl");
    break;
  case "del":
    $id = getArrayVal($_GET,"id");
    $ret = $instance->del($id);
    echo $ret;
    break;
  case "show":
    $id = getArrayVal($_GET,"id");
    $entry = $instance->get($id);
    $template->assign("internalpricebreakdown",$entry);
    $template->display("internalpricebreakdownview.tpl");
}

?>