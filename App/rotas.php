<?php

use Controller\{
    DashboardController,
    IrpfController,
    LoginController,
    UsuarioController
};

//var_dump($uri_parse, $_SESSION);

try {
    switch ($uri_parse) {
            // Rotas para serviços de usuários
        case '/usuarios':
            UsuarioController::index();
            break;
        case '/usuario.editar':
            UsuarioController::editar();
            break;
        case '/irpf':
            IrpfController::index();
            break;
        case '/login':
            LoginController::login();
        case '/':
            DashboardController::index();
            break;
        default:
            include 'error.php';
            break;
    }
} catch (Exception $e) {
    echo "Erro do Sistema ::: " . $e->getMessage() . "<br><hr>" . $uri_parse;
}
