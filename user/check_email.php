<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/user.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";

    require_login();

    check_email();

    function check_email() {
        $user_email = $_POST[user_email];

        $res = check_email_api($user_email, $user_password, $user_password2);
        json_exit($res);
    }
?>