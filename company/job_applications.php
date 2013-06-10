<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/company.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";

    $company_id = session_get('company_id');

    if($company_id) {
        try_get_company_detail($company_id);
    } else {
        redirect('/company/login.php');
    }

    function try_get_company_detail($company_id) {
        $res = get_all_job_applications_api($company_id);
        if($res['errCode'] != 0) json_exit($res);

        show_page($res[result]);
    }

    function show_page($apply_list) {
        $smarty = new MySmarty();
        $smarty->assign('apply_list', $apply_list);
        @$smarty->display(COMPANY_DETAIL_TPL);
    }
?>
