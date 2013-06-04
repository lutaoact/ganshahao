<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/db/DbAdapter.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/formvalidator.php";

    $_db = new DbAdapter();

    function get_company_detail_api($company_id) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        list($company_detail, $mysql_err_no, $mysql_err_msg) = $_db->select_company_by_id($company_id);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        $res[result] = $company_detail;
        return $res;
    }

    function get_job_list_by_company_id_api($company_id) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        list($job_list, $mysql_err_no, $mysql_err_msg) = $_db->select_job_list_by_company_id($company_id);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        $res[result] = $job_list;
        return $res;
    }

?>