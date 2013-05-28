<?php
    include_once '../db/DbAdapter.php';

    $_db = new DbAdapter();

    function user_login($user_email, $user_password) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        // validate login_email format
        validate_login_email_format($login_email, $res);
        if ($res[errCode]) return $res;

        // get user info in db
        $sql_res = $_db->select_user_by_email($login_email);
        if($sql_res
    }
?>