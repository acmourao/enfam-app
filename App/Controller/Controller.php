<?php

namespace Controller;

abstract class Controller
{
    protected static function isProtected()
    {
        if (!isset($_SESSION["usuario_logado"]))
            header("Location: /error.php");
    }

    protected static function jsonOutput($scope)
    {
        header('Content-Type: application/json');
        echo json_encode($scope, JSON_PRETTY_PRINT);
    }

    protected static function request()
    {
        return json_decode(file_get_contents("php://input"));
    }
}
