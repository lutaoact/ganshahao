<?php
require_once('../lib/MySmarty.php');

$smarty = new MySmarty();
$smarty->assign('world', '世界');
$smarty->assign('name', '高常宇');

$smarty->display('test.tpl');
?>