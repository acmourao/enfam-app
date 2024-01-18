<?php

use Controller\{
    DashboardController,
    LoginController,
    UsuarioController
};

//echo $_SESSION['count'] += 1;

try {
    switch ($uri_parse) {
            // Rotas para serviços de usuários
        case '/usuario':
            UsuarioController::index();
            break;

            // Tela inicial.
        default:
            DashboardController::index();
            break;
    }
} catch (Exception $e) {
    echo "Erro do Sistema ::: " . $e->getMessage() . "<br><hr>" . $uri_parse;
}
