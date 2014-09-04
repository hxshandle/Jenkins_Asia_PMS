<?PHP
require("init.php");
require_once CL_ROOT . "/include/Imap.php";
require_once CL_ROOT . "/include/html2text.php";
require_once CL_ROOT . "/include/CommentExtractor.php";

$mailbox = 'imap.mail.yahoo.com:993';
$username = 'handle.huang@yahoo.com';
$password = 'Iamallgood';
$encryption = 'ssl'; // or ssl or ''

//$username = $settings["mailuser"];
//$password = $settings["mailpass"];

$srcFolder = "UnReadTasks";
$moveToFolder = "ReadTasks";

// ===================================
// connect to mail server
// ===================================
// open connection
$imap = new Imap ( $mailbox, $username, $password, $encryption );

// stop on error
if ($imap->isConnected () === false)
	die ( $imap->getError () );
	
	// =========================================================
	// do validaiton of folder
	// ========================================================

if (! $imap->haveFolder ( $srcFolder )) {
	die ( "folder '$srcFolder' is not exiting in mail" );
}

if (! $imap->haveFolder ( $moveToFolder )) {
	die ( "folder '$moveToFolder' is not exiting in mail" );
}

// ===============================
// select folder Inbox
// ==============================
$imap->selectFolder ( $srcFolder );

// =======================================
// fetch all messages in the current folder
// =======================================
$emails = $imap->getMessages ();
// start loop 1
foreach ( $emails as $message ) {
	$email_body = $message ['body'];
	$email_from = $message ['from'] ['email'];
	$email_uid = $message ['uid'];
	$email_subject = $message ['subject'];
	$email_date = $message ['date'];
	
	$taskId = extractTaskIdFromEmailSubject ( $email_subject );
	if ($taskId != NIL) {
		continue;
	}
	
	$plainEmailBody = $email_body;
	if ($message ['html']) {
		$plainEmailBody = convert_html_to_text ( $email_body );
	}
	$comment = extractCommmentFromTextEmailBody ( $plainEmailBody );
	
	echo ">>>>>>>>>>>>>>>>eamil header>>>>>>>>>>>>\n";
	print $taskId . "\n";
	print $email_from . "\n";
	print $email_uid . "\n";
	print $email_subject . "\n";
	print $email_date . "\n";
  print "<hr/>";
  print $comment;
	
	echo ">>>>>>>>>>>>>>>>eamil end>>>>>>>>>>>>\n";
	
	// ===============================
	// insert DB
	// ==============================
	
	// move to another folder
	$imap->moveMessage ( $message ['uid'], $moveToFolder );
}//end loop 1

