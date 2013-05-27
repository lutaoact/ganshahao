<?php
require_once('db/DbAdapter.php');

$db = new DbAdapter();
$result = $db->select_user_by_email("a@b.com");
var_dump($result);
echo get_magic_quotes_gpc();

/*


*/

?>