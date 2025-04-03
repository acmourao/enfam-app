<?php

namespace Controller;

class LoginController extends Controller
{

    public static function login()
    {
        $_SESSION["usuario_logado"] = true;
        //include PATH_VIEW . 'login.php';
        header("Location: /");
    }

    public static function logoff()
    {
        unset($_SESSION["usuario_logado"]);
        header("Location: /");
    }
}
