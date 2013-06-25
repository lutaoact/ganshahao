<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/job.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";

    require_login();

    try_save_score();

    function try_save_score() {
        $user_id = require_login();
        $training_id = $_POST[training_id];
        $score = $_POST[score];
        $params = array(
            user_id     => $user_id,
            training_id => $training_id,
            score       => $score
        );

        $res = set_training_score_api($params);
        json_exit($res);
    }
?>