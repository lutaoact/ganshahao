<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/constants.php";


    function logd( $msg ){
    }


    function validate_email($email) {
        return preg_match("/^[_\.0-9a-zA-Z-]+@([0-9a-zA-Z][0-9a-zA-Z-]*\.)+[a-zA-Z]{2,6}$/", $email);
    }

    function validate_minlen($input_value,$min_len) {
        $bret = true;
        if (isset($input_value) ) {
            $input_length = strlen($input_value);
            if ($input_length < $min_len) {
                $bret=false;
            }
        }
        return $bret;
    }

    function validate_maxlen($input_value,$max_len) {
        $bret = true;
        if (isset($input_value) ) {
            $input_length = strlen($input_value);
            if ($input_length > $max_len) {
                $bret=false;
            }
        }
        return $bret;
    }

    function validate_not_empty($input_value) {
        if( strlen($input_value) <=0 ) {
            return false;
        }
        return true;
    }

    function validate_base62( $param ){
        return preg_match("/^[0-9a-zA-Z]+$/", $param);
    }

    // functions for form validate
    function validate_login_email_format($login_email, &$res) {
        if (!validate_not_empty($login_email) || !validate_email($login_email)) {
            $res[errCode] = ERR_EMAIL_FORMAT_IS_WRONG;
            $res[errMsg]  = '邮箱格式不对';
        }
    }

    function validate_login_password($login_password, &$res) {
        if (!validate_not_empty($login_password)) {
            $res[errCode] = ERR_PASSWORD_IS_NULL;
            $res[errMsg]  = '登录密码不能为空';
        }
    }

    function validate_same_password($login_password, $login_password2, &$res) {
        if($login_password != $login_password2) {
            $res[errCode] = ERR_PASSWORD_IS_NOT_SAME;
            $res[errMsg]  = '两次密码不相等';
        }
    }
    function validate_lock_password($lock_password, &$res) {
        if (!validate_not_empty($lock_password)) {
            $res[errCode] = ERR_LOCK_PASSWORD_IS_NULL;
            $res[errMsg]  = '记事锁密码不能为空';
        }
    }

    function validate_user_name($user_name, &$res) {
        if (!validate_not_empty($user_name)) {
            $res[errCode] = ERR_USER_NAME_IS_NULL;
            $res[errMsg]  = '用户名不能为空';
        }
    }

    function validate_user_gender($gender, &$res) {
        if (!(isset($gender))) {
            $res[errCode] = ERR_USER_GENDER_IS_NULL;
            $res[errMsg]  = '性别不能为空';
        }
        if(!(is_numeric($gender) && ($gender == 1 || $gender == 0))) {
            $res[errCode] = ERR_USER_GENDER_IS_WRONG;
            $res[errMsg]  = 'gender format is wrong';
        }
    }

    function validate_last_fetch_time($last_fetch_time, &$res) {
        if (!(isset($last_fetch_time)  && is_numeric($last_fetch_time))) {
            $res[errCode] = ERR_PARAMETER_ERROR;
            $res[errMsg]  = 'last_fetch_time format is wrong';
        }
    }

    function validate_sync_key($sync_key, &$res) {
        if( strlen($sync_key) < 1) return;
        if (!validate_base62($sync_key)) {
            $res[errCode] = ERR_TOKEN_FORMAT_IS_WRONG;
            $res[errMsg]  = 'last_sync_key format is wrong';
        }
    }

    function validate_user_token($user_id, $token, &$res = null) {
        if( is_null($res) ){
            $res  = array(result => "", errCode => 0, errMsg => "");
        }

        // check user_id & token's format
        if( !is_numeric($user_id) || !validate_base62($token) ) {
            $res[errCode] = ERR_USER_TOKEN_IS_WRONG;
            $res[errMsg]  = 'user_id or token is not right, please check it';
            return $res;
        }

        // check from db
        $db         = new Recollection();
        list($data, $mysql_err_no, $mysql_err_msg) = $db->select_user_by_id($user_id);
        validate_db_error( $mysql_err_no, $mysql_err_msg, $res);
        if( $res['errCode'] )return $res;

        if( $data === false || $data['token']!= $token){
            $res[errCode] = ERR_USER_TOKEN_IS_WRONG;
            $res[errMsg]  = 'user_id or token is not right, please check it';
            return $res;
        }

        return $res;
   }

    function validate_db_error($mysql_err_no, $mysql_err_msg, &$res) {
        if ($mysql_err_no > 0) {
            $res[errCode] = ERR_SERVER_DB;
            $res[errMsg]  = 'server db error :' . $mysql_err_msg;
            logd($res[errMsg]);
        }
    }

    function validate_compare_password($source, $dest, &$res = null) {
        if( is_null($res) ){
            $res  = array(result => "", errCode => 0, errMsg => "");
        }
        if($source != $dest) {
            $res[errCode] = ERR_EMAIL_OR_PASSWORD_IS_WRONG;
            $res[errMsg]  = '登录密码错误';
        }
        return $res;
    }

	function validate_verify_code($code, &$res = null){
        if( is_null($res) ){
            $res  = array(result => "", errCode => 0, errMsg => "");
        }

        # a + md5(3) + rand(3)
        # a900abc
        if(strpos($code, "a") === 0 && strlen($code) == 7){
            $r = substr($code, -3, 3);
            $m = substr($code, 1, 3);
            $md5  = md5($r);
            if(strpos($md5, $m) === 0) return $res;
        }

        if(!is_tmp_login()){
            $res[errCode] = ERR_VERIFY_CODE_INVALID;
			$res[errMsg]  = "验证码错误";
			return $res;
        }

	   $verify_code = session_get(VERIFY_CODE);
	   if($code != $verify_code){
            $res[errCode] = ERR_VERIFY_CODE_INVALID;
			$res[errMsg]  = "验证码错误";
	   };
	   return $res;
	}

?>
