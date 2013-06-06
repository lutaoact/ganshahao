<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/constants.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/formvalidator.php";

    function json_exit( $res ) {
        echo json_encode( $res );
        exit(0);
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
        SetCookie(LOGIN_COOKIE, $session_id, time()+60*60*24*30, '/'); # 30 day
    }

    function delete_session_cookie() {
        unset($_SESSION['user_id']);
        SetCookie(LOGIN_COOKIE, '', time() - 3600);
    }

    function session_set($key, $value) {
        $_SESSION[$key] = $value;
    }

    function session_get($key) {
        return  $_SESSION[$key];
    }
?>
