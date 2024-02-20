<?php

class Teste
{
    // Properties
    public $msg = "olá mundo - passo 9!";

    public function __construct()
    {
        $this->msg = $this->msg . " -->> " . __FILE__;
    }


    // Methods
    function set_msg($msg)
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
