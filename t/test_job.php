<?php
require_once("$_SERVER[DOCUMENT_ROOT]/lib/job.php");

$res = get_job_list_by_zipcode_api(200011);
var_dump($res);
?>
