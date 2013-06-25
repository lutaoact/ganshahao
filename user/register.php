<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/user.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";

    if(isset($_POST['submit'])) {
        try_to_register();
    }

    show_register_page();

    function try_to_register() {
        $user_email = $_POST['user_email'];
        $user_password = $_POST['user_password'];
        $user_password2 = $_POST['user_password2'];

        $res = user_register_api($user_email, $user_password, $user_password2);
        if($res['errCode'] != 0) {
            $res[user_email] = $user_email;
            json_exit($res);
        }

        $user_id = $res[result][user_id];
        init_register_session( $user_id );
        json_exit($res);
    }

    function init_register_session( $user_id ) {
        set_session_cookie($user_id);
    }

    function show_register_page() {
        $smarty = new MySmarty();
        @$smarty->display("user/register.tpl");
    }

?>