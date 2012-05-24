<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Class
 *
 * @author Administrator
 */
class QualityDetails {
//put your code here
  private $myLog;
  
  function __construct() {
    $this->myLog = new mylog;
  }
  
  function add($quality,$reject_desc,$quantity,$required_desc,$root_cause,$containment_action,$supplier_short_term_corrective_act,$shot_term_implementation_date,$short_term_verified,$supplier_long_term_corrective_act,$long_term_implementation_date,$vendor_process_audit_plan_revision,$long_term_verified){
    
    $quality = (int) $quality;

    $reject_desc = mysql_escape_string($reject_desc);
    $quantity = mysql_escape_string($quantity);
    $required_desc = mysql_escape_string($required_desc);
    $root_cause = mysql_escape_string($root_cause);
    $containment_action = mysql_escape_string($containment_action);
    $supplier_short_term_corrective_act = mysql_escape_string($supplier_short_term_corrective_act);
    $short_term_verified = (int) $short_term_verified;
    $supplier_long_term_corrective_act = mysql_escape_string($supplier_long_term_corrective_act);
    $vendor_process_audit_plan_revision = mysql_escape_string($vendor_process_audit_plan_revision);
    $long_term_verified = (int)$long_term_verified;

    $sql = "
          INSERT INTO `quality_details`
          (
          `quality`,
          `reject_desc`,
          `quantity`,
          `required_desc`,
          `root_cause`,
          `containment_action`,
          `supplier_short_term_corrective_act`,
          `shot_term_implementation_date`,
          `short_term_verified`,
          `supplier_long_term_corrective_act`,
          `long_term_implementation_date`,
          `vendor_process_audit_plan_revision`,
          `long_term_verified`)
          VALUES
          (
          $quality,
          '$reject_desc',
          '$quantity',
          '$required_desc',
          '$root_cause',
          '$containment_action',
          '$supplier_short_term_corrective_act',";

          if(empty($shot_term_implementation_date)){
            $sql = $sql."null,";
          }else{
            $sql = $sql."'".$shot_term_implementation_date."',";
          }
          $sql = $sql."$short_term_verified,
          '$supplier_long_term_corrective_act',";
          if(empty($long_term_implementation_date)){
            $sql = $sql."null,";
          }else{
            $sql = $sql."'".$long_term_implementation_date."',";
          }
          
          $sql = $sql."'$vendor_process_audit_plan_revision',
          $long_term_verified
          )
          ";
    $ins = mysql_query($sql);
    if($ins){
      return mysql_insert_id();
    }else{
      return false;
    }
  }

  function update($id,$reject_desc,$quantity,$required_desc,$root_cause,$containment_action,$supplier_short_term_corrective_act,$shot_term_implementation_date,$short_term_verified,$supplier_long_term_corrective_act,$long_term_implementation_date,$vendor_process_audit_plan_revision,$long_term_verified){
    
    $quality = (int) $quality;
    $id = (int) $id;

    $reject_desc = mysql_escape_string($reject_desc);
    $quantity = mysql_escape_string($quantity);
    $required_desc = mysql_escape_string($required_desc);
    $root_cause = mysql_escape_string($root_cause);
    $containment_action = mysql_escape_string($containment_action);
    $supplier_short_term_corrective_act = mysql_escape_string($supplier_short_term_corrective_act);
    $short_term_verified = (int)$short_term_verified;
    $supplier_long_term_corrective_act = mysql_escape_string($supplier_long_term_corrective_act);
    $vendor_process_audit_plan_revision = mysql_escape_string($vendor_process_audit_plan_revision);
    $long_term_verified = (int)$long_term_verified;


    $sql = "
        UPDATE `jenkins_asia_uat`.`quality_details`
        SET
        `reject_desc` = '$reject_desc',
        `quantity` = '$quantity',
        `required_desc` = '$required_desc',
        `root_cause` = '$root_cause',
        `containment_action` = '$containment_action',
        `supplier_short_term_corrective_act` = '$supplier_short_term_corrective_act',";
        
    if(empty($shot_term_implementation_date)){
          $sql = $sql."`shot_term_implementation_date` = null,";
        }else{
          $sql = $sql."`shot_term_implementation_date` = '$shot_term_implementation_date',";
        }
        
        $sql = $sql."`short_term_verified` = $short_term_verified,
        `supplier_long_term_corrective_act` = '$supplier_long_term_corrective_act',";
        
        if(empty($long_term_implementation_date)){
          $sql = $sql."`long_term_implementation_date` = null,";
        }else{
           $sql = $sql."`long_term_implementation_date` = '$long_term_implementation_date',";
        }
    
        $sql = $sql."`vendor_process_audit_plan_revision` = '$vendor_process_audit_plan_revision',
        `long_term_verified` = $long_term_verified
        WHERE ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return true;
    }else{
      return false;
    }
  }

  function getQualityDetailsByQualityId($id){
    $id = (int) $id;
    $sql = "select * from quality_details where quality=$id";
    $sel = mysql_query($sql);
    $arr = array();
    while ($row = mysql_fetch_array($sel)) {
      array_push($arr, $row);
    }
    return $arr;
    }
    
    function get($id){
      $id = (int) $id;
      $sql = "select * from quality_details where id=$id";
      $sel = mysql_query($sql);
      return  mysql_fetch_array($sel);

    }
}
?>
