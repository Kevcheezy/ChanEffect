<?php
/**
 * Created by PhpStorm.
 * User: Belal
 * Date: 04/02/17
 * Time: 7:51 PM
 */
require_once dirname(__FILE__) . '/Constants.php';
require_once dirname(__FILE__) . '/DbConnect.php';
class DbOperation
{
    private $conn;
 
    //Constructor
    function __construct()
    {
        // opening db connection
        $db = new DbConnect();
        $this->conn = $db->connect();
    }
 
    //Function to create a new user
    public function createUser($firstName, $lastName, $password, $email, $age, $sex)
    {
        if (!$this->isUserExist($email)) {
            //$password = md5($pass);
            $stmt = $this->conn->prepare("INSERT INTO customers (firstName, lastName, age, sex, email, password) VALUES (?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("ssssss", $firstName, $lastName, $age, $sex, $email, $password);
            if ($stmt->execute()) {
                return USER_CREATED;
            } else {
                return USER_NOT_CREATED;
            }
        } else {
            return USER_ALREADY_EXIST;
        }
    }
 
 
    private function isUserExist($email)
    {
        $stmt = $this->conn->prepare("SELECT id FROM customers WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->store_result();
        return $stmt->num_rows > 0;
    }
}
?>