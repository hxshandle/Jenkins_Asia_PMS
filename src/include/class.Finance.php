<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Finance
 *
 * @author huanghandle
 */
class Finance {
  //put your code here
  private $myLog;
  
  function __construct() {
    $this->myLog = new mylog;
  }
  
  function add($name,$project,$innerCost,$innerCostCurrency,$externalCost,$externalCostCurrency,$approved=0,$published=0,$order=NULL,$valid=1){
    $name = mysql_escape_string($name);
    $project = (int) $project;
    $innerCost = (int) $innerCost;
    $externalCost = (int) $externalCost;
    $approved = (int) $approved;
    $published = (int) $published;
    $order = (int) $order;
    $sql="insert into finance (`name`,`project`,`inner_cost`,`inner_cost_currency`,`external_cost`,`external_cost_currency`,`approved`,`published`,`order`,`valid`) values ('$name',$project,$innerCost,'$innerCostCurrency',$externalCost,'$externalCostCurrency',$approved,$published,$order,$valid)";
    $ins = mysql_query($sql);
    if($ins){
      $id = mysql_insert_id();
      return $id;
    }else{
      return FALSE;
    }
    
  }
  
  function update($id,$innerCost,$innerCostCurrency,$externalCost,$externalCostCurrency,$approved=0,$published=0,$order=NULL,$valid=1){
    $innerCost = (int) $innerCost;
    $externalCost = (int) $externalCost;
    $approved = (int) $approved;
    $published = (int) $published;
    $order = (int) $order;
    $sql="update finance set `inner_cost` = $innerCost,`inner_cost_currency` = '$innerCostCurrency',`external_cost` = $externalCost,`external_cost_currency`='$externalCostCurrency',`approved` = $approved,`published`=$published,`order`=$order,`valid`=$valid where ID = $id";
    $upd = mysql_query($sql);
    if($upd){
      return TRUE;
    }else{
      return FALSE;
    }
  }
}

?>
