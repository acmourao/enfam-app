<?php
$host = "localhost";
$username = "root";
$password = "root";
$database = "educaenfam";

try {
    // 1. Create a new MySQLi connection instance
    $mysqli = new mysqli($host, $username, $password, $database);
    
    // 2. Set the proper charset (highly recommended to avoid encoding issues)
    $mysqli->set_charset("utf8mb4");
    
    echo "Connected successfully!";
} catch (mysqli_sql_exception $e) {
    // 3. Handle connection errors securely without exposing credentials
    error_log($e->getMessage());
    exit("Database connection failed.");
}


?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teste Mysql</title>
</head>

<body>

<h1>Teste</h1>

</body>

</html>