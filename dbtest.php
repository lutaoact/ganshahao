<?php
    require_once('db/DbAdapter.php');
    $db = new DbAdapter();
    //echo var_dump($db->count_training_complete_by_user_id(1));
    echo var_dump($db->get_status_by_job_id_and_user_id(1,1))
?>
