<?php

namespace Controller;

use DAO\UsuariosDAO;

class UsuariosController extends Controller
{
    public static function index()
    {
        parent::isProtected();

        parent::jsonOutput((new UsuariosDAO)->getAll());
    }
    public static function get($id)
    {
        parent::isProtected();

        parent::jsonOutput((new UsuariosDAO)->get($id));
    }
    public static function save()
    {
        parent::isProtected();
        return parent::jsonOutput((new UsuariosDAO)->save(parent::request()));
    }
}
