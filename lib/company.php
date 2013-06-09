<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/db/DbAdapter.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/formvalidator.php";

    $_db = new DbAdapter();

    function company_login_api ($company_account, $company_password) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        list($company_info, $mysql_err_no, $mysql_err_msg) = $_db->select_company_by_account($company_account);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        if (!$company_info || $company_info['password'] != $company_password) {
            $res[errCode] = ERR_EMAIL_OR_PASSWORD_IS_WRONG;
            $res[errMsg]  = '账号或密码错误';
            return $res;
        }

        // success
        $res[result] = array(
            'company_id'   => $company_info['id'],
        );
        return $res;
    }

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

    function get_all_job_applications_api($company_id) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        list($application_list, $mysql_err_no, $mysql_err_msg) = $_db->select_job_applications_by_company_id($company_id);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        $res[result] = $application_list;
        return $res;
    }
?>