<?PHP

require("init.php");

$file = "F:\\WPF_Sample\\ImageProcessingWPF4.zip";
$fz = filesize($file);

$jUtil = new JUtils();
$jUtil->sendMail("handle.huang@outlook.com","test file ","bbbbbbbbb",null,$file);
echo $fz;

 ?>
