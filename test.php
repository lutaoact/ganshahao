<?php
require_once("$_SERVER[DOCUMENT_ROOT]/db/DbAdapter.php");
require_once("$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php");

echo "this is test.php";
#$my_list = array(
#    1, 0, 1, 0, 1, 0, 1,
#    0, 1, 0, 1, 0, 1, 0,
#    1, 1, 1, 0, 0, 0, 0,
#    0, 0, 0, 0, 1, 1, 1,
#);
#$string =  json_encode($my_list);
#echo $string;
#$db = new DbAdapter();
#$string = $db->escape($string);
#var_dump ($db->runSql("update user set available_time = '{$string}'"));

#foreach ($my_list as &$item) {
#    $item[key1] = 15;
#    $item[key2] = 20;
#}
#var_dump($my_list);
// show_source('dbtest.php');

/*
$smarty = new MySmarty();
$smarty->assign('world', '<p世界></p>');
$smarty->assign('world2', htmlspecialchars('<p世界></p>'));
$smarty->assign('name', '高常宇');

$smarty->display('test.tpl');

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
