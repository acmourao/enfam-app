<?php

namespace Controller;

use DAO\IrpfDAO;

class IrpfController extends Controller
{
    public static function index()
    {
        parent::isProtected();

        $usr = new IrpfDAO;
        $item = $usr->getByCpf($_GET['cpf']);
        //var_dump($_GET, $item);
        if ($item != NULL) include PATH_INFRA . 'printpdf.php';
    }
}
