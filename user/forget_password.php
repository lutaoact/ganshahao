 <?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/constants.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/user.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/smtp.class.php";
    
    if (isset($_REQUEST['user_email'])) {
        $user_email = $_REQUEST['user_email'];

        $result = find_pwd_api($user_email);
        $res = $result['res'];
        $pwd = $result['password'];
        if($res['errCode'] != 0) {
            $res[user_email] = $user_email;
            json_exit($res);
        }

        $send = send_email($user_email, $pwd);
        if (!$send) {
            $res[errCode] = ERR_SEND_MAIL_FAIL;
            $res[errMsg] = '邮件发送失败';
        }
        json_exit($res);
    } else {
        show_page();
    }

    function send_email($user_email, $pwd) {
        $smtpserver = SMTP_SERVER;            // SMTP邮件服务器
        $smtpserverport = SMTP_SERVER_PORT;   // SMTP服务器端口
        $smtpusermail = SMTP_USER_MAIL;       // 这个是什么？？
        $smtpuser = SMTP_USER;                // 发送者邮箱
        $smtppass = SMTP_PASSWORD;            // 发送方邮箱密码
        $smtpemailto = $user_email;    // 目标邮箱

        $mailsubject = '[干啥好] 用户密码找回'; //邮件主题

        /* 邮件内容 */
        $mailbody = '您的密码为：' . $pwd;
        $mailtype = 'HTML';       //邮件格式（HTML/TXT）,TXT为文本邮件

        $email = new smtp($smtpserver,$smtpserverport,true,$smtpuser,$smtppass);
        $email->debug = false;      //是否显示发送的调试信息

        return $email->sendmail($smtpemailto, $smtpusermail, $mailsubject, $mailbody, $mailtype);
    }

    function show_page() {
        $smarty = new MySmarty();
        @$smarty->display("user/forget_password.tpl");
    }
 ?>