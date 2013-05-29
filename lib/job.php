<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/db/DbAdapter.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/formvalidator.php";

    $_db = new DbAdapter();

    function get_job_list_by_zipcode_api($zipcode) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        validate_zipcode($zipcode, $res);
        if ($res[errCode]) return $res;

        list($job_list, $mysql_err_no, $mysql_err_msg) = $_db->select_job_list_by_zip_code($zipcode);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        $res[result] = $job_list;
        return $res;
    }

?>