<?php

namespace Controller;

use DAO\UsuarioDAO;

class UsuarioController extends Controller
{
    public static function index()
    {
        parent::isProtected();

        $lista = (new UsuarioDAO)->getAllRows();
        parent::jsonOutput($lista);
    }
    public static function update($id)
    {
        parent::isProtected();

        $uno = (new UsuarioDAO)->getById($id);
        parent::jsonOutput($uno);
    }
}
