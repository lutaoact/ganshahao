<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/db/DbAdapter.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/formvalidator.php";

    $_db = new DbAdapter();

    function get_job_list_by_zipcode_api($zipcode) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        validate_zipcode($zipcode, $res);
        if ($res[errCode]) return $res;

        list($company_list, $mysql_err_no, $mysql_err_msg) = $_db->select_company_list_by_zipcode($zipcode);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);

        for($i = 0; $i < count($company_list); $i++) {
            list($job_list, $mysql_err_no, $mysql_err_msg) =
                $_db->select_job_list_by_company_id_and_zipcode($company_list[$i][company_id], $zipcode);
            validate_db_error($mysql_err_no, $mysql_err_msg, $res);
            if ($res[errCode]) return $res;

            $company_list[$i][job_list] = $job_list;
        }

        $res[result] = $company_list;
        return $res;
    }

    function get_job_detail_api($job_id) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        list($job_detail, $mysql_err_no, $mysql_err_msg) = $_db->select_job_detail_by_job_id($job_id);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        $res[result] = $job_detail;
        return $res;
    }

    function get_job_trainings_api($job_id, $training_number) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        list($training, $mysql_err_no, $mysql_err_msg) = $_db->select_trainings_by_job_id($job_id, $training_number);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        $res[result] = $training;
        return $res;
    }

    function get_training_questions_api($training_id) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        list($question_list, $mysql_err_no, $mysql_err_msg) = $_db->select_questions_by_training_id($training_id);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        var_dump($res);
        $res[result] = $question_list;
        return $res;
    }
?>