<?php
/**
 * Created by PhpStorm.
 * User: Handle
 * Date: 2019/2/22
 * Time: 13:44
 */


class Test extends PHPUnit_Framework_TestCase
{
    private function compareDocumentNo($a, $b)
    {
        $a1 = explode('-', $a);
        $b1 = explode('-', $b);
        $aa = end($a1);
        $bb = end($b1);
        return strcmp($aa, $bb) * -1;
    }

    public function testSort()
    {
        $arr = [
            "JK0F-0000-QCP-0002",
            "JK0F-0000-QCP-0001",
            "JK0F-0000-QCP-0003",
            "JK0F-0000-QCP-0011",
            "JK0F-0000-QCP-0001-B",
            "JK0F-0000-QCP-0001-A"
        ];
        usort($arr, array($this, 'compareDocumentNo'));
        var_dump($arr);
        ob_flush();
        echo "test ";
    }
}
