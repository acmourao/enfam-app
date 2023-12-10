<?php

$host = 'mysql';
$db = 'educaenfam';
$user = 'root';
$password = 'root';

// Diz para o PHP que estamos usando strings UTF-8 até o final do script
mb_internal_encoding('UTF-8');

// Diz para o PHP que nós vamos enviar uma saída UTF-8 para o navegador
mb_http_output('UTF-8');

// Conectar a um banco de dados de teste

$dsn = "mysql:host=$host;dbname=$db;charset=UTF8";

try {
	$pdo = new PDO($dsn, $user, $password, array(
        PDO::ATTR_PERSISTENT => true
    ));

	if ($pdo) {
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $pdo->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "SET NAMES 'utf8'");
		//echo "Connected to the $db database successfully!<br/><br/>";       
	}
} catch (PDOException $e) {
	echo $e->getMessage();
}