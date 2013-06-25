<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";

    delete_session_cookie();

    redirect("/company/login.php");
?>