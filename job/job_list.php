<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/job.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";

    try_get_job_list();

    function try_get_job_list() {
        $zipcode = $_REQUEST['zipcode'] ? $_REQUEST['zipcode'] : 200011;
        $res = get_job_list_by_zipcode_api($zipcode);
        if($res['errCode'] != 0) json_exit($res);

        show_page($res[result]);
    }

    function show_page($jobArray){
        $smarty = new MySmarty();
        $smarty->assign('jobArray', $jobArray);
        @$smarty->display("job/job_list.tpl");
    }
?>