<?php

require_once dirname(__FILE__) . '/../../include/class.Quality.php';
require_once dirname(__FILE__) . '/../../include/initfunctions.php';
require_once dirname(__FILE__) . '/../../include/class.mylog.php';
require_once dirname(__FILE__) . '/../../include/class.Status.php';


$_SESSION = array();
$_SESSION['userid'] = '1';
$_SESSION['username'] = 'unit_test_name';
/**
 * Test class for Quality.
 * Generated by PHPUnit on 2012-02-20 at 23:26:37.
 */
class QualityTest extends PHPUnit_Framework_TestCase {

  /**
   * @var Quality
   */
  protected $object;
  protected $conn;
  /**
   * Sets up the fixture, for example, opens a network connection.
   * This method is called before a test is executed.
   */
  protected function setUp() {
    $this->object = new Quality;
    $db_host = "127.0.0.1";
    $db_user = "db_jenkins_asia";
    $db_pass = "db_jenkins_asia";
    $db_name = "jenkins_asia";
    $this->conn = mysql_connect($db_host,$db_user,$db_pass);
    $this->db_check = mysql_select_db($db_name);
  }

  /**
   * Tears down the fixture, for example, closes a network connection.
   * This method is called after a test is executed.
   */
  protected function tearDown() {
    mysql_close();
  }

  /**
   * @covers Quality::add
   * @todo Implement testAdd().
   */
  public function testAdd() {
    #type 1 -> Quality Complain 0 -> Corrective Action Requestion
    $status = Status::getId("quality", "not_start");
    $ret =$this->object->add("test name", "test desc", 1, 1, "test comments", 1, $status);
    $this->assertNotEmpty($ret);
  }

  /**
   * @covers Quality::close
   * @todo Implement testClose().
   */
  public function testClose() {
    $this->object->close(1);
  }

  /**
   * @covers Quality::update
   * @todo Implement testUpdate().
   */
  public function testUpdate() {
    $status = Status::getId("quality", "closed");
    $ret = $this->object->update(1, "updatd desc", $status);
    $this->assertTrue($ret);
  }

}

?>
