<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/user.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";

    require_login();

    check_real_info();

    function check_real_info() {
        $user_id = get_user_id();

        $res = check_real_info_api($user_id);
        json_exit($res);
    }
?>