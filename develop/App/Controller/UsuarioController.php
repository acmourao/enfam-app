<?php

namespace App\Controller;

use App\Model\DataObj;

class UsuarioController extends Controller
{
    public static function index()
    {
        parent::isProtected();

        $lista = new DataObj();

        include PATH_VIEW . 'modulos/usuario/listar_usuarios.php';
    }
}
