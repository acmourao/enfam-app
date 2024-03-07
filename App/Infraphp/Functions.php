<?php
class Functions
{
    public static function alinhadir($valor)
    {
        $val = number_format($valor, 2, ',', '.');
        return str_pad($val, 9, " ", STR_PAD_LEFT);
    }
    public static function formatcpf($cpf)
    {
        $parte_um = substr($cpf, 0, 3);
        $parte_dois = substr($cpf, 3, 3);
        $parte_tres = substr($cpf, 6, 3);
        $parte_quatro = substr($cpf, 9, 2);
        return "$parte_um.$parte_dois.$parte_tres-$parte_quatro";
    }
}
