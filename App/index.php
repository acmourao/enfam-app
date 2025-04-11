<?php

session_start();

$_SESSION['time'] = time();

$uri_parse = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

$path = explode('/', ltrim($uri_parse, '/'));

$uri = ['get', 'post', 'delete', 'usuario'];

include_once 'config.php';

include_once 'Autoload.php';

include_once 'rotas.php';
