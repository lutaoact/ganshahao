<?php
require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";
require_once "$_SERVER[DOCUMENT_ROOT]/db/DbAdapter.php";
require_once "$_SERVER[DOCUMENT_ROOT]/lib/constants.php";
require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";

//$user_id = require_login();
$user_id = 1;
$_db = new DbAdapter();
$field_name = $_REQUEST[field_name];
$field_value = $_REQUEST[field_value];

if (isset($field_name) && isset($field_value)) {
    switch($field_name) {
        case "user_nick_name":
            update_user(array(nick_name => $field_value));
            break;
        case "user_real_name":
            update_user(array(real_name => $field_value));
            break;
        case "user_mobile":
            update_user(array(mobile => $field_value));
            break;
        case "user_zipcode":
            update_user(array(zipcode => $field_value));
            break;
        case "user_is_veteran":
            update_user(array(is_veteran => $field_value));
            break;
        case "user_description":
            update_user(array(description => $field_value));
            break;
        case "user_available_time":
            update_user(array(available_time => $field_value));
            break;
        default:
            break;
    }
} else {
    list($user, $mysql_err_no, $mysql_err_msg) = $_db->select_user_by_id($user_id);
    $user[available_time] = json_decode($user[available_time]);
    var_dump($user[available_time]);
    $smarty = new MySmarty();
    $smarty->assign('user', $user);
    $smarty->display('user/settings.tpl');
}

function update_user($params) {
    global $user_id;
    global $_db;
    $res = array(result => "", errCode => 0, errMsg => "");

    $user_email = $_REQUEST[user_email];
    list($user_info, $mysql_err_no, $mysql_err_msg) = $_db->select_user_by_id($user_id);
    validate_db_error($mysql_err_no, $mysql_err_msg, $res);
    if ($res[errCode]) json_exit($res);

    if ($user_info[email] != $user_email) {
        $res[errCode] = ERR_CHANGE_EMAIL;
        $res[errMsg]  = '不能修改邮箱';
        json_exit($res);
    }

    list($affected_rows, $mysql_err_no, $mysql_err_msg) = $_db->update_user($user_id, $params);
    validate_db_error($mysql_err_no, $mysql_err_msg, $res);
    if ($res[errCode]) json_exit($res);

    echo json_encode($res);
}
#    var_dump($_POST);
#    $user = array(
#        id          => $_POST[user_id         ],
#        nick_name   => $_POST[user_nick_name  ],
#        email       => $_POST[user_email      ],
#        real_name   => $_POST[user_real_name  ],
#        mobile      => $_POST[user_mobile     ],
#        description => $_POST[user_description],
#        zipcode     => $_POST[user_zipcode    ],
#        is_veteran  => $_POST[user_is_veteran ],
#    );
#    $res = array(result => array($_POST[field_name] => $_POST[field_value]), errCode => 0, errMsg => '');
#    echo json_encode($res);
#$user = array(
#    morning     => array(1, 0, 1, 0, 1, 0, 1),
#    afternoon   => array(1, 0, 1, 0, 1, 0, 1),
#    evening     => array(1, 0, 1, 0, 1, 0, 1),
#    night       => array(1, 0, 1, 0, 1, 0, 1),
#);
#$user_string =  json_encode($user);
#$user_obj = json_decode($user_string);
#var_dump($user_obj);
?>
