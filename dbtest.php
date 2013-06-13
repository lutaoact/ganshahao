<?php
    require_once('db/DbAdapter.php');
    require_once('lib/company.php');
    require_once('lib/user.php');
    require_once('lib/job.php');

    //$db = new DbAdapter();

    //var_dump(get_training_detail_api(2));

    var_dump(get_training_list_api(1));

    /* var_dump(get_user_all_job_applications_api(1));

    list($res, $mysql_err_no, $mysql_err_msg) = $db->select_job_applications_by_user_id(1);
    var_dump($res);

    var_dump(get_top_user_api());
    var_dump(get_top_jobs_api(200011));

    list($res, $mysql_err_no, $mysql_err_msg) = $db->select_job_application_by_company_id(1);
    var_dump($res);

    list($res, $mysql_err_no, $mysql_err_msg) = $db->select_hot_jobs_by_zipcode(200011);
    var_dump($res);
    list($res, $mysql_err_no, $mysql_err_msg) = $db->select_job_list_by_zip_code(200011);
    var_dump($res);
    $data = array(
            'email'    => 'test@test.com',
            'password' => 'test',
        );
    echo var_dump($db->insert_user($data)); */
    //echo var_dump($db->count_training_complete_by_user_id(1));
    //echo var_dump($db->get_status_by_job_id_and_user_id(1,1))
?>
