<?php

namespace Controller;

abstract class Controller
{
    public static function isprotected()
    {
        //var_dump($_SESSION);

        if ($_SESSION['usuario_logado'] == null) {
            header("Location: /login");
        }
    }
}
