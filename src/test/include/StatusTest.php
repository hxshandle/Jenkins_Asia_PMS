<?php

require_once dirname(__FILE__) . '/../../include/class.Status.php';

/**
 * Test class for Status.
 * Generated by PHPUnit on 2012-02-18 at 13:10:35.
 */
class StatusTest extends PHPUnit_Framework_TestCase {
  protected $object;
  protected $conn;
  /**
   * @var Status
   */
  protected $object;

  /**
   * Sets up the fixture, for example, opens a network connection.
   * This method is called before a test is executed.
   */
  protected function setUp() {
    $this->object = new Status;
    $db_host = "127.0.0.1";
    $db_user = "db_jenkins_asia";
    $db_pass = "db_jenkins_asia";
    $db_name = "jenkins_asia";
    $this->conn = mysql_connect($db_host, $db_user, $db_pass);
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
   * @covers Status::add
   * @todo Implement testAdd().
   */
  public function testAdd() {
    // Remove the following lines when you implement this test.
    $this->markTestIncomplete(
            'This test has not been implemented yet.'
    );
  }

  /**
   * @covers Status::update
   * @todo Implement testUpdate().
   */
  public function testUpdate() {
    // Remove the following lines when you implement this test.
    $this->markTestIncomplete(
            'This test has not been implemented yet.'
    );
  }

  /**
   * @covers Status::del
   * @todo Implement testDel().
   */
  public function testDel() {
    // Remove the following lines when you implement this test.
    $this->markTestIncomplete(
            'This test has not been implemented yet.'
    );
  }

}

?>
