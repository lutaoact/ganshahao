<?php
    include_once '../db/DbAdapter.php';

    $_db = new DbAdapter();

    function user_login_api($email, $password) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        // validate email format
        validate_login_email_format($email, $res);
        if ($res[errCode]) return $res;

        // get user info in db
        list($user_info, $mysql_err_no, $mysql_err_msg) = $_db->select_user_by_email($email);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        // check password
        if (!$user_info || $user_info['password'] != $password) {
            $res[errCode] = ERR_EMAIL_OR_PASSWORD_IS_WRONG;
            $res[errMsg]  = localized_string('ÓÊÏä»òÃÜÂë´íÎó');
            return $res;
        }

        // success
        $res[result] = array(
            'user_id'   => $user_info['user_id'],
            'message'   => localized_string('»¶Ó­Äú£¬') . $user_info['user_name'] . localized_string('£¬µÇÂ¼³É¹¦£¡')
        );
        return $res;
    }
?>