<?php
require_once(dirname(__FILE__) . '/../Smarty/libs/Smarty.class.php');
require_once(dirname(__FILE__) . '/constants.php');

class MySmarty extends Smarty {
    public function __construct() {
        parent::__construct();

        if (!is_dir(TEMPLATE_C_PATH)) {
            mkdir(TEMPLATE_C_PATH);
        }

        $this->template_dir = TEMPLATE_PATH;
        $this->compile_dir  = TEMPLATE_C_PATH;
        $this->cache_dir    = TEMPLATE_C_PATH;
        $this->caching      = false;
        $this->compile_locking = false;
    }
}
?>
