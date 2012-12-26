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
  
  function add($quality,$status,$reject_desc,$quantity,$required_desc,$root_cause,$containment_action,$supplier_short_term_corrective_act,$shot_term_implementation_date,$short_term_verified,$supplier_long_term_corrective_act,$long_term_implementation_date,$vendor_process_audit_plan_revision,$long_term_verified){
    
    $quality = (int) $quality;
    $status = (int) $status;

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
          `status`,
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
          $status,
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

  function update($id,$status,$reject_desc,$quantity,$required_desc,$root_cause,$containment_action,$supplier_short_term_corrective_act,$shot_term_implementation_date,$short_term_verified,$supplier_long_term_corrective_act,$long_term_implementation_date,$vendor_process_audit_plan_revision,$long_term_verified){
    
    $quality = (int) $quality;
    $status = (int) $status;
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
        UPDATE `quality_details`
        SET
        `reject_desc` = '$reject_desc',
        `status` = $status,
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
    while($row = mysql_fetch_array($sel)){
        $sql2 = "select f.* from files f,quality_details_attached q where q.file_id = f.id and q.details_id = $row[ID]";
        $sel2 = mysql_query($sql2);
        $files = array();
        $images = array();
        while($rowf = mysql_fetch_array($sel2)){
          array_push($files,$rowf);
          $ext = substr($rowf['name'],substr(-4));
          if($ext == ".png" || $ext == ".jpg" || $ext="jpeg"){
            array_push($images,$rowf);
          }
        }
        $row["images"] = $images;
        $row["files"]=$files;
        array_push($arr, $row);
      }
    return $arr;
    }
    
    function get($id){
      $id = (int) $id;
      $sql = "select * from quality_details where id=$id";
      $sel = mysql_query($sql);
      $arr = array();
      while($row = mysql_fetch_array($sel)){
        $sql2 = "select f.* from files f,quality_details_attached q where q.file_id = f.id and q.details_id = $row[ID]";
        $sel2 = mysql_query($sql2);
        $files = array();
        while($rowf = mysql_fetch_array($sel2)){
          array_push($files,$rowf);
        }
        $row["files"]=$files;
        array_push($arr, $row);
      }
      return  $arr;

    }
    function attachFile($detailId,$fileId){
    $detailId = (int) $detailId;
    $fileId = (int) $fileId;
    $sql = "INSERT INTO `quality_details_attached`
                (
                `details_id`,
                `file_id`)
                VALUES
                (
                $detailId,
                $fileId
                )";
    $ins = mysql_query($sql);
    if($ins){
      return mysql_insert_id();
    }else{
      return false;
    }
}
}
?>
