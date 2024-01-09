<?php

class Autoload
{

    public function __construct()
    {

        spl_autoload_register(function ($class) {

            $path_to_class = str_replace('\\', '/', $class) . '.php';

            if (file_exists($path_to_class))
                require $path_to_class;
        });
    }
}

new Autoload();
