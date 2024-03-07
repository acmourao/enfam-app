<?php

namespace Controller;

class DashboardController extends Controller
{

    public static function index()
    {
        // acessar o sistema somente depois de logado!
        parent::isprotected();
        include PATH_VIEW . 'home.php';
    }
}
