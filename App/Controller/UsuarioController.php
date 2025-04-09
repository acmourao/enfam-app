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
    public static function get($id)
    {
        parent::isProtected();

        $uno = (new UsuarioDAO)->get($id);
        parent::jsonOutput($uno);
    }
    public static function post()
    {
        parent::isProtected();

        parent::jsonOutput((new UsuarioDAO)->post());
    }
}
