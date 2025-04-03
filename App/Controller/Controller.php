<?php

namespace Controller;

abstract class Controller
{
    protected static function isProtected()
    {
        if (!isset($_SESSION["usuario_logado"]))
            header("Location: /error.php");
    }
}
