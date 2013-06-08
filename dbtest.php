<?php
    require_once('db/DbAdapter.php');
    require_once('lib/company.php');
    
    var_dump(get_all_job_applications_api(1));
    
    /* $db = new DbAdapter();

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
