<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/job.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";

    require_login();

    $job_list = try_get_job_list(session_get('zipcode'));
    $user_list = try_get_top_user();
	

    show_page($job_list, $user_list );

    function try_get_job_list($zipcode) {
        $res = get_top_jobs_api($zipcode);
        if($res['errCode'] != 0) json_exit($res);

        return $res[result];
    }

    function try_get_top_user() {
        $res = get_top_user_api();
        if($res['errCode'] != 0) json_exit($res);

        return $res[result];
    }

    function show_page($job_list, $user_list ){
        $smarty = new MySmarty();
        $smarty->assign('job_list', $job_list);
        $smarty->assign('user_list', $user_list);
        @$smarty->display("job/hot_jobs.tpl");
    }
?>