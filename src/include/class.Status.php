<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Status
 *
 * @author huanghandle
 */
class Status {

  //put your code here
  private $myLog;
  private static $ARR_STATUS = array();
  public static $ALL_STATUS=array();

  function __construct() {
    $this->myLog = new mylog;
  }
  
  static public function getId($type,$value){
    if(empty(self::$ARR_STATUS)){
      self::load();
    }
    $id = FALSE;
    if(!empty(self::$ARR_STATUS["$type"])){
      $arr = self::$ARR_STATUS["$type"];
      foreach ($arr as $status) {
        if($status["value"] == $value){
          $id = $status["id"];
          break;
        }
      }
    }
    return $id;
  }
  
  static public function getStatusByType($type){
    if(empty(self::$ARR_STATUS)){
      self::load();
    }
    if(empty(self::$ARR_STATUS["$type"])){
      return array();
    }else{
      return self::$ARR_STATUS["$type"];
    }
  }


  static public function load(){
    self::$ARR_STATUS = array();
    $result = mysql_query("select * from status");
    while($arr = mysql_fetch_array($result)){
      $id= $arr['ID'];
      $type = $arr['type'];
      $value = $arr['value'];
      self::$ALL_STATUS["".$id] = $value;
      if(empty(self::$ARR_STATUS["$type"])){
        self::$ARR_STATUS["$type"] = array();
      }
      $arrType = self::$ARR_STATUS["$type"];
      array_push($arrType, array('id'=>$id,'value'=>$value));
      self::$ARR_STATUS["$type"]=$arrType;
    }
    return TRUE;
  }

  function add($type, $value) {
    $type = mysql_real_escape_string($type);
    $value = mysql_real_escape_string($value);

    $ins = mysql_query("insert into status (type,value) values ('$type','$value')");
    if ($ins) {
      $insid = mysql_insert_id();
      return $insid;
    } else {
      return FALSE;
    }
  }

  function update($id,$type,$value) {
    $id = (int) $id;
    $type = mysql_real_escape_string($type);
    $value = mysql_real_escape_string($value);
    
    $upd = mysql_query("update status set `type`='$type' `value`='$value' where ID=$id");
    if($upd){
      return TRUE;
    }else{
      return FALSE;
    }
  }

  function del($id) {
    $id = (int) $id;
    $del = mysql_query("delete from status where ID = $id");
    if($del){
      return TRUE;
    }else{
      return FALSE;
    }
  }

}

?>
