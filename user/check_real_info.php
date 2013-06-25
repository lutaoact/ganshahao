<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/user.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/constants.php";

    //require_login();
    if (!get_user_id()) {
        json_exit(array(result=>'', errCode=>ERR_NOT_LOGIN, errMsg=>'你还没有登陆'));
    }

    check_real_info();

    function check_real_info() {
        $user_id = get_user_id();

        $res = check_real_info_api($user_id);
        json_exit($res);
    }
?>