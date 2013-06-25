<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/job.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";

    require_login();

    get_question_answer();

    function get_question_answer() {
        $question_id = $_POST[question_id];

        $res = get_question_answer_api($question_id);
        json_exit($res);
    }
?>