<?php

use Controller\{
    DashboardController,
    UsuarioController
};

//echo $_SESSION['count'] += 1;
var_dump($uri_parse);

try {
    switch ($uri_parse) {
            // Rotas para serviços de usuários
        case '/usuario':
            UsuarioController::index();
            break;
        case '/':
            DashboardController::index();
            break;
            // Tela inicial.
        default:
            include 'error.php';
            break;
    }
} catch (Exception $e) {
    echo "Erro do Sistema ::: " . $e->getMessage() . "<br><hr>" . $uri_parse;
}
