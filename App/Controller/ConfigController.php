<?php

namespace Controller;

use DAO\UfDAO;

class ConfigController extends Controller
{
    public static function index()
    {
        parent::isProtected();
        parent::jsonOutput((new UfDAO)->getAll());
    }
    public static function get($sigla)
    {
        parent::isProtected();
        parent::jsonOutput((new UfDAO)->get($sigla));
    }
}
