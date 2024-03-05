<?php

namespace Controller;

use DAO\UsuarioDAO;

class UsuarioController extends Controller
{
    public static function index()
    {
        parent::isProtected();

        $usr = new UsuarioDAO;
        $lista = $usr->getAllRows();

        include PATH_MODEL . 'FPDFExt.php';
        include PATH_VIEW . 'modulos/usuario/listar_usuarios.php';
    }
}
