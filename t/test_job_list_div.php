<?php
require_once("$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php");
require_once("$_SERVER[DOCUMENT_ROOT]/lib/constants.php");
require_once("$_SERVER[DOCUMENT_ROOT]/lib/job.php");

$res = get_job_list_by_zipcode_api(200011);
/* $company_list = array(
    array(
        company_name =>"星巴克",
        company_logo =>IMG_PATH.'logo.png',
        job_list => array(
            array(
                name => '星巴克咖啡师',
                status => 0,
            ),
            array(
                name => '门店经理',
                status => 1,
            )
        )
    ),
    array(
        company_name =>"麦当劳",
        company_logo =>IMG_PATH.'logo.png',
        job_list => array(
            array(
                name => '咖啡师',  
                status => 0,
            ),
            array(
                name => '店员',
                status => 1,
            )
        )
    ),
    array(
        company_name =>"汉堡王",
        company_logo =>IMG_PATH.'logo.png',
        job_list => array(
            array(
                name => '汉堡师',
                status => 0,
            ),
            array(
                name => '大吃货',
                status => 1,
            )
        )
    )
); */

//var_dump($res[result]);

$smarty = new MySmarty();
$smarty->assign('company_list', $res[result]);
$smarty->display('job/job_list_div.tpl');
?>