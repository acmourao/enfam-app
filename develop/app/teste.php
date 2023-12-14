<?php

namespace php_code\app;

class Teste
{
    // Properties
    public $msg = "olá mundo!";

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
?>