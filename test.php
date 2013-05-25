<?php
require_once('db/DbAdapter.php');
require_once('lib/MySmarty.php'); 

$smarty = new MySmarty();
$smarty->assign('world', 'world');
$smarty->assign('name', '来火焰');
$smarty->display('test.tpl');
?>
