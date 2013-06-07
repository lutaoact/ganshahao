<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/job.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";
    define('JOB_DETAIL_TPL', 'job/job_detail.tpl');
    define('JOB_TRAINING_TPL', 'job/job_training.tpl');

    $job_id = $_REQUEST['job_id'];
    $training_number = $_POST['training_number'] ? $_POST['training_number'] : 0;
    if($_POST['training']) {
        try_get_job_trainings($job_id, $training_number);
    } else {
        try_get_job_detail($job_id);
    }

    function try_get_job_detail($job_id) {
        $res = get_job_detail_api($job_id);
        if($res['errCode'] != 0) json_exit($res);

        show_detail_page($res[result]);
    }

    function try_get_job_trainings($job_id, $training_number) {
        $res = get_job_trainings_api($job_id, $training_number++);
        if($res['errCode'] != 0) json_exit($res);

        show_training_page($res[result], $training_number);
    }

    function show_detail_page($job) {
        $smarty = new MySmarty();
        $smarty->assign('job_id', $job[job_id]);
        $smarty->assign('job_name', $job[job_name]);
        $smarty->assign('company_name', $job[company_name]);
        $smarty->assign('job_description', $job[job_description]);
        $smarty->assign('job_address', $job[job_address]);
        @$smarty->display(JOB_DETAIL_TPL);
    }

    function show_training_page($training, $training_number) {
        if($training != null) {
            $res = get_training_questions_api($training[id]);
            if($res['errCode'] != 0) json_exit($res);
            if($res[result] == null) json_exit($res);
            $question_list = $res[result];
            foreach($question_list as &$question) {
                $question[choices] = json_decode($question[choices]);
            }
        }

        $smarty = new MySmarty();
        $smarty->assign('training', $training);
        $smarty->assign('training_number', $training_number);
        $smarty->assign('question_list', $question_list);
        @$smarty->display(JOB_TRAINING_TPL);
    }
?>