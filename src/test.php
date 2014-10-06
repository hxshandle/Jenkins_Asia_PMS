<?PHP

require("init.php");

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

echo getSavedFileName("abc")."<br/>";
echo getSavedFileName("abc.xls")."<br/>";
echo getSavedFileName("你好.xls")."<br/>";
echo getSavedFileName("abc.abc.xls")."<br/>";

 ?>
