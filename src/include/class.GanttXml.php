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

    
    foreach ($phaseObjs as $phaseItem) {
      $phaseEl = $doc->createElement("project");
      $phaseEl->setAttribute("id", "phase-".$phaseItem["ID"]);
      $phaseEl->setAttribute("name", $phaseItem["name"]);
      $phaseStartDate = str_replace("-", ",", substr($phaseItem["start_date"],0,10));
      $phaseEl->setAttribute("startdate", $phaseStartDate);
 
      //build deliverable items
      $deliverableItems = $deliverableItem->getDeliverableItemsByPhaseId($phaseItem["ID"], 1000);
      foreach ($deliverableItems as $deliverItem) {
        $deliverItemEl=$doc->createElement("task");
        $deliverItemEl->setAttribute("id", "deliverable-".$deliverItem["ID"]);
        
        $deliverItemNameEl=$doc->createElement("name",$deliverItem["name"]);
        $deliverItemEl->appendChild($deliverItemNameEl);
        
        $deliverItemStartDate = str_replace("-", ",", substr($deliverItem["start_date"],0,10));
        $deliverItemEstEl = $doc->createElement("est",$deliverItemStartDate);
        $deliverItemEl->appendChild($deliverItemEstEl);
        
        $deliverItemDruation =  $this->getDurationHours($deliverItem["start_date"], $deliverItem["end_date"]);
        $deliverItemDurEl = $doc->createElement("duration",$deliverItemDruation);
        $deliverItemEl->appendChild($deliverItemDurEl);
        
        $deliverItemCompletedPer = 30;
        $deliverItemCompletedEl = $doc->createElement("percentcompleted",$deliverItemCompletedPer);
        $deliverItemEl->appendChild($deliverItemCompletedEl);
        
        $deliverItemPreEl = $doc->createElement("predecessortasks");
        $deliverItemEl->appendChild($deliverItemPreEl);
        
        $tasksEl = $doc->createElement("childtasks");
        
        $tasks = $task->getTasksByDeliverableId($deliverItem["ID"]);
        foreach($tasks as $t){
          $taskEl=$doc->createElement("task");
          $taskEl->setAttribute("id", "task-".$t["ID"]);
          
          $taskNameEl = $doc->createElement("name",$t["title"]);
          $taskEl->appendChild($taskNameEl);
          
          $taskStartDate = str_replace("-", ",", substr($t["start_date"],0,10));
          $taskEstEl = $doc->createElement("est",$taskStartDate);
          $taskEl->appendChild($taskEstEl);
          
          $taskDuration = $this->getDurationHours($t["start_date"], $t["end_date"]);
          $taskDurEl = $doc->createElement("duration",$taskDuration);
          $taskEl->appendChild($taskDurEl);
          
          $taskCompletedPer = 40;
          $taskCompletedEl = $doc->createElement("percentcompleted",$taskCompletedPer);
          $taskEl->appendChild($taskCompletedEl);
          
          $taskEl->appendChild($doc->createElement("predecessortasks"));
          $taskEl->appendChild($doc->createElement("childtasks"));
          
          
          $tasksEl->appendChild($taskEl);
        }
        $deliverItemEl->appendChild($tasksEl);
        $phaseEl->appendChild($deliverItemEl);
        
      }
      
      $projects->appendChild($phaseEl);
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
