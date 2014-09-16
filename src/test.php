<?PHP

function startsWith($Haystack, $Needle) {
  // Recommended version, using strpos
  return strpos ( $Haystack, $Needle ) === 0;
}

function extractTaskIdFromEmailSubject($str){
  $tok = strtok ( $str, " \t\n" );
  $str_lines = array ();

  while ( $tok !== false ) {
    $l="$tok\n";
    array_push ($str_lines,$l);

    $tok = strtok ( " \t\n" );
  }

  $array_len = count ( $str_lines );
  for($x = 0; $x < $array_len; $x ++) {
    $line = $str_lines [$x];
    if (startsWith ( $line, "[JTiD-" )) {
      echo "task id-->$line";
      return $line;
    }

  }

  return NIL;

}

  $mailTitle = "This is\tan example\nstring\t[JTiD-698]";
  //echo "$mailTitle";
  $taskId = extractTaskIdFromEmailSubject($mailTitle);
  $regex = "/\d+/";
  $m = array();
  preg_match($regex,$taskId,$m);
  var_dump($m);
  $tid = str_replace("[JTiD-","",$taskId);
  if(count($m) > 0){
    echo "BBBBBBBBBB ".$m[0];
  }
  echo "DONE.."

 ?>
