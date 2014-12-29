<?PHP

require("init.php");

$jUtil = new JUtils();
//$document = new Document();
//$documentId = 1036;
//$comment = new Comments();
//$cms = $comment->getTaskComments(42);
//$docInfo = $document->getDocumentInfo($documentId);
//$str = $jUtil->getTaskCommentsMailMsg($cms);
//echo $str;


//$testObj = array();
//$ECNImpact = new ECNImpacts();
//// for ecn_impact_process
//$row1 = array(
//  "process_number" => "proc_1",
//  "process_description" => "this is desc for proc_1",
//    "disposition_cost" => 100.20,
//  "remark_or_other" => " this is remark for proc_1"
//
//);
//
//$row2 = array(
//    "process_number" => "proc_2",
//    "process_description" => "this is desc for proc_2",
//    "disposition_cost" => 1.20,
//    "attachment" => array(14,15,16)
//);
//
////$processRecords = array($row1,$row2);
////$ret = $ECNImpact->addRecords("ecn_impact_process",1,$processRecords);
////echo $ret;
//
//// test get
//$impacts = $ECNImpact->getImpactsByECNId(1);
//echo $impacts;

// for ecn email
//$mailUtils = new MailUtils();
//$ecn = new EngineeringChangeNote();
//$obj = $ecn->get(28);
//$msg = $mailUtils->_getECNMailMsg($obj['ID'],'abc',$obj);
//echo $msg;


// for document email
$doc = new Document();
$d = $doc->getDocumentInfo(30);
$msg = $jUtil->getDocumentMailMsg($d,'abc');
echo $msg;
 ?>
