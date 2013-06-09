<?php
require_once(dirname(__FILE__) . '/db_config.php');

class DbAdapter {
    private $_db;

    public function __construct(){
        $this->_db = new mysqli(MYSQL_HOST, MYSQL_USER_NAME, MYSQL_PASSWORD) or die('could not connect to database'.mysqli_error);
        $this->_db->select_db(DB_NAME) or die("could not select " . DB_NAME . " : " . mysqli_error);
        $this->_db->query('set names utf8');
    }

    public function format( $data = null){
        return array($data, $this->errno(), $this->errmsg());
    }

    public function emptyResult() {
        return $this->format();
    }

    public function errno() {
        return $this->_db->errno;
    }

    public function errmsg() {
        return $this->_db->error;
    }

    public function escape($string) {
        return mysql_escape_string($string);
    }

    public function runSql($sql) {
        $result = $this->_db->query($sql);
        return $this->format($result->affected_rows);
    }

    public function getVar($sql) {
        if($result = $this->_db->query($sql)) {
            $data = $result->fetch_assoc();
            foreach ($data as $key => $value) {
                return $this->format($value);
            }
        } else {
            return $this->emptyResult();
        }
    }

    public function getData($sql) {
        $result = $this->_db->query($sql);
        for($i = 0; $i<$result->num_rows; $i++)
            $data[$i] = $result->fetch_assoc();
        return $this->format($data);
    }

    public function getLine($sql) {
        if($result = $this->_db->query($sql)) {
            return $this->format($result->fetch_assoc());
        } else {
            return $this->emptyResult();
        }
    }

