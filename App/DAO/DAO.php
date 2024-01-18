<?php

namespace DAO;

use DAO\Conexao;


class DAO
{
    private static $conn;

    function __construct()
    {
        self::$conn = Conexao::getInstance();
    }

    function recuperaQuery($qry)
    {
        $stmt = self::$conn->query($qry);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    function parametrosQuery($qry, $param)
    {
        $stmt = self::$conn->prepare($qry);
        $stmt->execute([$param]);
        return $stmt->fetchAll();
    }
}
