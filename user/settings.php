<?php
require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";

$smarty = new MySmarty();
$user = array(
    id => 1989,
    nick_name => 'lutaoact',
    email => 'lutaoact@139.com',
    real_name => '路涛',
    mobile => 13800000000,
    description => '我还是很牛逼的，做网页杠杠的',
    zipcode => '200001',
);
$smarty->assign('user', $user);
$smarty->display('user/settings.tpl');
?>
