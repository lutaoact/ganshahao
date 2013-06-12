<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/constants.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/formvalidator.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MyMail.php";

    function json_exit( $res ) {
        echo json_encode( $res );
        exit(0);
    }

    function get_user_id() {
        if ( is_login() ) {
            return session_get('user_id');
        }
        return null;
    }

    function require_login() {
        if( !is_login() ){
            redirect('/user/login.php?jumpto='.$_SERVER["REQUEST_URI"]);
        }
        return session_get('user_id');
    }

    function redirect($filename) {
       if (!headers_sent())
           header('Location: '.$filename);
       else {
           echo '<script type="text/javascript">';
           echo 'window.location.href="'.$filename.'";';
           echo '</script>';
           echo '<noscript>';
           echo '<meta http-equiv="refresh" content="0;url='.$filename.'" />';
           echo '</noscript>';
       }
       exit;
    }

    function is_login() {
        if(isset($_SESSION['user_id'])) {
            return $_SESSION['user_id'];
        }

        if($_COOKIE[LOGIN_COOKIE]) {
            $session_id = $_COOKIE[LOGIN_COOKIE];
            Session_id($session_id);
            Session_start();
            if(isset($_SESSION['user_id'])) {
                return $_SESSION['user_id'];
            }
        }
        return false;
    }


    function set_session_cookie($user_id, $data = array()) {
        session_start();
        $session_id = session_id();
        $_SESSION['user_id'] = $user_id;
        foreach( $data as $k => $v){
            $_SESSION[$k] = $v;
        }
        SetCookie(LOGIN_COOKIE, $session_id, time()+60*60*24, '/'); # one day
    }

    function set_company_session_cookie($company_id, $data = array()) {
        session_start();
        $session_id = session_id();
        $_SESSION['company_id'] = $company_id;
        foreach( $data as $k => $v){
            $_SESSION[$k] = $v;
        }
        SetCookie(LOGIN_COOKIE, $session_id, time()+60*60*24, '/'); # one day
    }

    function delete_session_cookie() {
        session_start();
        unset($_SESSION['user_id']);
        unset($_SESSION['company_id']);
        SetCookie(LOGIN_COOKIE, '', time() - 3600);
    }

    function session_set($key, $value) {
        session_start();
        $_SESSION[$key] = $value;
    }

    function session_get($key) {
        session_start();
        return  $_SESSION[$key];
    }

    function send_mail($to, $subject, $content, $params = array()) {
        $_post = array(
            from            => 'tfirer@foxmail.com',
            to              => $to,
            subject         => $subject,
            content         => $content,
            smtp_host       => 'smtp.163.com',
            smtp_port       => 25,
            smtp_username   => "干啥好",
            smtp_password   => "ishine",
            tls             => false,
        );
        if (isset($params['reply_to'])) {
            $_post['reply_to']      = $params['reply_to'];
            $_post['reply_name']    = $params['reply_name'];
        }

        $mailer = new MyMail($_post);
        $res = $mailer->send();
        if(!$res){
            logd('from:'.$_post['from'].' to: '.$to.' >>>'.$mailer->errmsg());
        }
        $mailer->clean();
        return $res;
    }
?>
