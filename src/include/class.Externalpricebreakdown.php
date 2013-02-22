<?php
  class Externalpricebreakdown {

    private $myLog;
    function __construct(){
      $this->myLog = new mylog;
    }


    function add($cost,$project_no,$customer_model_number,$jenkins_model_number,$customer_assembly_number,$jenkins_assembly_number,$customer_part_number,$jenkins_part_number,$customer_drawing_number,$revision1,$jenkins_drawing_number,$revision2,$material,$additional_material_specification,$finish,$material_cost,$material_cost_currency,$assembly_cost,$assembly_cost_currency,$overhead,$overhead_currency,$factory_profit,$factory_profit_currency,$tax,$tax_currency,$customs,$customs_currency,$freight,$freight_currency,$handling,$handling_currency,$internal_budgetary_price,$internal_budgetary_price_currency,$currency,$approved,$Published,$valid){
      $cost = (int) $cost;
$project_no = mysql_escape_string($project_no);
$customer_model_number = mysql_escape_string($customer_model_number);
$jenkins_model_number = (int) $jenkins_model_number;
$customer_assembly_number = mysql_escape_string($customer_assembly_number);
$jenkins_assembly_number = mysql_escape_string($jenkins_assembly_number);
$customer_part_number = mysql_escape_string($customer_part_number);
$jenkins_part_number = mysql_escape_string($jenkins_part_number);
$customer_drawing_number = mysql_escape_string($customer_drawing_number);
$revision1 = mysql_escape_string($revision1);
$jenkins_drawing_number = (int) $jenkins_drawing_number;
$revision2 = mysql_escape_string($revision2);
$material = (double) $material;
$additional_material_specification = mysql_escape_string($additional_material_specification);
$finish = mysql_escape_string($finish);
$material_cost = (double) $material_cost;
$material_cost_currency = mysql_escape_string($material_cost_currency);
$assembly_cost = (double) $assembly_cost;
$assembly_cost_currency = mysql_escape_string($assembly_cost_currency);
$overhead = (double) $overhead;
$overhead_currency = mysql_escape_string($overhead_currency);
$factory_profit = (double) $factory_profit;
$factory_profit_currency = mysql_escape_string($factory_profit_currency);
$tax = (double) $tax;
$tax_currency = mysql_escape_string($tax_currency);
$customs = (double) $customs;
$customs_currency = mysql_escape_string($customs_currency);
$freight = (double) $freight;
$freight_currency = mysql_escape_string($freight_currency);
$handling = (double) $handling;
$handling_currency = mysql_escape_string($handling_currency);
$internal_budgetary_price = (double) $internal_budgetary_price;
$internal_budgetary_price_currency = mysql_escape_string($internal_budgetary_price_currency);
$currency = mysql_escape_string($currency);
$approved = (int) $approved;
$Published = (int) $Published;
$valid = (int) $valid;

      $sql = "insert into `external_price_breakdown` (`cost`,
`project_no`,
`customer_model_number`,
`jenkins_model_number`,
`customer_assembly_number`,
`jenkins_assembly_number`,
`customer_part_number`,
`jenkins_part_number`,
`customer_drawing_number`,
`revision1`,
`jenkins_drawing_number`,
`revision2`,
`material`,
`additional_material_specification`,
`finish`,
`material_cost`,
`material_cost_currency`,
`assembly_cost`,
`assembly_cost_currency`,
`overhead`,
`overhead_currency`,
`factory_profit`,
`factory_profit_currency`,
`tax`,
`tax_currency`,
`customs`,
`customs_currency`,
`freight`,
`freight_currency`,
`handling`,
`handling_currency`,
`internal_budgetary_price`,
`internal_budgetary_price_currency`,
`currency`,
`approved`,
`Published`) values ($cost,
'$project_no',
'$customer_model_number',
$jenkins_model_number,
'$customer_assembly_number',
'$jenkins_assembly_number',
'$customer_part_number',
'$jenkins_part_number',
'$customer_drawing_number',
'$revision1',
$jenkins_drawing_number,
'$revision2',
$material,
'$additional_material_specification',
'$finish',
$material_cost,
'$material_cost_currency',
$assembly_cost,
'$assembly_cost_currency',
$overhead,
'$overhead_currency',
$factory_profit,
'$factory_profit_currency',
$tax,
'$tax_currency',
$customs,
'$customs_currency',
$freight,
'$freight_currency',
$handling,
'$handling_currency',
$internal_budgetary_price,
'$internal_budgetary_price_currency',
'$currency',
$approved,
$Published)";
      $ins = mysql_query($sql);
      if($ins){
        return mysql_insert_id();
      }else{
        return false;
      }
    }

    function update($id,$cost,$project_no,$customer_model_number,$jenkins_model_number,$customer_assembly_number,$jenkins_assembly_number,$customer_part_number,$jenkins_part_number,$customer_drawing_number,$revision1,$jenkins_drawing_number,$revision2,$material,$additional_material_specification,$finish,$material_cost,$material_cost_currency,$assembly_cost,$assembly_cost_currency,$overhead,$overhead_currency,$factory_profit,$factory_profit_currency,$tax,$tax_currency,$customs,$customs_currency,$freight,$freight_currency,$handling,$handling_currency,$internal_budgetary_price,$internal_budgetary_price_currency,$currency,$approved,$Published,$valid){
      $id = (int) $id;
      $cost = (int) $cost;
$project_no = mysql_escape_string($project_no);
$customer_model_number = mysql_escape_string($customer_model_number);
$jenkins_model_number = (int) $jenkins_model_number;
$customer_assembly_number = mysql_escape_string($customer_assembly_number);
$jenkins_assembly_number = mysql_escape_string($jenkins_assembly_number);
$customer_part_number = mysql_escape_string($customer_part_number);
$jenkins_part_number = mysql_escape_string($jenkins_part_number);
$customer_drawing_number = mysql_escape_string($customer_drawing_number);
$revision1 = mysql_escape_string($revision1);
$jenkins_drawing_number = (int) $jenkins_drawing_number;
$revision2 = mysql_escape_string($revision2);
$material = (double) $material;
$additional_material_specification = mysql_escape_string($additional_material_specification);
$finish = mysql_escape_string($finish);
$material_cost = (double) $material_cost;
$material_cost_currency = mysql_escape_string($material_cost_currency);
$assembly_cost = (double) $assembly_cost;
$assembly_cost_currency = mysql_escape_string($assembly_cost_currency);
$overhead = (double) $overhead;
$overhead_currency = mysql_escape_string($overhead_currency);
$factory_profit = (double) $factory_profit;
$factory_profit_currency = mysql_escape_string($factory_profit_currency);
$tax = (double) $tax;
$tax_currency = mysql_escape_string($tax_currency);
$customs = (double) $customs;
$customs_currency = mysql_escape_string($customs_currency);
$freight = (double) $freight;
$freight_currency = mysql_escape_string($freight_currency);
$handling = (double) $handling;
$handling_currency = mysql_escape_string($handling_currency);
$internal_budgetary_price = (double) $internal_budgetary_price;
$internal_budgetary_price_currency = mysql_escape_string($internal_budgetary_price_currency);
$currency = mysql_escape_string($currency);
$approved = (int) $approved;
$Published = (int) $Published;
$valid = (int) $valid;

      $sql = "update `external_price_breakdown` set `cost` = $cost,
`project_no` = '$project_no',
`customer_model_number` = '$customer_model_number',
`jenkins_model_number` = $jenkins_model_number,
`customer_assembly_number` = '$customer_assembly_number',
`jenkins_assembly_number` = '$jenkins_assembly_number',
`customer_part_number` = '$customer_part_number',
`jenkins_part_number` = '$jenkins_part_number',
`customer_drawing_number` = '$customer_drawing_number',
`revision1` = '$revision1',
`jenkins_drawing_number` = $jenkins_drawing_number,
`revision2` = '$revision2',
`material` = $material,
`additional_material_specification` = '$additional_material_specification',
`finish` = '$finish',
`material_cost` = $material_cost,
`material_cost_currency` = '$material_cost_currency',
`assembly_cost` = $assembly_cost,
`assembly_cost_currency` = '$assembly_cost_currency',
`overhead` = $overhead,
`overhead_currency` = '$overhead_currency',
`factory_profit` = $factory_profit,
`factory_profit_currency` = '$factory_profit_currency',
`tax` = $tax,
`tax_currency` = '$tax_currency',
`customs` = $customs,
`customs_currency` = '$customs_currency',
`freight` = $freight,
`freight_currency` = '$freight_currency',
`handling` = $handling,
`handling_currency` = '$handling_currency',
`internal_budgetary_price` = $internal_budgetary_price,
`internal_budgetary_price_currency` = '$internal_budgetary_price_currency',
`currency` = '$currency',
`approved` = $approved,
`Published` = $Published where id = $id";
      $upd = mysql_query($sql);
      if($upd){
        return true;
      }else{
        return false;
      }
    }

    function get($id){
      $id = (int) $id;
      $sql ="select * from `external_price_breakdown` where id = $id";
      $sel = mysql_query($sql);
      $entry = false;
      if($sel){
        $entry = mysql_fetch_array($sel);
        $doc = new Document();
        if($entry['jenkins_drawing_number'] != ""){
           $doc1 = $doc->getDocumentInfo($entry['jenkins_drawing_number']);
           $entry['jenkins_drawing_number_doc_no'] = $doc1['document_no'];
        }
        if($entry['jenkins_model_number'] != ""){
           $doc2 = $doc->getDocumentInfo($entry['jenkins_model_number']);
           $entry['jenkins_model_number_doc_no'] = $doc2['document_no'];
        }
      }
      return $entry;
    }

    function getExternalpricebreakdownByCostId($id){
      $id = (int) $id;
      $sql ="select id from `external_price_breakdown` where cost = $id and valid = 1";
      $sel = mysql_query($sql);
      $arr = array();
      while($row = mysql_fetch_array($sel)){
        $entry = $this->get($row[0]);
        array_push($arr, $entry);
      }
      return $arr;
    }

    function del($id){
      $id = (int) $id;
      $sql ="update `external_price_breakdown` set valid = 0 where id = $id";
      $del = mysql_query($sql);
      if($del){
        return true;
      }else{
        return false;
      }
    }
  }
?>