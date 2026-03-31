<?php

namespace Controller;

use DAO\UsuarioDAO;

class UsuarioController extends Controller
{
    public static function index()
    {
        parent::isProtected();

        parent::jsonOutput((new UsuarioDAO)->getAll());
    }
    public static function get($id)
    {
        parent::isProtected();

        parent::jsonOutput((new UsuarioDAO)->get($id));
    }
    public static function save()
    {
        parent::isProtected();

        return parent::jsonOutput((new UsuarioDAO)->save(parent::request()));
    }
}
