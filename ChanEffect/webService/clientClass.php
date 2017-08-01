<?php
class Client{
    
    var $firstName;
    var $lastName;
    var $age;
    var $sex;
    var $email;
    var $password;
    
    function __construct($firstName, $lastName, $age, $sex, $email, $password) {
        $this->firstName = $firstName;
        $this->lastName = $lastName;
        $this->age = $age;
        $this->sex = $sex;
        $this->email = $email;
        $this->password = $password;
    }
    
}
?>
