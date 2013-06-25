<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/job.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";

    require_login();

    try_save_score();

    function try_save_score() {
        $user_id = require_login();
        $job_id = $_POST[job_id];
        $score = $_POST[score];
        $params = array(
            user_id     => $user_id,
            job_id      => $job_id
        );

        $res = save_job_apply_api($params);
        json_exit($res);
    }
?>