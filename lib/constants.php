<?php
define('TEMPLATE_PATH', dirname(__FILE__) . '/../templates/');
define('TEMPLATE_C_PATH', dirname(__FILE__) . '/../templates_c/');

//path
define("HOME_PATH",              "$_SERVER[DOCUMENT_ROOT]/home.php");
// user
define('ERR_EMAIL_FORMAT_IS_WRONG',         100); //
define('ERR_EMAIL_OR_PASSWORD_IS_WRONG',    101); // for user login
define('ERR_EMAIL_ALREADY_EXIST',           102); // for register user
define('ERR_PASSWORD_IS_NULL',              103); // for register user
define('ERR_PASSWORD_IS_NOT_SAME',          104); // for register user
define('ERR_USER_ID_IS_WRONG',              105); // for user_id validate
define('ERR_USER_TOKEN_IS_WRONG',           106); // for user token validate
define('ERR_USER_NAME_IS_NULL',             107); // for user register
define('ERR_USER_GENDER_IS_NULL',           108);
define('ERR_USER_GENDER_IS_WRONG',          109);
define('ERR_LOCK_PASSWORD_IS_NULL',         110);
define('ERR_USER_NOT_REGISTER',             111);
define('ERR_EMAIL_EXIST',                   112);

// job
define('ERR_ZIPCODE_FORMAT',                201);


define('LOGIN_COOKIE',                      'GANSHAHAO_WEB_SESSION');          //login cookie name
define('', '');
define('', '');
define('', '');
?>
