<?php

session_start();

$_SESSION['time'] = time();

include_once 'Autoload.php';

include_once 'config.php';

include_once 'rotas.php';
