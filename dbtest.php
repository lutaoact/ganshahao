<?php
    require_once('db/DbAdapter.php');

    $db = new DbAdapter();

    list($user_info, $mysql_err_no, $mysql_err_msg) = $db->select_user_by_email('aa@b.com');
    if(!$user_info) {
        echo 'success';
    }else {
        echo 'failue';
    }
    /* $data = array(
            'email'    => 'test@test.com',
            'password' => 'test',
        );
    echo var_dump($db->insert_user($data)); */
    //echo var_dump($db->count_training_complete_by_user_id(1));
    //echo var_dump($db->get_status_by_job_id_and_user_id(1,1))
?>
