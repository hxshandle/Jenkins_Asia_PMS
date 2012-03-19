<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of GanttXml
 *
 * @author huanghandle
 */
class GanttXml {
  //put your code here
  
  function buildProject($projectId){
    $projectId = (int) $projectId;
    $project = new project();
    $phase = new Phase();
    $deliverableItem = new DeliverableItem();
    $task = new task();
    
    $projectObj = $project->getProject($projectId);
    $phaseObjs = $phase->getPhasesByProjectId($projectId);
    
    $doc = new DOMDocument('1.0');
    // we want a nice output
    $doc->formatOutput = true;

    $projects = $doc->createElement('projects');
    $projects = $doc->appendChild($projects);
    
    $projectEl = $doc->createElement("project");
    $projectEl->setAttribute("id", $projectObj["ID"]);
    $projectEl->setAttribute("name", $projectObj["name"]);
    $startDate = str_replace("-", ",", $projectObj["start_date"]);
    $startDate = substr($startDate, 0, 10);
    $projectEl->setAttribute("startdate", $startDate);
    $projects->appendChild($projectEl);
    
    foreach ($phaseObjs as $phaseItem) {
      $phaseEl = $doc->createElement("task");
      $phaseEl->setAttribute("id", $phaseItem["ID"]);
      
      $phaseNameEl=$doc->createElement("name",$phaseItem["name"]);
      $phaseEl->appendChild($phaseNameEl);
      
      $phaseStartDate = str_replace("-", ",", substr($phaseItem["start_date"],0,10));
      $estEl = $doc->createElement("est",$phaseStartDate);
      $phaseEl->appendChild($estEl);
      
      $phaseDruation= $this->getDurationHours($phaseItem["start_date"], $phaseItem["end_date"]);
      $phaseDruationEl = $doc->createElement("duration",$phaseDruation);
      $phaseEl->appendChild($phaseDruationEl);
      
      $phaseCompletedPer = 20;
      $phaseCompletedEl = $doc->createElement("percentcompleted",$phaseCompletedPer);
      $phaseEl->appendChild($phaseCompletedEl);
      
      $phasePreEl = $doc->createElement("predecessortasks");
      $phaseEl->appendChild($phasePreEl);
      
      $deliverableItemsEl = $doc->createElement("childtasks");
      $phaseEl->appendChild($deliverableItemsEl);
      
      $projectEl->appendChild($phaseEl);
    }
     return $doc->saveXML();
    
  }
  
  protected function getDurationHours($startDate,$endDate){
    $start = strtotime($startDate);
    $end = strtotime($endDate);
    $Days=round(($end-$start)/3600/24)+1;
    return $Days*8;
    
  }
}

?>
