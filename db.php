<?php

define('DBHOST', 'localhost'); // Add your host
define('DBUSER', 'root'); // Add your username
define('DBPASS', 'truelove'); // Add your password
define('DBNAME', 'forever'); // Add your database name
//MySQLi Object / Procedural
// for MySqli use $con 
$conn = new mysqli(DBHOST, DBUSER, DBPASS, DBNAME);
if (!$conn) {
    die('Error: Could not connect: ' . mysqli_error());
}
mysqli_set_charset($conn,"utf8");
?>
