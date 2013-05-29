<?php
require_once("$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php");

$smarty = new MySmarty();
$smarty->assign('world', '<p世界></p>');
$smarty->assign('world2', htmlspecialchars('<p世界></p>'));
$smarty->assign('name', '高常宇');

$smarty->display('test.tpl');
?>
