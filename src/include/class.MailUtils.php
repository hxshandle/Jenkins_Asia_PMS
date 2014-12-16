<?php

class MailUtils{

  private $jUtil;
  function __construct(){
    $this->jUtil = new JUtils();
  }

  function _getECNMailMsg($ecnId,$userName,$ecnBaseInfo){
    if(empty($ecnBaseInfo['submitter_comments'])){
      $ecnBaseInfo['submitter_comments'] = "N/A";
    }
    if(empty($ecnBaseInfo['recommand_action'])){
      $ecnBaseInfo['recommand_action'] = "N/A";
    }
    $msg = "";
    $msg .= "Dear ".$userName.", <br/><br/>";
    $msg .= "  New ECN was created by ".$_SESSION['username']."<br/>";
    $msg .="<dl style='padding-left:10px'>";
    $msg .="<dt>ECN Number</dt>";
    $msg .="<dd>".$ecnBaseInfo['name']."</dd>";
    $msg .="<dt>ECN Reason</dt>";
    $msg .="<dd>".$ecnBaseInfo['submitter_comments']."</dd>";
    $msg .="<dt>Recommend Action</dt>";
    $msg .="<dd>".$ecnBaseInfo['recommand_action']."</dd>";
    $msg .="</dl>";
    $msg .="  More details please click <a href='http://janus.jenkins-asia.com//manageecn.php?action=viewUploadFile&id=".$ecnId."'>here</a>";
    $msg .="<br/>";
    $msg .= "Please login to Janus first before clicking on the link.<br/>";
    return $msg;
  }

  function sendECNMail($ecnId,$ecnBaseInfo,$userList){
    $subject = "New ECN created";
    $user = new user();
    foreach ($userList as $userId) {
      $userProf = $user->getProfile($userId);
      $msg = $this->_getECNMailMsg($ecnId,$userProf['name'],$ecnBaseInfo);
      $this->jUtil->sendMail($userProf['email'],$subject,$msg);
    }
  }
}

?>