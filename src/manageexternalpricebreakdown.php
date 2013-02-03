<?php
require("init.php");
$action = getArrayVal($_POST, "action");
if (!$action) {
  $action = getArrayVal($_GET, "action");
}
$jUtils = new JUtils();
$instance = new Externalpricebreakdown;

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
      $template->assign("externalpricebreakdown",$entry);
    }else{
      $entry = array();
      $cost = new Cost();
      $costId = getArrayVal($_GET,"costId");
      $costEntry = $cost->get($costId);
      $entry['cost'] = $costId;
      $entry['project_no'] =$costEntry['project_no'];
      $entry['customer_model_number'] =$costEntry['customer_model_number'];
      $entry['jenkins_model_number'] = $costEntry['jenkins_model_number'];
      $entry['jenkins_model_number_doc_no'] = $costEntry['jenkins_model_number_doc_no'];
      $entry['customer_assembly_number'] = $costEntry['customer_assembly_number'];
      $entry['jenkins_assembly_number'] = $costEntry['jenkins_assembly_number'];
      $entry['customer_part_number'] = $costEntry['customer_part_number'];
      $entry['jenkins_part_number'] = $costEntry['jenkins_part_number'];
      $entry['revision1'] = $costEntry['revision1'];
       $entry['revision2'] = $costEntry['revision2'];
      $entry['jenkins_drawing_number'] = $costEntry['jenkins_drawing_number'];
      $entry['jenkins_drawing_number_doc_no'] = $costEntry['jenkins_drawing_number_doc_no'];
      $entry['customer_drawing_number'] = $costEntry['customer_drawing_number'];
      $template->assign("externalpricebreakdown",$entry);
    }
    $template->display("editexternalpricebreakdownform.tpl");
    break;
  case "update":
    $externalpricebreakdownId = getArrayVal($_POST, "externalpricebreakdownId");
    
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
    
      $approved = getArrayVal($_POST, "approved");
    
      $Published = getArrayVal($_POST, "Published");
    
    if(!$externalpricebreakdownId){
      $ret = $instance->add($cost,$project_no,$customer_model_number,$jenkins_model_number,$customer_assembly_number,$jenkins_assembly_number,$customer_part_number,$jenkins_part_number,$customer_drawing_number,$revision1,$jenkins_drawing_number,$revision2,$material,$additional_material_specification,$finish,$material_cost,$assembly_cost,$overhead,$factory_profit,$tax,$customs,$freight,$handling,$internal_budgetary_price,$currency,$approved,$Published);
      $externalpricebreakdownId = $ret;
    }else{
      $ret = $instance->update($externalpricebreakdownId,$cost,$project_no,$customer_model_number,$jenkins_model_number,$customer_assembly_number,$jenkins_assembly_number,$customer_part_number,$jenkins_part_number,$customer_drawing_number,$revision1,$jenkins_drawing_number,$revision2,$material,$additional_material_specification,$finish,$material_cost,$assembly_cost,$overhead,$factory_profit,$tax,$customs,$freight,$handling,$internal_budgetary_price,$currency,$approved,$Published);
    }
    $template->assign("callback","J.refresh");
    $template->display("successclose.tpl");
    break;
  case "getList":
    $id = getArrayVal($_GET,"id");
    $list = $instance->get($id);
    $template->assign("externalpricebreakdownlist",$list);
    $template->display("externalpricebreakdowntable.tpl");
    break;
  case "del":
    $id = getArrayVal($_GET,"id");
    $ret = $instance->del($id);
    echo $ret ? "true" : "false";
    break;
  case "show":
    $id = getArrayVal($_GET,"id");
    $entry = $instance->get($id);
    $template->assign("externalpricebreakdown",$entry);
    $template->display("externalpricebreakdownview.tpl");
}

?>