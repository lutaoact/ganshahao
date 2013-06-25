<?php
require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";
require_once "$_SERVER[DOCUMENT_ROOT]/db/DbAdapter.php";
require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";

if ( !isset($_GET['user_id']) ) {
    echo "请提供user_id";
    exit;
}

if ( !is_numeric($_GET['user_id']) ) {
    echo "ERROR: user_id should be numberic";
    exit;
}

$user_id = $_GET['user_id'];

$smarty = new MySmarty();
$_db = new DbAdapter();

list($user, $mysql_err_no, $mysql_err_msg) = $_db->select_user_by_id($user_id);
validate_db_error($mysql_err_no, $mysql_err_msg, $res);
if ($res[errCode]) json_exit($res);

$user['available_time'] = json_decode($user['available_time']);
$smarty->assign('user', $user);
$smarty->display('user/info.tpl');
?>
