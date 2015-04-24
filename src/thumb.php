<?php
/**
 * Created by PhpStorm.
 * User: i073349
 * Date: 4/16/15
 * Time: 11:02 AM
 */

define('CL_ROOT', realpath(dirname(__FILE__) . DIRECTORY_SEPARATOR));
include(CL_ROOT . "/include/ImageResize.php");
use \Eventviva\ImageResize;

function strip_only_tags($str, $tags, $stripContent=false) {
  $content = '';
  if(!is_array($tags)) {
    $tags = (strpos($str, '>') !== false ? explode('>', str_replace('<', '', $tags)) : array($tags));
    if(end($tags) == '') array_pop($tags);
  }
  foreach($tags as $tag) {
    if ($stripContent)
      $content = '(.+</'.$tag.'(>|\s[^>]*>)|)';
    $str = preg_replace('#</?'.$tag.'(>|\s[^>]*>)'.$content.'#is', '', $str);
  }
  return $str;
}
function getArrayVal(array $array, $name)
{
  if (array_key_exists($name, $array))
  {
    return strip_only_tags($array[$name], "script");
  }
}


$pic = getArrayVal($_GET,"pic");
$height = getArrayVal($_GET,"height");
$width = getArrayVal($_GET,"width");


$image = new ImageResize($pic);
$image->resizeToWidth($width);
$image->output();