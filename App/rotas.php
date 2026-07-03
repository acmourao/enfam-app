<?php

use Controller\{
    HomeController,
    LoginController,
    UsuariosController,
    EstadosController
};

try {
    switch ($uri_parse) {
        // Rotas para serviços de usuários
        case '/ufs':
            EstadosController::index();
            break;
        // Rotas para serviços de usuários
        case '/usuarios':
            UsuariosController::index();
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

            if ($path[0] == 'usuario') {
                if ($path[1] == 'get') {
                    if (is_numeric($path[2])) {
                        UsuariosController::get($path[2]);
                    }
                }
                if (($path[1] == 'save')) {
                    UsuariosController::save();
                }
            } else {
                if ($path[0] == 'uf') {
                    if ($path[1] == 'get') {
                        if (is_numeric($path[2])) {
                            EstadosController::get($path[2]);
                        }
                    }
                } else {
                    header("Location: /");
                }
            }

            break;
    }
} catch (Exception $e) {
    echo $e->getMessage() . " " . $uri_parse;
}
