<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/job.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";
    define('TPL_URL', 'job/job_detail.tpl');

    $job_id = $_REQUEST['job_id'] ? $_REQUEST['job_id'] : 200011;
    try_get_job_detail($job_id);

    function try_get_job_detail($job_id) {
        $res = get_job_detail_api($job_id);
        if($res['errCode'] != 0) json_exit($res);

        show_page($res[result]);
    }

    function show_page($job) {
        $smarty = new MySmarty();
        $smarty->assign('job_name', $job[job_name]);
        $smarty->assign('company_name', $job[company_name]);
        $smarty->assign('job_description', $job[job_description]);
        $smarty->assign('job_address', $job[job_address]);
        @$smarty->display(TPL_URL);
    }
?>