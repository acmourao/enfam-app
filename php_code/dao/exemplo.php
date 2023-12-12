<?php

namespace php_code\dao;
use php_code\app\Teste;

class Exemplo
{
    public static function exemplo()
    {
        return "Teste!!!";
    }
}

echo Exemplo::exemplo();

$tmp = new Teste();

echo ($tmp->msg);

?>
