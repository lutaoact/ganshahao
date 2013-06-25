<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";

    echo json_encode(array(user_id => get_user_id()));
?>