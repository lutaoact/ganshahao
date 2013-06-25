<?php
require_once "$_SERVER[DOCUMENT_ROOT]/lib/user.php";
require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";

$user_id = require_login();
$_db = new DbAdapter();

if (isset($_REQUEST[current_password])
    && isset($_REQUEST[new_password])
    && isset($_REQUEST[new_password2])
) {
    change_password();
} else {
    var_dump($user_id);
    show_change_password_page();
}

function change_password() {
    global $user_id;
    global $_db;

    $current_password = trim($_REQUEST[current_password]);
    $new_password = trim($_REQUEST[new_password]);
    $new_password2 = trim($_REQUEST[new_password2]);

    $res = array(result => '', errCode => 0, errMsg => '');

    if (strlen($current_password) == 0
        || strlen($new_password) == 0
        || strlen($new_password2) == 0
    ) {
        $res[errCode] = ERR_PASSWORD_IS_NULL;
        $res[errMsg]  = '任何一个密码都不得为空';
        json_exit($res);
    }

    if ($new_password != $new_password2) {
        $res[errCode] = ERR_TWO_NEW_PASSWORD_DO_NOT_MATCH;
        $res[errMsg]  = '两次输入的新密码不相同';
        json_exit($res);
    }

    list($user_info, $mysql_err_no, $mysql_err_msg) = $_db->select_user_by_id($user_id);
    validate_db_error($mysql_err_no, $mysql_err_msg, $res);
    if ($res[errCode]) json_exit($res);

    if ($user_info[password] != $current_password) {
        $res[errCode] = ERR_PASSWORD;
        $res[errMsg]  = '旧密码错误';
        json_exit($res);
    }

    list($affected_rows, $mysql_err_no, $mysql_err_msg) = $_db->update_user($user_id, array(password => $new_password));
    validate_db_error($mysql_err_no, $mysql_err_msg, $res);
    if ($res[errCode]) json_exit($res);

    echo json_encode($res);
}

function show_change_password_page() {
    $smarty = new MySmarty();
    @$smarty->display("user/change_password.tpl");
}
?>
