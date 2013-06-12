<?php
require_once "$_SERVER[DOCUMENT_ROOT]/lib/MySmarty.php";
require_once "$_SERVER[DOCUMENT_ROOT]/db/DbAdapter.php";
require_once "$_SERVER[DOCUMENT_ROOT]/lib/common.php";

if ( !isset($_POST['status_selected']) || !isset($_POST['job_application_id']) ) {
    echo "status_selected and job_application_id 有问题";
    exit;
}

if ( !is_numeric($_POST['status_selected']) || !is_numeric($_POST['job_application_id']) ) {
    echo "status_selected and job_application_id 必须是数字";
    exit;
}
$res = array(result => "", errCode => 0, errMsg => "");

$status_selected = $_POST['status_selected'];
$job_application_id = $_POST['job_application_id'];
#var_dump($status_selected);
#var_dump($job_application_id);

$_db = new DbAdapter();
list($affected_rows, $mysql_err_no, $mysql_err_msg) = $_db->update_job_application_by_id($job_application_id, array('status' => $status_selected));
validate_db_error($mysql_err_no, $mysql_err_msg, $res);
if ($res[errCode]) json_exit($res);

echo json_encode($res);
?>
