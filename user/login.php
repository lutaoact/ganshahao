<?php
    //ini_set('include_path', $_SERVER[DOCUMENT_ROOT] . PATH_SEPARATOR . ini_get('include_path'));

    require_once("../lib/user.php");
    require_once("../lib/common.php");
    require_once("../lib/MySmarty.php");

    # try to login
    if($_POST['submit']) {
        try_to_login();
    }

    # if logined, then redirect to content list page
    if(is_login()) {
        $jumpto = get_jumpto();
        redirect($jumpto);
    }

    # show login page
    show_login_page();

    function get_jumpto(){
        $jumpto = $_REQUEST['jumpto'];
        if($jumpto) return $jumpto;

        /*
        * TO DO
        * go to home
        */
        return 'www.baidu.com';
    }

    function try_to_login(){
        $login_email    = $_POST['login_email'];
        $login_password = $_POST['password'];

        $res            = user_login_api($login_email, $login_password);
        if($res['errCode'] != 0) json_exit($res);

        # login success ,then set the session
        $user_id = $res[result][user_id];
        init_login_session( $user_id );
        json_exit($res);
    }

    function init_login_session( $user_id ){
        set_session_cookie($user_id);
    }

    function show_login_page(){
        $smarty = new MySmarty();
        if($_REQUEST['mode'] == 'logout') {
            $smarty->assign('message', '您已成功退出登录！');
        }
		$show_part = 'login_part';
		if(isset($_GET['inviter']) && is_numeric($_GET['inviter'])){
			$show_part = 'verify_user_part';
			$smarty->assign('inviter', $_GET['inviter']);
		}
        $jumpto = get_jumpto();
        $smarty->assign( 'jumpto', $jumpto);
        $smarty->assign('show_part', $show_part);
        @$smarty->display("user/login.tpl");
    }
?>