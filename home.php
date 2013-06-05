<?php
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/db/DbAdapter.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/constants.php";
    require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";

    $smarty = new MySmarty();
    $smarty->display('home/home.tpl');
?>