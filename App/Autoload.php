<?php

class Autoload
{

    public function __construct()
    {

        echo 'Iniciando carga de classes ...<br>';

        spl_autoload_register(function ($class) {

            $path_to_class = str_replace('\\', '/', $class) . '.php';

            var_dump($path_to_class);

            if (file_exists($path_to_class))
                require $path_to_class;
        });
    }
}

new Autoload();