    private function format_data($params, $separator = ','){
        $str = $s = '';
        foreach ($params as $k => $v) {
            $v = $this->escape($v);
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
                    {$data}";
        return $this->runSql($sql);
    }

    /*
    * @param id:int
    * @param params:Array
    * @return affected rows
    */
    public function update_user($id, $params) {
        $id = $this->escape($id);
        $data = $this->format_data($params);
        $sql = "UPDATE
                    user
                SET
                    {$data}
                WHERE
                    id = {$id}";
        return $this->runSql($sql);
    }

    /*
    * @param email:string
    * @return user_info:Array or null
    */
    public function select_user_by_email($email) {
        $email = $this->escape($email);
        $sql = "SELECT
                    *
                FROM
                    user
                WHERE
                    email = '{$email}'
                LIMIT 1";
        return $this->getLine($sql);
    }

    /*
    * @param email:string
    * @return user_info:Array or null
    */
    public function select_user_by_id($id) {
        $id = $this->escape($id);
        $sql = "SELECT
                    *
                FROM
                    user
                WHERE
                    id = '{$id}'";
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
                    {$data}";
        return $this->runSql($sql);
    }

    public function select_company_by_id($id) {
        $id = $this->escape($id);
        $sql = "SELECT
                    *
                FROM
                    company
                WHERE
                    id = {$id}";
        return $this->getLine($sql);
    }

    public function select_company_by_account($account) {
        $account = $this->escape($account);
        $sql = "SELECT
                    *
                FROM
                    company
                WHERE
                    account = '{$account}'";
        return $this->getLine($sql);
    }

    public function select_company_list_by_zipcode($zipcode) {
        $zipcode = $this->escape($zipcode);
        $sql = "SELECT
                    DISTINCT company.id as company_id,
                    company.name as company_name,
                    company.logo as company_logo
                FROM
                    job, company
                WHERE
                    job.company_id = company.id
                        AND
                    job.zipcode = {$zipcode}";
        return $this->getData($sql);
    }

    public function select_job_list_by_company_id_and_zipcode($company_id, $zipcode) {
        $company_id = $this->escape($company_id);
        $zipcode = $this->escape($zipcode);
        $sql = "SELECT
                    job.id as job_id,
                    job.status as job_status,
                    job.name as job_name
                FROM
                    job
                WHERE
                    company_id = {$company_id}
                        AND
                    zipcode = {$zipcode}";
        return $this->getData($sql);
    }

    public function select_job_list_by_company_id($id) {
        $id = $this->escape($id);
        $sql = "SELECT
                    id, name
                FROM
                    job
                WHERE
                    company_id = {$id}";
        return $this->getData($sql);
    }

    public function select_candidates_by_company_id($id) {
        $id = $this->escape($id);
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
                    {$data}, update_time = NOW()";
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

    public function select_trainings_by_job_id($id, $offset) {
        $id = $this->escape($id);
        $sql = "SELECT
                    id as id,
                    training_type as type,
                    name as name,
                    description as description,
                    link as link
                FROM
                    training
                WHERE
                    job_id = {$id}
                LIMIT
                    {$offset}, 1";
        return $this->getLine($sql);
    }

    public function select_job_detail_by_job_id($id) {
        $id = $this->escape($id);
        $sql = "SELECT
                    job.id as job_id,
                    company.id as company_id,
                    job.name as job_name,
                    company.name as company_name,
                    job.description as job_description,
                    job.address as job_address
                FROM
                    job, company
                WHERE
                    company.id = job.company_id and
                    job.id = {$id}";
        return $this->getLine($sql);
    }

    public function select_hot_jobs_by_zipcode($zipcode) {
        $zipcode = $this->escape($zipcode);
        $sql = "SELECT
                    job_application.job_id as id,
                    job.name as name
                FROM
                    job_application, job
                WHERE
                    job_application.job_id = job.id
                        AND
                    job_application.job_id
                IN
                    (SELECT
                        id
                    FROM
                        job
                    WHERE
                        zipcode = $zipcode)
                GROUP BY
                    job_id
                ORDER BY
                    count(job_id) desc
                LIMIT 5";
        return $this->getData($sql);
    }

    public function select_top_job_seeker_by_job_id() {
        /* $id = $this->escape($id); */
        $sql = "SELECT DISTINCT
                    training_completed.user_id as id,
                    user.nick_name as name
                FROM
                    training_completed, user
                WHERE
                    training_completed.user_id = user.id
                LIMIT 5";
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
                    {$data}";
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
                    {$data}";
        return $this->runSql($sql);
    }

    public function update_question($id, $params) {
        $data = $this->format_data($params);
        $sql = "UPDATE
                    question
                SET
                    {$data}
                WHERE
                    id = {$id}";
        return $this->runSql($sql);
    }

    public function select_questions_by_training_id($id) {
        $id = $this->escape($id);
        $sql = "SELECT
                    *
                FROM
                    question
                WHERE
                    training_id = {$id}";
        return $this->getData($sql);
    }

    public function select_question_answer_by_question_id($question_id) {
        $id = $this->escape($question_id);
        $sql = "SELECT
                    id as question_id,
                    answer as question_answer
                FROM
                    question
                WHERE
                    id = {$question_id}";
        return $this->getLine($sql);
    }
    ##################
    # training_completed
    ##################
    public function insert_training_complete($params) {
        $data = $this->format_data($params);
        $sql = "INSERT INTO
                    training_completed
                SET
                    {$data}";
        return $this->runSql($sql);
    }

    public function count_training_completed_by_user_id($id) {
        $id = $this->escape($id);
        $sql = "SELECT
                    count(*)
                FROM
                    training_completed
                WHERE
                    user_id = {$id}";
        return $this->getVar($sql);
    }

    public function select_training_names_completed_by_user_id($id) {
        $id = $this->escape($id);
        $sql = "SELECT
                    training.name as training_name
                FROM
                    training, training_completed
                WHERE
                    training_completed.user_id = {$id}
                        AND
                    training_completed.training_id = training.id ";
        return $this->getData($sql);
    }

    ##################
    # job_application
    ##################
    public function insert_job_application($params) {
        $data = $this->format_data($params);
        $sql = "INSERT INTO
                    job_application
                SET
                    {$data}";
        return $this->runSql($sql);
    }

    public function get_status_by_job_id_and_user_id($job_id, $user_id) {
        $job_id  = $this->escape($job_id);
        $user_id = $this->escape($user_id);
        $sql = "SELECT
                    status
                FORM
                    job_application
                WHERE
                    job_id = {$job_id} and user_id = {$user_id}";
        return $this->getVar($sql);
    }

    public function select_job_applications_by_company_id($id) {
        $id = $this->escape($id);
        $sql = "SELECT distinct
                    user.id        as user_id,
                    user.nick_name as user_name,
                    job.id         as job_id,
                    job.name       as job_name
                FROM
                    job_application, job, user
                WHERE
                    job_application.job_id = job.id
                        AND
                    job_application.user_id = user.id
                        AND
                    job.company_id = {$id}";
        return $this->getData($sql);
    }
    ##################
    # settings
    ##################
}
?>
