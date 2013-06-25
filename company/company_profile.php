<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/company.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";
    define('COMPANY_PROFILE_TPL', 'company/company_profile.tpl');

    $company_id = session_get('company_id');
    if ($company_id) {
        $company = try_get_company_detail($company_id);
        $job_applications = try_get_job_applications($company_id);
        
        show_company_profile($company, $job_applications);
    } else {
        redirect('/company/login.php');
    }
    
    function try_get_company_detail($company_id) {
        $res = get_company_detail_api($company_id);
        if($res['errCode'] != 0) json_exit($res);

        return $res[result];
    }
    
    function try_get_job_applications($company_id) {
        $res = get_all_job_applications_api($company_id);
        if($res['errCode'] != 0) json_exit($res);
        
        return $res[result];
    }
    
    function show_company_profile($company, $job_applications) {
        $smarty = new MySmarty();
        $smarty->assign('company', $company);
        $smarty->assign('job_applications', $job_applications);
        @$smarty->display(COMPANY_PROFILE_TPL);
    }
?>