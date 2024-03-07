<?php

namespace Controller;

use DAO\UsuarioDAO;

class UsuarioController extends Controller
{
    public static function index()
    {

        $usr = new UsuarioDAO;
        $lista = $usr->getAllRows();

        include PATH_INFRA . 'Functions.php';
        include PATH_VIEW . 'usuario/listar_usuarios.php';
    }

    public static function editar()
    {
        //var_dump($_GET);

        if (isset($_GET['id'])) {
            $usr = new UsuarioDAO;
            $item = $usr->getById($_GET['id']);
        }
        include PATH_VIEW . 'usuario/editar.php';
    }

    public static function gravar()
    {
        //var_dump($_GET);

        $nome = strtoupper($_GET['nome']);
        $email = $_GET['email'];

        echo "Nome enviado foi $nome e contato $email<br><hr>";

        echo '<a href="/">Voltar</a>';
    }
}
