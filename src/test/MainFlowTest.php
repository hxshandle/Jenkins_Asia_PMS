<?php
require_once dirname(__FILE__) . '/../include/initfunctions.php';
require_once dirname(__FILE__) . '/../include/class.mylog.php';
require_once dirname(__FILE__) . '/../include/class.project.php';
require_once dirname(__FILE__) . '/../include/class.tasklist.php';
require_once dirname(__FILE__) . '/../include/class.task.php';
require_once dirname(__FILE__) . '/../include/class.Phase.php';
require_once dirname(__FILE__) . '/../include/class.Status.php';
require_once dirname(__FILE__) . '/../include/class.DeliverableItem.php';
$_SESSION = array();
$_SESSION['userid'] = '1';
$_SESSION['username'] = 'unit_test_name';
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of MainFlowTest
 *
 * @author Administrator
 */
class MainFlowTest extends PHPUnit_Framework_TestCase {

  //put your code here
  protected $conn;
  protected $object;
  private $projectTaskList = array();
  private $project1,$project2;

  /**
   * Sets up the fixture, for example, opens a network connection.
   * This method is called before a test is executed.
   */
  protected function setUp() {
    $db_host = "127.0.0.1";
    $db_user = "db_jenkins_asia";
    $db_pass = "db_jenkins_asia";
    $db_name = "jenkins_asia";
    $this->conn = mysql_connect($db_host, $db_user, $db_pass);
    $this->db_check = mysql_select_db($db_name);
    mysql_query("set names ’utf8’ ");  
    mysql_query("set character_set_client=utf8");  
    mysql_query("set character_set_results=utf8"); 
    $this->buildBaseData();
  }

  /**
   * Tears down the fixture, for example, closes a network connection.
   * This method is called after a test is executed.
   */
  protected function tearDown() {
    mysql_close($this->conn);
  }
  
  private function buildBaseData(){
    $project = new project();
    $pStatus = Status::getId("project", "planning");
    $startDate = date("Y-m-d H:i:s",strtotime("2012-02-01"));
    $endDate = date("Y-m-d H:i:s",strtotime("2012-02-01"));
    $project1=$project->add("project-1", "p1", $pStatus, 100, 1, 1, "customer-1", "supplier-1", 10, "USD", 200, 300, 400, 3, 4, 5, $startDate, $endDate);
    $project2=$project->add("project-2", "p1", $pStatus, 100, 1, 1, "customer-1", "supplier-1", 10, "USD", 200, 300, 400, 3, 4, 5, $startDate, $endDate);
    $this->project1=$project1;
    $this->project2=$project2;
    $this->buildTaskList($project1);
    $this->buildTaskList($project2);
    
    //Phase
    $phase = new Phase();
    $phaseStatus = Status::getId("phase", "not_start");
    $phase1=$phase->add("Project-1-Phase-1", "P1P1", $project1, $phaseStatus);
    $phase2=$phase->add("Project-1-Phase-2", "P1P2", $project1, $phaseStatus);
    $phase3=$phase->add("Project-1-Phase-3", "P1P3", $project1, $phaseStatus);
    
    $phase4=$phase->add("Project-2-Phase-1", "P2P1", $project2, $phaseStatus);
    $phase5=$phase->add("Project-2-Phase-2", "P2P2", $project2, $phaseStatus);
    $phase6=$phase->add("Project-2-Phase-3", "P2P3", $project2, $phaseStatus);
    
    $d1=$this->buildDeliveralbeItem($project1, $phase1);
    $d2=$this->buildDeliveralbeItem($project1, $phase2);
    $d3=$this->buildDeliveralbeItem($project1, $phase3);
    
    $d4=$this->buildDeliveralbeItem($project2, $phase4);
    $d5=$this->buildDeliveralbeItem($project2, $phase5);
    $d6=$this->buildDeliveralbeItem($project2, $phase6);
    
    $this->buildTask($project1, $phase1, $d1[0]);
    $this->buildTask($project1, $phase1, $d1[1]);
    $this->buildTask($project1, $phase1, $d1[2]);
    $this->buildTask($project1, $phase1, $d1[3]);
    $this->buildTask($project1, $phase1, $d1[4]);
    
    $this->buildTask($project1, $phase2, $d2[0]);
    $this->buildTask($project1, $phase2, $d2[1]);
    $this->buildTask($project1, $phase2, $d2[2]);
    $this->buildTask($project1, $phase2, $d2[3]);
    $this->buildTask($project1, $phase2, $d2[4]);

    $this->buildTask($project1, $phase3, $d3[0]);
    $this->buildTask($project1, $phase3, $d3[1]);
    $this->buildTask($project1, $phase3, $d3[2]);
    $this->buildTask($project1, $phase3, $d3[3]);
    $this->buildTask($project1, $phase3, $d3[4]);
    

    $this->buildTask($project2, $phase4, $d4[0]);
    $this->buildTask($project2, $phase4, $d4[1]);
    $this->buildTask($project2, $phase4, $d4[2]);
    $this->buildTask($project2, $phase4, $d4[3]);
    $this->buildTask($project2, $phase4, $d4[4]);
    
    $this->buildTask($project2, $phase5, $d5[0]);
    $this->buildTask($project2, $phase5, $d5[1]);
    $this->buildTask($project2, $phase5, $d5[2]);
    $this->buildTask($project2, $phase5, $d5[3]);
    $this->buildTask($project2, $phase5, $d5[4]);

    $this->buildTask($project2, $phase6, $d6[0]);
    $this->buildTask($project2, $phase6, $d6[1]);
    $this->buildTask($project2, $phase6, $d6[2]);
    $this->buildTask($project2, $phase6, $d6[3]);
    $this->buildTask($project2, $phase6, $d6[4]);
    
    
  }
  private function buildDeliveralbeItem($project,$phase){
    $deliverableItem = new DeliverableItem();
    $status = Status::getId("deliverable", "not_start");
    $startDate = date("Y-m-d H:i:s",strtotime("2012-02-01"));
    $endDate = date("Y-m-d H:i:s",strtotime("2012-02-01"));
    $d1=$deliverableItem->add("project-".$project."-Phase".$phase."test_deliverable1", $status, $startDate, $endDate, $project, $phase, "desc11");
    $d2=$deliverableItem->add("project-".$project."-Phase".$phase."test_deliverable2", $status, $startDate, $endDate, $project, $phase, "desc11");
    $d3=$deliverableItem->add("project-".$project."-Phase".$phase."test_deliverable3", $status, $startDate, $endDate, $project, $phase, "desc11");
    $d4=$deliverableItem->add("project-".$project."-Phase".$phase."test_deliverable4", $status, $startDate, $endDate, $project, $phase, "desc11");
    $d5=$deliverableItem->add("project-".$project."-Phase".$phase."test_deliverable5", $status, $startDate, $endDate, $project, $phase, "desc11");
    $ids = array();
    array_push($ids, $d1);
    array_push($ids, $d2);
    array_push($ids, $d3);
    array_push($ids, $d4);
    array_push($ids, $d5);
    return $ids;
  }
  
