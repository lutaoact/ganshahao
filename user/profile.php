<?php
require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";
require_once "$_SERVER[DOCUMENT_ROOT]/db/DbAdapter.php";
require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";

if (isset($_GET['user_id'])) {
    $user_id = $_GET['user_id'];
} else {
    $user_id = require_login();
}
$_db = new DbAdapter();

$res = array('result' => "", 'errCode' => 0, 'errMsg' => "");

list($user, $mysql_err_no, $mysql_err_msg) = $_db->select_user_by_id($user_id);
validate_db_error($mysql_err_no, $mysql_err_msg, $res);
if ($res['errCode']) json_exit($res);

list($count_training_completed, $mysql_err_no, $mysql_err_msg)
    = $_db->count_training_completed_by_user_id($user_id);
validate_db_error($mysql_err_no, $mysql_err_msg, $res);
if ($res['errCode']) json_exit($res);

list($training_names, $mysql_err_no, $mysql_err_msg)
    = $_db->select_training_names_completed_by_user_id($user_id);
validate_db_error($mysql_err_no, $mysql_err_msg, $res);
if ($res['errCode']) json_exit($res);

#var_dump($training_names_completed);

$smarty = new MySmarty();
$smarty->assign('user', $user);
$smarty->assign('count_training_completed', $count_training_completed);
$smarty->assign('training_names', $training_names);
$smarty->display('user/profile.tpl');
?>
