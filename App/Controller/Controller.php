<?php

namespace Controller;

abstract class Controller
{
    public static function isprotected()
    {
        if ($_SESSION["usuario_logado"] == false) {
            header("Location: /login");
        }
    }
}
