<?php
require_once('db/DbAdapter.php');
require_once('lib/MySmarty.php');

echo $_SERVER[DOCUMENT_ROOT];
/*
$smarty = new MySmarty();
$smarty->assign('world', '世界');
$smarty->assign('name', '高常宇');

$smarty->display('test.tpl');
function test() {}


$db = new DbAdapter();
$result = $db->select_user_by_email("a@b.com");
var_dump($result);
echo get_magic_quotes_gpc();
*/

?>
