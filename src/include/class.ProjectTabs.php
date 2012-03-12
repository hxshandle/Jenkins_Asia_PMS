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
}

?>
