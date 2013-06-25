<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/job.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";

    //require_login();

    $zipcode = $_REQUEST['zipcode'] ? $_REQUEST['zipcode'] : 200011;

    session_set('zipcode', $zipcode);
    if($_REQUEST['search']) {
        try_get_job_list_div($zipcode);
    } else {
        try_get_job_list($zipcode);
    }

    function try_get_job_list($zipcode) {
        $res = get_job_list_by_zipcode_api($zipcode);
        if($res['errCode'] != 0) json_exit($res);

        show_page($res[result], "job/job_list.tpl");
    }

    function try_get_job_list_div($zipcode) {
        $res = get_job_list_by_zipcode_api($zipcode);
        if($res['errCode'] != 0) json_exit($res);

        show_page($res[result], "job/job_list_div.tpl");
    }

    function show_page($company_list, $tpl){
        $smarty = new MySmarty();
        $smarty->assign('company_list', $company_list);
        @$smarty->display($tpl);
    }
?>