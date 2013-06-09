<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/job.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";

    require_login();

    try_get_job_list(session_get('zipcode'));

    function try_get_job_list($zipcode) {
        $res = get_top_jobs_api($zipcode);
        if($res['errCode'] != 0) json_exit($res);

        show_page($res[result]);
    }

    function show_page($job_list){
        $smarty = new MySmarty();
        $smarty->assign('job_list', $job_list);
        @$smarty->display("job/hot_jobs.tpl");
    }
?>