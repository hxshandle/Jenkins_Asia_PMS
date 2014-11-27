<?PHP

require("init.php");

$jUtil = new JUtils();
$document = new Document();
$documentId = 1036;
$comment = new Comments();
$cms = $comment->getTaskComments(42);
$docInfo = $document->getDocumentInfo($documentId);
$str = $jUtil->getTaskCommentsMailMsg($cms);
echo $str;
 ?>
