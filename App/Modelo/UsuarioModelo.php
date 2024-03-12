<?php

namespace Modelo;
//use DAO\UsuarioDAO;

abstract class UsuarioModelo
{
    public static function validar()
    {
        $erros = array();
        $nome = filter_input(INPUT_POST, 'nome', FILTER_SANITIZE_SPECIAL_CHARS);
        if (strlen($nome) < 3) {
            $erros[] = 'Nome não pode ser em branco!';
        }

        $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $erros[] = 'Email precisa ser informado!';
        };

        if (!empty($erros)) {
            foreach ($erros as $erro) :
                echo "<li> $erro </li>";
            endforeach;
        } else {
            self::gravar();
        };
    }

    public static function gravar()
    {
        var_dump($_POST);

        // if (isset($_GET['id'])) {
        //     $usr = new UsuarioDAO;
        //     $item = $usr->getById($_GET['id']);
        //     $nome = strtoupper($item['nome']);
        //     $email = $item['email'];
        //     echo "Nome gravado foi $nome e contato $email<br><hr>";
        // }
        echo '<br><hr>';
        echo '<a href="/">Voltar</a>';
        //header("Location: /usuario");
    }
}
