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

        return strcasecmp($a, $b) * -1;
    }

    public function testSort()
    {
        $arr = [
            "1",
            "0",
            "2",
            "A",
            "C",
            "B"
        ];
        usort($arr, array($this, 'compareDocumentNo'));
        var_dump($arr);
        ob_flush();
        echo "test ";
    }
}
