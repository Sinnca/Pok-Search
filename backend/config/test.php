<?php
global $conn;
require_once 'db.php';  // include your database connection file

// Simple query to test connection
$sql = "SHOW TABLES";
$result = mysqli_query($conn, $sql);

if($result){
    echo "Database connection works!<br>";
    echo "Tables in database:<br>";
    while($row = mysqli_fetch_row($result)){
        echo $row[0] . "<br>";
    }
} else {
    echo "Database connection failed: " . mysqli_error($conn);
}
?>

