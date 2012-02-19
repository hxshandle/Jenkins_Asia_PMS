<?php

require_once dirname(__FILE__) . '/../../include/initfunctions.php';
require_once dirname(__FILE__) . '/../../include/class.EngineeringChangeNote.php';

$_SESSION = array();
$_SESSION['userid'] = '1';
$_SESSION['username'] = 'unit_test_name';
/**
 * Test class for EngineeringChangeNote.
 * Generated by PHPUnit on 2012-02-15 at 20:22:10.
 */
class EngineeringChangeNoteTest extends PHPUnit_Framework_TestCase {

  /**
   * @var EngineeringChangeNote
   */
  protected $object;
  protected $conn;

  /**
   * Sets up the fixture, for example, opens a network connection.
   * This method is called before a test is executed.
   */
  protected function setUp() {
    $db_host = "127.0.0.1";
    $db_user = "db_jenkins_asia";
    $db_pass = "db_jenkins_asia";
    $db_name = "jenkins_asia";
    $this->object = new EngineeringChangeNote;
    $this->conn = mysql_connect($db_host,$db_user,$db_pass);
    $this->db_check = mysql_select_db($db_name);

  }

  /**
   * Tears down the fixture, for example, closes a network connection.
   * This method is called after a test is executed.
   */
  protected function tearDown() {
    mysql_close($this->conn);
    
  }

  /**
   * @covers EngineeringChangeNote::add
   * @todo Implement testAdd().
   */
  public function testAdd() {
    // Remove the following lines when you implement this test.
    $id = $this->object->add("comments", 1, 1, 1);
    $this->assertNotEmpty($id);
  }

  /**
   * @covers EngineeringChangeNote::approve
   * @todo Implement testApprove().
   */
  public function testApprove() {
    // Remove the following lines when you implement this test.
    $ret = $this->object->approve(1, '2', "this is approve comment");
    $this->assertTrue($ret);
  }

  /**
   * @covers EngineeringChangeNote::reject
   * @todo Implement testReject().
   */
  public function testReject() {
    // Remove the following lines when you implement this test.
    $ret = $this->object->reject(1, '2', "this is reject comment");
    $this->assertTrue($ret);
  }

}

?>