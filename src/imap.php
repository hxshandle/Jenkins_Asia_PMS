<?php
//$mbox = imap_open("{imap.mail.yahoo.com}", "janus@jenkins-asia.com", "830406jenny", OP_HALFOPEN)
$mbox = imap_open("{imap.mail.yahoo.com:993/imap/ssl}", "janus@jenkins-asia.com", "830406jenny")
or die("can't connect: " . imap_last_error());

$list = imap_getmailboxes($mbox, "{imap.mail.yahoo.com}", "*");
if (is_array($list)) {
  foreach ($list as $key => $val) {
    echo "($key) ";
    echo imap_utf7_decode($val->name) . ",";
    echo "'" . $val->delimiter . "',";
    echo $val->attributes . "<br />\n";
  }
} else {
  echo "imap_getmailboxes failed: " . imap_last_error() . "\n";
}

imap_close($mbox);
?>