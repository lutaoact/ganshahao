<?php
require_once('db/DbAdapter.php');
require_once('lib/MySmarty.php'); 

$smarty = new MySmarty();
$smarty->assign('world', 'world');
$smarty->assign('name', 'gaochangyu');
$smarty->display('test.tpl');
?>
