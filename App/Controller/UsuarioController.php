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
        //$_SESSION["usuarios_lista"] = $lista;
        parent::jsonOutput($lista);
        //include PATH_VIEW . 'modulos/usuario/listar_usuarios.php';
    }
}
