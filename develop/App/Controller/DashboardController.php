<?php

namespace App\Controller;

class DashboardController extends Controller
{

    public static function index()
    {
        parent::isProtected();

        // acessar o sistema somente depois de logado!
        include PATH_VIEW . 'home.php';
    }
}
