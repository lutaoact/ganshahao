<?php
define('TEMPLATE_PATH', dirname(__FILE__) . '/../templates/');
define('TEMPLATE_C_PATH', dirname(__FILE__) . '/../templates_c/');

//db
define("ERR_SERVER_DB",                     501);


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
define('ERR_CHANGE_EMAIL',                  113); //不能修改邮箱
define('ERR_PASSWORD',                      114); //密码错误
define('ERR_TWO_NEW_PASSWORD_DO_NOT_MATCH', 115); //两次输入的新密码不相同
define('ERR_EMAIL_NOT_EXIST',               116);
define('ERR_SEND_MAIL_FAIL',                117);

define('ERR_NOT_LOGIN',                     150);
define('ERR_WITHOUT_REAL_INFO',             151);
// job
define('ERR_ZIPCODE_FORMAT',                201);

// path
define('IMG_PATH',                          "/static/img/");
define('UPLOADS_DIR_PICTURE',               "/uploads/");
define('UPLOADS_DIR_RESUME',                "/uploads/");
define('LOGIN_COOKIE',                      'GANSHAHAO_WEB_SESSION');          //login cookie name

// email server
define('SMTP_SERVER',                       'smtp.163.com');        // SMTP邮件服务器
define('SMTP_SERVER_PORT',                  25);                  // SMTP服务器端口
define('SMTP_USER_MAIL',                    'gsh_test@163.com');   // 暂时不知道
define('SMTP_USER',                         'gsh_test@163.com');   // 发送者邮箱
define('SMTP_PASSWORD',                     'gsh123456');           // 发送方邮箱密码
?>
