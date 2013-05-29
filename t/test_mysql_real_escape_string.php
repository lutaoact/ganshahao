<?php
require_once "$_SERVER[DOCUMENT_ROOT]/db/DbAdapter.php";

$db = new DbAdapter();
$string = mysql_escape_string("'\\");
var_dump($db->runSql("insert into user(nick_name) values ('$string')"));

if (get_magic_quotes_gpc()) {
    print 'hhh';
}
?>
