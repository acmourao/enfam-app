<?php
$host = '172.18.0.1';
$user = 'root';
$pass = 'root';
$db = 'educaenfam';

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

echo "Connected to MySQL successfully";

$conn->close();
?>
