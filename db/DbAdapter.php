<?php
require_once(dirname(__FILE__) . '/db_config.php');

class DbAdapter {
    private $_db;

	public function __construct(){
		$this->_db = new mysqli(MYSQL_HOST, MYSQL_USER_NAME, MYSQL_PASSWORD) or die('could not connect to database'.mysqli_error);
		$this->_db->select_db(DB_NAME) or die("could not select " . DB_NAME . " : " . mysqli_error);
	}

    public function runSql($sql) {
        return $this->_db->query($sql);
    }
	
    public function getVar($sql) {
        $result = $this->runSql($sql);
        if($result->num_rows) {
            list($key, $value) = each($result);
            return $value;
        }
        return null;
    }
    public function getData($sql) {
        $result = $this->runSql($sql);
        if($result->num_rows)
            return $result;
        return null;
    }

    public function getLine($sql) {
        $result = $this->runSql($sql);
        if($result->num_rows)
            return $result->fetch_assoc();
        return null;
    }

	private function format_data($params, $separator = ','){
		$str = $s = '';
		foreach ($params as $k => $v) {
			// $v = $this->_mysql->escape($v);
			// htmlspecialchars($v);
			$v = is_int($v) ? $v : "'{$v}'";
			$str .= $s . "`{$k}`={$v}";
			$s = $separator;
		}
		return $str;
	}
	
	private function format_list_to_string($list) {
		$list_string = '';
		foreach($list as $e) {
			$e = $this->escape($e);
			if($list_string == '') {
				$list_string = "'{$e}'";
			} else {
				$list_string .= ", '{$e}'";
			}
		}
		return $list_string;
	}
	
    ##################
    # user
    ##################

    /*
    * @param params:Array
    * @return affected rows
    */
    public function insert_user($params) {
        $data = $this->format_data($params);
        $sql = "INSERT INTO
                    user
                SET
                    {$date}";
        return $this->runSql($sql);
    }

    /*
    * @param id:int
    * @param params:Array
    * @return affected rows
    */
    public function update_user($id, $params) {
        $data = $this->format_data($params);
        $sql = "UPDATE
                    user
                SET
                    {$date}
                WHERE
                    id = {$id}";
        return $this->runSql($sql);
    }

    /*
    * @param email:string
    * @return user_info:Array or null
    */
    public function select_user_by_email($email) {
        $email = trim($email);
        $sql = "SELECT
                    *
                FROM
                    user
                WHERE
                    email = '{$email}'
                LIMIT 1";
        return $this->getLine($sql);
    }

    ##################
    # company
    ##################
    public function insert_company($params) {
        $data = $this->format_data($params);
        $sql = "INSERT INTO
                    company
                SET
                    {$date}
                ";
        return $this->runSql($sql);
    }

    public function select_company_by_id($id) {
        $sql = "SELECT
                    *
                FROM
                    company
                WHERE
                    id = {$id}";
        return $this->getLine($sql);
    }

    public function select_jobs_by_company_id($id) {
        $sql = "SELECT
                    *
                FROM
                    job
                WHERE
                    company_id = {$id}";
        return $this->getData($sql);
    }

    public function select_candidates_by_company_id($id) {
        $sql = "SELECT
                    user_id, job_id
                FROM
                    job_application
                WHERE
                    job_id
                IN
                    (SELECT
                        id
                    FROM
                        job
                    WHERE
                        company_id = {$id})";
        return $this->getData($sql);
    }

    ##################
    # job
    ##################
    public function insert_job($params) {
        $data = $this->format_data($params);
        $sql = "INSERT INTO
                    job
                SET
                    {$date}, update_time = NOW()
                ";
        return $this->runSql($sql);
    }

    public function updata_job($id, $params) {
        $data = $this->format_data($params);
        $sql = "UPDATE
                    job
                SET
                    {$data}
                WHERE
                    id = {$id}";
        return $this->runSql($sql);
    }

    public function select_trainings_by_job_id($id) {
        $sql = "SELECT
                    *
                FROM
                    training
                WHERE
                    job_id = {$id}";
        return $this->getData($sql);
    }

    public function select_trainings_by_zip_code($zip_code) {
        $zip_code = trim($zip_code);
        $sql = "SELECT
                    *
                FROM
                    training
                WHERE
                    zipc_ode = {$id}";
        return $this->getData($sql);
    }

    ##################
    # training
    ##################
    public function insert_training($params) {
        $data = $this->format_data($params);
        $sql = "INSERT INTO
                    training
                SET
                    {$date}
                ";
        return $this->runSql($sql);
    }

    public function update_training($id, $params) {
        $data = $this->format_data($params);
        $sql = "UPDATE
                    training
                SET
                    {$data}
                WHERE
                    id = {$id}";
        return $this->runSql($sql);
    }

    ##################
    # question
    ##################
    public function insert_question($params) {
        $data = $this->format_data($params);
        $sql = "INSERT INTO
                    question
                SET
                    {$date}
                ";
        return $this->runSql($sql);
    }

    ##################
    # training_complete
    ##################
    public function insert_training_complete($params) {
        $data = $this->format_data($params);
        $sql = "INSERT INTO
                    training_complete
                SET
                    {$date}
                ";
        return $this->runSql($sql);
    }

    ##################
    # job_application
    ##################
    public function insert_job_application($params) {
        $data = $this->format_data($params);
        $sql = "INSERT INTO
                    job_application
                SET
                    {$date}
                ";
        return $this->runSql($sql);
    }
}
?>
