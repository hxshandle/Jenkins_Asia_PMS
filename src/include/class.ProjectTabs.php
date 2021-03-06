<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ProjectTabs
 *
 * @author Administrator
 */
class ProjectTabs {
  //put your code here
   function __construct() {
  }
  
  function getTabsData($projectId){
    $phase = new Phase();
    $phaseData = $phase->getPhasesDetailsByProjectId($projectId);
    return array("phase"=>$phaseData);
  }
  function getPhaseTab($projectId){
    $phase = new Phase();
    $phaseData = $phase->getPhasesDetailsByProjectId($projectId);
    return $phaseData;
  }
  
  //get Finance by msj
  function getFinanceTab($projectId){
    $finance = new Finance();
    $financeData = $finance->getFinanceDetailsByProjectId($projectId);
    return $financeData;
  }

  function getCostTab($projectId){
    $cost = new Cost();
    $costData = $cost->getCostByProjectId($projectId);
    return $costData;
  }
  
    //get Sample by msj
  function getSampleTab($projectId){
    $sample = new Sample();
    $sampleData = $sample->getSampleDetailsByProjectId($projectId);
    return $sampleData;
  }
  
 //get SampleRequest by msj
  function getSampleRequestTab($projectId,$currentUserId){
    $sampleRequest = new SampleRequest();
    $sampleRequestData = $sampleRequest->getSampleRequestDetailsByProjectId($projectId,$currentUserId);
    return $sampleRequestData;
  }
  
  //get MemberTeam by msj
  function getMemberTab($projectId){
    $project = new Project();
    $memberData = $project->getProjectMembers($projectId);
    return $memberData;
  }
  
    //get Order by msj
  function getOrderTabByCustomer($projectId,$customerId){
    $order = new Order();
    $orderData = $order->getOrdersByCustomer($projectId,$customerId);
    return $orderData;
  }
  //get Order by msj
  function getOrderTab($projectId){
    $order = new Order();
    $orderData = $order->getOrdersByManager($projectId);
    return $orderData;
  }
      //get Ecn by msj
  function getEcnTab($projectId,$customerId){
    $ecn = new EngineeringChangeNote();
    $ecnData = $ecn->getEcnsByProjectId($projectId,$customerId);
    return $ecnData;
  }
  
  function getPurchaseTab($projectId){
    $purchase = new Purchase();
    $purchaseData = $purchase->getPurchasesByProjectId($projectId);
    return $purchaseData;
  }
  
  function getPurchaseTabBySupplier($projectId,$supplierId){
    $purchase = new Purchase();
    $purchaseData = $purchase->getPurchasesBySupplier($projectId,$supplierId);
    return $purchaseData;
  }

  function getQualityByProjectId($projectId){
    $quality = new Quality();
    $qualityData = $quality->getQualityByProjectId($projectId);
    return $qualityData;
  }
}

?>