  private function buildTaskList($project){
    $taskList = new tasklist();
    $list = array();
    $l1= $taskList->add_liste($project, "tasklist1", "desc..");
    $l2=$taskList->add_liste($project, "tasklist2", "desc..");
    array_push($list, $l1);
    array_push($list, $l2);
    $this->projectTaskList["$project"] = $list;
  }
  
  private function buildTask($project,$phase,$deliverableItem){
    $task = new task();
    $status = Status::getId("deliverable", "not_start");
    $startDate = date("Y-m-d H:i:s",strtotime("2012-02-01"));
    $endDate = date("Y-m-d H:i:s",strtotime("2012-02-01"));
    $t1=$task->add($startDate, $endDate, "project-".$project."-phase-".$phase."deliverable-".$deliverableItem."task1", "test...", $this->projectTaskList["$project"][0], $status, $project,$phase, $deliverableItem, NULL, "上海");
    $t2=$task->add($startDate, $endDate, "project-".$project."-phase-".$phase."deliverable-".$deliverableItem."task1", "test...", $this->projectTaskList["$project"][0], $status, $project, $phase,$deliverableItem, $t1, "上海");
    $t3=$task->add($startDate, $endDate, "project-".$project."-phase-".$phase."deliverable-".$deliverableItem."task1", "test...", $this->projectTaskList["$project"][0], $status, $project,$phase, $deliverableItem, $t2, "上海");
    
    $t1=$task->add($startDate, $endDate, "project-".$project."-phase-".$phase."deliverable-".$deliverableItem."task1", "test...", $this->projectTaskList["$project"][1], $status, $project,$phase, $deliverableItem, NULL, "上海");
    $t2=$task->add($startDate, $endDate, "project-".$project."-phase-".$phase."deliverable-".$deliverableItem."task1", "test...", $this->projectTaskList["$project"][1], $status, $project,$phase, $deliverableItem, $t1, "上海");
    $t3=$task->add($startDate, $endDate, "project-".$project."-phase-".$phase."deliverable-".$deliverableItem."task1", "test...", $this->projectTaskList["$project"][1], $status, $project,$phase, $deliverableItem, $t2, "上海");
  }
  
//put your code here
  public function testEmptyFunc() {
    $this->assertEquals(TRUE, TRUE);
  }
  
  public function testCloseProject(){
    $project = new project();
    print_r("close project --> ".$this->project1);
    $ret = $project->close($this->project1);
    $this->assertTrue($ret);
  }
  public function testEditProject(){
    $project = new project();
    print_r("edit project --> ".$this->project2);
    $pStatus = Status::getId("project", "planning");
    $startDate = date("Y-m-d H:i:s",strtotime("2012-02-01"));
    $endDate = date("Y-m-d H:i:s",strtotime("2012-02-01"));
    $ret = $project->edit($this->project2,"change......", "p1", $pStatus, 300, 1, 1, "customer-11", "supplier-11", 10, "USD", 200, 300, 400, 3, 4, 5, $startDate, $endDate);
    $this->assertTrue($ret);
  }
}

?>
