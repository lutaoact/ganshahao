<?php
require_once("$_SERVER[DOCUMENT_ROOT]/db/DbAdapter.php");
require_once("$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php");

$smarty = new MySmarty();
$smarty->assign('world', '<p世界></p>');
$smarty->assign('world2', htmlspecialchars('<p世界></p>'));
$smarty->assign('name', '高常宇');

$smarty->display('test.tpl');
/*
echo htmlspecialchars("<p>hhhhh<p>");
echo "<p>hhhhh<p>";
echo $_SERVER[DOCUMENT_ROOT];
function test() {}


$db = new DbAdapter();
$result = $db->select_user_by_email("a@b.com");
var_dump($result);
echo get_magic_quotes_gpc();
*/

?>
