
<?php
    
    require_once('clientClass.php');
    require_once('Constants.php');
        
    // Create connection
    $con = new mysqli('localhost', 'chandata_admin', 'K0e1v2i3n4!', 'chandata_users');
        
    // Check connection
    if (mysqli_connect_errno())
    {
        echo MYSQL_CONNECT_ERROR;
    }
        
    // Decode JSON object from POST request
    $data = json_decode(file_get_contents('php://input'), true);
    $firstName = $data["firstName"];
    $lastName = $data["lastName"];
    $age = $data["age"];
    $sex = $data["sex"];
    $email = $data["email"];
    $password = $data["password"];
        
         
    // This SQL statement selects ALL from the table 'Customers'
    $stmt = $con->prepare("INSERT INTO Customers (firstName, lastName, age, sex,  email, password) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssss", $firstName, $lastName, $age, $sex, $email, $password);
    if ($stmt->execute()) {
        // Return server response
        echo USER_CREATED;
    } else {
        echo USER_NOT_CREATED;
    }
        
    // Close connections
    $stmt->close();
    $con->close();
        
?>
