<?php
/**
 * Created by PhpStorm.
 * User: Handle
 * Date: 2018/8/17
 * Time: 16:55
 */

class PerformanceTime
{

    private $tags = [];

    function get_microtime()
    {
//        list($usec, $sec) = explode(' ', microtime());
//        return ((float)$usec + (float)$sec);
        return microtime(true);
    }

    public function start($tag = 'default')
    {
        $this->tags[$tag] = ["start" => $this->get_microtime()];
    }

    public function end($tag = 'default')
    {
        $this->tags[$tag]['end'] = $this->get_microtime();
        error_log($tag . ' 执行时间  --> ' . $this->spent($tag));
    }

    public function spent($name = 'default')
    {
        $arr = $this->tags[$name];
        $start = $arr['start'];
        $end = $arr['end'];
        $due = $end - $start;
        return number_format($due, 10, '.', '')." seconds";
//        return round(($end - $start) * 1000, 2) . '秒';
    }
}