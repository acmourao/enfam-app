<?php

namespace DAO;

use PDO;
use DAO\DB;

class DAO
{
    private static $db;

    function __construct()
    {
        self::$db = DB::getInstance();
    }

    function select($qry)
    {
        $stmt = self::$db->query($qry);
        $retorno = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if (isset($_SESSION["debug"]))
            $retorno[0]["_query"] = $qry;
        return $retorno;
    }

    function where($qry, $param)
    {
        $stmt = self::$db->prepare($qry);
        $stmt->execute($param);
        $retorno = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if (isset($_SESSION["debug"]))
            $retorno[0]["_query"] = $qry;
        return $retorno;
    }

    function update($qry, $param)
    {
        $stmt = self::$db->prepare($qry);
        $retorno = $stmt->execute($param);
        if (isset($_SESSION["debug"]))
            $retorno = $qry;
        return $retorno;
    }
}
