<?php

namespace Controller;

use DAO\EstadosDAO;

class EstadosController extends Controller
{
    public static function index()
    {
        parent::isProtected();
        parent::jsonOutput((new EstadosDAO)->getAll());
    }
    public static function get($sigla)
    {
        parent::isProtected();
        parent::jsonOutput((new EstadosDAO)->get($sigla));
    }
}
