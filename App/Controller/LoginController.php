<?php

namespace Controller;

class LoginController extends Controller
{

    public static function login()
    {
        $_SESSION['usuario_logado'] = true;
        header("Location: /");
    }

    public static function logoff()
    {
        $_SESSION['usuario_logado'] = false;
        include PATH_VIEW . 'error.php';
    }
}
