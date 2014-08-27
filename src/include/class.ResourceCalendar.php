<?php
class ResourceCalendar {
  private $daysInMonth;
  private $daysLastMonth;
  private $weeksInMonth;
  private $firstDay;
  private $month;
  private $year;
  private $project;
  private $user;
  public $calendar;
  function __construct() {
    $this->calendar = array();
  }

  public function getCal($month, $year, $project = 0,$userId = 0) {
    $this->month = $month;
    $this->year = $year;
    
    //get number of days in the given and the previous month
    $this->daysInMonth = date("t",mktime(0,0,0,$month,1,$year));
    $this->daysLastMonth = date("t",mktime(0,0,0,$month-1,1,$year));
    // get first day of the month
    $this->firstDay = date("w", mktime(0,0,0,$month,1,$year))-1;
    $tempDays = $this->firstDay + $this->daysInMonth;
    $this->weeksInMonth = ceil($tempDays/7);
    
    $this->project = $project;
    $this->user = $userId;
    
    return $this->buildCal();
  }

  private function buildCal() {
    $counter = 0;
    $ms = new milestone();
    $tsk = new task();
    
    for($j=0;$j<$this->weeksInMonth;$j++) {
      for($i=0;$i<7;$i++) {
        $counter++;
        $theday = $counter-$this->firstDay;
        //$theday = $theday - 1;
        
        if ($theday < 1) {  
          $this->calendar[$j][$i]["val"] = $this->daysLastMonth+$theday;
          $this->calendar[$j][$i]["currmonth"] = 0;
        }
        elseif($theday > $this->daysInMonth)
        {
          $this->calendar[$j][$i]["val"] = $theday-$this->daysInMonth;
          $this->calendar[$j][$i]["currmonth"] = 0;
        }
        else
        {
          $tasks = $tsk->getTodayTasksByUserAndProject($this->month,$this->year,$theday,$this->project,$this->user,1000);
          $taskNames = "";
          $locationStr = "";
          foreach ($tasks as $tk) {
            $taskNames=$taskNames.$tk['title'].",";
            $locationStr=$locationStr.$tk['location'].",";
          }
          $taskNames = substr($taskNames,0,-1);
          $locationStr = substr($locationStr,0,-1);
          $tasksnum = count($tasks);
          
          $this->calendar[$j][$i] = array(
                        "val"=>$theday,
                        "tasks"=>$tasks,
                        "tasksnum"=>$tasksnum,
                        "taskname"=>$taskNames,
                        "location"=>$locationStr,
                        "currmonth"=>1
                        );
        }
      }
    }
  return $this;
  }  
}

?>