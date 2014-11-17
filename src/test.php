<?PHP

require("init.php");

$jUtil = new JUtils();
$taskComment = new Comments();
$tComments = $taskComment->getTaskComments(796);
$str = $jUtil->getModifiedTaskMailMsg("AAAAAAAAAA","ceshi","update","ccccc","bbbbbbbbbbbbbbb","this is a text....",$tComments);

$mail2 = $jUtil->getDelayedTaskMailMsg("aaa","bbb","ccc","dddd",$tComments);
echo $str;
 ?>
