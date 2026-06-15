<?php

class Teste
{
    // Properties
    public $msg = "olá mundo!";

    public function __construct()
    {
        $this->msg = $this->msg . " -->> " . __FILE__;
    }


    // Methods
    function set_msg(mixed $msg)
    {
        $this->msg = $msg;
    }
    function get_msg()
    {
        return $this->msg;
    }
}

$retorno = new Teste();

echo $retorno->get_msg();

$dir = '../'; // Diretório atual
$files = scandir($dir);
echo "<h1>Conteúdo do Diretório Anterior</h1><ul>";
foreach ($files as $file) {
    if ($file != '.' && $file != '..') {
        echo "<li><a href='$file'>$file</a></li>";
    }
}
echo "</ul>";
