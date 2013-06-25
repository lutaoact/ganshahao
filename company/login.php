<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/company.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";

    if($_POST['submit']) {
        try_to_login();
    }

    show_login_page();

    function try_to_login(){
        $company_account    = $_POST['company_account'];
        $company_password = $_POST['company_password'];

        $res = company_login_api($company_account, $company_password);
        if($res['errCode'] != 0) {
            $res[company_account] = $company_account;
            json_exit($res);
        }

        $company_id = $res[result][company_id];
        init_login_session( $company_id );
        json_exit($res);
    }

    function init_login_session( $company_id ){
        set_company_session_cookie($company_id);
    }

    function show_login_page(){
        $smarty = new MySmarty();
        $smarty->assign('show_part', $show_part);
        @$smarty->display("company/login.tpl");
    }
?>
