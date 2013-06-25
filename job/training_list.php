<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/job.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";

    require_login();
	
	$job_id = $_REQUEST['job_id'];
	$training_list = try_get_training_list($job_id);
	
    show_page($training_list );

    function try_get_training_list($job_id) {
        $res = get_training_list_api($job_id);
        if($res['errCode'] != 0) json_exit($res);

        return $res[result];
    }

    function show_page($training_list ){
        $smarty = new MySmarty();
        $smarty->assign('training_list', $training_list);
        @$smarty->display("job/training_list.tpl");
    }
?>