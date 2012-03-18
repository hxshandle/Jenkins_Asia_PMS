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
  
    //get ORder by msj
  function getOrderTabByCustomer($projectId,$customerId){
    $order = new Order();
    $orderData = $order->getOrdersByCustomer($projectId,$customerId);
    return $orderData;
  }
}

?>
