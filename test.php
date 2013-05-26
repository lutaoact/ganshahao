<?php
require_once('db/DbAdapter.php');

$db = new DbAdapter();
$result = $db->select_user_by_email("a@bb.com");
var_dump($result);
?>
