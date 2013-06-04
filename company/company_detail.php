<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/company.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";
    define('COMPANY_DETAIL_TPL', 'company/company_detail.tpl');

    $company_id = $_REQUEST['company_id'];
    $company = try_get_company_detail($company_id);
    $job_list = try_get_job_list_by_company_id($company_id);
    show_detail_page($company, $job_list);

    function try_get_company_detail($company_id) {
        $res = get_company_detail_api($company_id);
        if($res['errCode'] != 0) json_exit($res);

        return $res[result];
    }

    function try_get_job_list_by_company_id($company_id) {
        $res = get_job_list_by_company_id_api($company_id);
        if($res['errCode'] != 0) json_exit($res);

        return $res[result];
    }

    function show_detail_page($company, $job_list) {
        $smarty = new MySmarty();
        $smarty->assign('company', $company);
        $smarty->assign('job_list', $job_list);
        @$smarty->display(COMPANY_DETAIL_TPL);
    }
?>