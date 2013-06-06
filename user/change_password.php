<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/user.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";

    $user_id = require_login();

    if (isset($_REQUEST[current_password])
        && isset($_REQUEST[new_password])
        && isset($_REQUEST[new_password2])
    ) {
        change_password();
    } else {
        show_change_password_page();
    }

    function change_password() {
        $current_password = $_REQUEST[current_password];
        $new_password = $_REQUEST[new_password];
        $new_password2 = $_REQUEST[new_password2];

        $res = array(result => '', errCode => 0, errMsg => '');
        echo json_encode($res);
    }

    function show_change_password_page() {
        $smarty = new MySmarty();
        @$smarty->display("user/change_password.tpl");
    }
?>
