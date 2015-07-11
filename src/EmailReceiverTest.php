<?PHP
set_time_limit(0);
require("init.php");
require_once CL_ROOT . "/include/Imap.php";
require_once CL_ROOT . "/include/html2text.php";
require_once CL_ROOT . "/include/CommentExtractor.php";

$LOG_PATH = CL_ROOT."/logs/emailReceiver.log";

define('LOG_PATH',CL_ROOT."/logs/emailReceiver.log");
$mailbox = 'imap.mail.yahoo.com:993';
$username = '***@yahoo.com';

echo LOG_PATH;

$password = '***';
$encryption = 'ssl'; // or ssl or ''

function erLog($msg){
  $date = date('d.m.Y h:i:s'); 
  $msg = $date." | ".$msg."\n";
  error_log($msg,3,LOG_PATH);
}

$username = $settings["mailuser"];
$password = $settings["mailpass"];

// $username = "handle.huang@yahoo.com";
// $password = "Iamallgood";

$srcFolder = "UnReadTasks";
$moveToFolder = "ReadTasks";

$jUtils = new JUtils();
$datei = new datei();
$task = new task;



function getSavedFileName($name){
  $randval = mt_rand(1, 99999);
  $nameArr = split('[\.]',$name);
  $ext = $nameArr[count($nameArr)-1];
  $preName = array_slice($nameArr,0,count($nameArr)-1);
  $preName = join('.',$preName);
  $subname = preg_replace("/[^-_0-9a-zA-Z]/", "_", $preName);
  $fname = $subname . "_" . $randval . "." . $ext;
  return $fname;
}


erLog('===========================');
erLog('EmailReceiverTest Start...');
erLog('Connect to Email Server use '.$username);

// ===================================
// connect to mail server
// ===================================
// open connection
$imap = new Imap ($mailbox, $username, $password, $encryption);
// stop on error
if ($imap->isConnected() === false){
  echo "can not connect mail";
  erLog('can not connect mail');
  erLog('EmailReceiver stopped');
  die ($imap->getError());
}
erLog('Email server connect success.');

// =========================================================
// do validaiton of folder
// ========================================================

if (!$imap->haveFolder($srcFolder)) {
  erLog("folder '$srcFolder' is not exiting in mail");
  die ("folder '$srcFolder' is not exiting in mail");
}

if (!$imap->haveFolder($moveToFolder)) {
  erLog("folder '$moveToFolder' is not exiting in mail");
  die ("folder '$moveToFolder' is not exiting in mail");
}

// ===============================
// select folder Inbox
// ==============================
$imap->selectFolder($srcFolder);
erLog("selectFolder success");
// =======================================
// fetch all messages in the current folder
// =======================================
$emails = $imap->getMessages();
erLog("Get messages " .count($emails) );
$taskComments = new Comments();
$user = new user();

// start loop 1
foreach ($emails as $message) {

  $email_body = $message ['body'];
  $email_from = $message ['from'] ['email'];
  $email_uid = $message ['uid'];
  $email_subject = $message ['subject'];
  $email_date = $message ['date'];
  erLog('Process email '.$email_subject);
  $taskId = extractTaskIdFromEmailSubject($email_subject);
  if ($taskId == NIL) {
    erLog("remove mail (email_uid ".$email_uid.") since not find taskId in subject ".$email_subject);
    $imap->moveMessage ( $message ['uid'], $moveToFolder );
    continue;
  }

  $plainEmailBody = $email_body;
  if ($message ['html']) {
    $plainEmailBody = convert_html_to_text($email_body);
  }
  $comment = extractCommmentFromTextEmailBody($plainEmailBody);

  /*  echo ">>>>>>>>>>>>>>>>eamil header>>>>>>>>>>>>\n";
    print $taskId . "\n";
    print $email_from . "\n";
    print $email_uid . "\n";
    print $email_subject . "\n";
    print $email_date . "\n";
    print "<hr/>";
    print $comment;

    echo ">>>>>>>>>>>>>>>>eamil end>>>>>>>>>>>>\n";*/

  // ===============================
  // insert DB
  //get user info
  $userInfo = $user->getUserByEmail($email_from);
  if ($user) {
    $commentsId = $taskComments->insertMailComments($comment, $userInfo['ID'], $userInfo['name'], $taskId, $message ['uid']);
    print "<br/>comments ID -> " . $commentsId . "taskid -> " . $taskId;


    $attachements = $message["attachments"];
    // for attachements
    if ($attachements) {
      echo "has attachements\n";
      continue;
      $taskObj = $task->getTask($taskId);
      $projectId = $taskObj['project'];
      $path = "files/standard/" . $projectId . "/";
      while (list($key, $attachment) = each($attachements)) {

        $attachment = $imap->getAttachment($message['uid'], $key);
        if ($attachment) {
//        $enc = $jUtils->detechStringEncoding($attachment["name"]);
//        $newFN = iconv("gb2312", 'UTF-8//IGNORE', $attachment["name"]);
          $newFN = iconv("GB2312", "UTF-8", $attachment["name"]);
          $fileName = getSavedFileName($attachment["name"]);
          $dateStr = $path . $fileName;
          $fname = CL_ROOT . "/" . $dateStr;
          echo $fname;
          $f = fopen($fname, 'wb');
          if ($f) {
            echo "write file -> " . $fname . "\r\n";
            fwrite($f, $attachment["content"]);
            fclose($f);
            $fileId = $datei->add_file($attachment['name'], "uploaded by email", $projectId, 0, '', $dateStr, 'application/octet-stream', '', 0, '', $userInfo['ID']);
            if($fileId){
              $task->addAttachment($taskId,$fileId);
            }
            echo "<br/> attachment - > " . $attachment['name']." file id -> ".$fileId;
          }
        }
      }
    }
  }

  // ==============================

  // move to another folder
  //$imap->moveMessage ( $message ['uid'], $moveToFolder );
}//end loop 1

