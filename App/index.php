<?php

session_start();

$_SESSION['time'] = time();
//$_SESSION["usuario_logado"] = false;

$uri_parse = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

include 'config.php';

include 'Autoload.php';

include 'rotas.php';
