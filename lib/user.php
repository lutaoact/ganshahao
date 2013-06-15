<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/db/DbAdapter.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/formvalidator.php";

    $_db = new DbAdapter();

    function user_login_api($user_email, $user_password) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        validate_login_email_format($user_email, $res);
        if ($res[errCode]) return $res;

        list($user_info, $mysql_err_no, $mysql_err_msg) = $_db->select_user_by_email($user_email);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        if (!$user_info || $user_info['password'] != $user_password) {
            $res[errCode] = ERR_EMAIL_OR_PASSWORD_IS_WRONG;
            $res[errMsg]  = '邮箱或密码错误';
            return $res;
        }

        // success
        $res[result] = array(
            'user_id'   => $user_info['id'],
        );
        return $res;
    }

    function user_register_api($user_email, $user_password, $user_password2) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        validate_login_email_format($user_email, $res);
        if ($res[errCode]) return $res;

        validate_same_password($user_password, $user_password2, $res);
        if ($res[errCode]) return $res;

        list($user_info, $mysql_err_no, $mysql_err_msg) = $_db->insert_user(
            array(
                email    => $user_email,
                password => $user_password
            )
        );
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        list($user_info, $mysql_err_no, $mysql_err_msg) = $_db->select_user_by_email($user_email);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        $res[result] = array(
            'user_id'   => $user_info['id'],
        );
        return $res;
    }

    function find_pwd_api($user_email) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        validate_login_email_format($user_email, $res);
        if ($res[errCode]) return $res;

        list($user_info, $mysql_err_no, $mysql_err_msg) = $_db->select_user_by_email($user_email);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        if (!$user_info) {
            $res[errCode] = ERR_EMAIL_NOT_EXIST;
            $res[errMsg] = '邮箱不存在';
        }
        
        $result = array(res => $res, password => $user_info['password']);
        return $result;
    }

    function check_email_api($user_email) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        list($user_info, $mysql_err_no, $mysql_err_msg) = $_db->select_user_by_email($user_email);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        if($user_info){
            $res[errCode] = ERR_EMAIL_EXIST;
            $res[errMsg] = '邮箱已经存在';
        }
        return $res;
    }

    function check_real_info_api($user_id) {
        global $_db;
        $res = array(result => false, errCode => 0, errMsg => "");

        list($user_info, $mysql_err_no, $mysql_err_msg) = $_db->select_user_by_id($user_id);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        if($user_info[real_name] && $user_info[mobile]) {
            //$res[result] = true;
        } else {
            $res[errCode] = ERR_WITHOUT_REAL_INFO;
            $res[errMsg] = '没有设置联系信息(姓名和电话)';
        }

        return $res;
    }

    function get_user_all_job_applications_api($user_id) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");

        list($application_list, $mysql_err_no, $mysql_err_msg) = $_db->select_job_applications_by_user_id($user_id);
        validate_db_error($mysql_err_no, $mysql_err_msg, $res);
        if ($res[errCode]) return $res;

        $res[result] = $application_list;
        return $res;
    }

    function user_settings_api($user_settings) {
        global $_db;
        $res = array(result => "", errCode => 0, errMsg => "");
        list($user_info, $mysql_err_no, $mysql_err_msg) = $_db->select_user_by_email($user_email);
    }
?>
