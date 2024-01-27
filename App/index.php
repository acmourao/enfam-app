<?php

session_start();

$uri_parse = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

require_once 'config.php';

require_once 'Autoload.php';

require_once 'rotas.php';