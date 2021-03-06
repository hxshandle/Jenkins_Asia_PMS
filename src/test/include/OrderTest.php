<?php

require_once dirname(__FILE__) . '/../../include/class.Order.php';
require_once dirname(__FILE__) . '/../../include/initfunctions.php';
require_once dirname(__FILE__) . '/../../include/class.mylog.php';
require_once dirname(__FILE__) . '/../../include/class.Status.php';


$_SESSION = array();
$_SESSION['userid'] = '1';
$_SESSION['username'] = 'unit_test_name';
/**
 * Test class for Order.
 * Generated by PHPUnit on 2012-02-20 at 00:16:23.
 */
class OrderTest extends PHPUnit_Framework_TestCase {

  /**
   * @var Order
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
    $this->conn = mysql_connect($db_host,$db_user,$db_pass);
    $this->db_check = mysql_select_db($db_name);
    $this->object = new Order;
  }

  /**
   * Tears down the fixture, for example, closes a network connection.
   * This method is called after a test is executed.
   */
  protected function tearDown() {
    mysql_close();
  }

  /**
   * @covers Order::add
   * @todo Implement testAdd().
   */
  public function testAdd() {
    $endTime = date("Y-m-d H:i:s",  strtotime("2012-10-31"));
    $status = Status::getId("order", "accepted");
    $ret = $this->object->add("test_order",1, "test desc", $endTime, $status);
    $this->assertNotEmpty($ret);
  }

  /**
   * @covers Order::accept
   * @todo Implement testAccept().
   */
  public function testAccept() {
    $ret = $this->object->accept(1);
    $this->assertTrue($ret);
  }

  /**
   * @covers Order::close
   * @todo Implement testClose().
   */
  public function testClose() {
    $ret = $this->object->close(2);
    $this->assertTrue($ret);
  }

  /**
   * @covers Order::update
   * @todo Implement testUpdate().
   */
  public function testUpdate() {
    $endTime = date("y-m-d H:i:s",  strtotime("2012-10-31"));
    $status = Status::getId("order", "accepted");
    $ret = $this->object->update(1, "updated desc", $endTime, $status, 1);
    $this->assertTrue($ret);
  }

  /**
   * @covers Order::getOrders
   * @todo Implement testGetOrders().
   */
  public function testGetOrders() {
    $ret = $this->object->getOrders(1);
    $this->assertNotEmpty($ret);
  }

}

?>
