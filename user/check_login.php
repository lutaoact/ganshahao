<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";
    
    $res = array(user_id => get_user_id());
    
    json_exit($res)
?>