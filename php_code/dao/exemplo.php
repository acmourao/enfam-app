<?php

namespace php_code\dao;

use php_code\app\Teste;

class Exemplo
{
    public static function exemplo()
    {
        return "Teste 2!!!";
    }
}

//$tmp = new Teste();
//echo ($tmp->msg);

echo Exemplo::exemplo();
