<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/user.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";

    if($_POST['submit']) {
        try_to_login();
    }

    if(is_login()) {
        $jumpto = get_jumpto();
        redirect($jumpto);
    }

    show_login_page();

    function get_jumpto(){
        $jumpto = $_REQUEST['jumpto'];
        if($jumpto) return $jumpto;

        /*
        * TO DO
        * go to home
        */
        return "/home.php";
    }

    function try_to_login(){
        $user_email    = $_POST['user_email'];
        $user_password = $_POST['user_password'];

        $res = user_login_api($user_email, $user_password);
        if($res['errCode'] != 0) {
            $res[user_email] = $user_email;
            json_exit($res);
        }

        $user_id = $res[result][user_id];
        init_login_session( $user_id );
        json_exit($res);
    }

    function init_login_session( $user_id ){
        set_session_cookie($user_id);
    }

    function show_login_page(){
        $smarty = new MySmarty();
        $jumpto = get_jumpto();
        $smarty->assign( 'jumpto', $jumpto);
        $smarty->assign('show_part', $show_part);
        @$smarty->display("user/login.tpl");
    }
?>