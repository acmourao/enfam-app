<?php

use Controller\{
    HomeController,
    LoginController,
    UsuarioController
};

try {
    switch ($uri_parse) {
        // Rotas para serviços de usuários
        case '/usuarios':
            UsuarioController::index();
            break;
        // login de usuários
        case '/login':
            LoginController::login();
            break;

        case '/logoff':
            LoginController::logoff();
            break;

        // Tela inicial.
        case '/':
        case '':
            HomeController::index();
            break;
        default:
            if (isset($path[2])) {
                if ($path[0] == 'usuario') {
                    if ($path[1] == 'get') {
                        UsuarioController::get($path[2]);
                    }
                    if ($path[1] == 'post') {
                        UsuarioController::post();
                    }
                }
            } else {
                header("Location: /");
            }
            break;
    }
} catch (Exception $e) {
    echo "Erro do Sistema ::: " . $e->getMessage() . "<br><hr>" . $uri_parse;
}
