<?php

namespace Controller;

use DAO\UsuarioDAO,
    Modelo\UsuarioModelo;

class UsuarioController extends Controller
{
    public static function index()
    {

        $usr = new UsuarioDAO;
        $lista = $usr->getAllRows();

        include PATH_INFRA . 'Functions.php';
        include PATH_VIEW . 'usuario/listar_usuarios.php';
    }

    public static function editar()
    {
        var_dump($_GET);

        if (isset($_GET['id'])) {
            $usr = new UsuarioDAO;
            $_SESSION['usuario'] = $usr->getById($_GET['id']);
        }

        var_dump($_POST);

        if (isset($_POST['cod'])) {
            UsuarioModelo::validar();
        };

        include PATH_VIEW . 'usuario/editar_usuario.php';
    }
}
