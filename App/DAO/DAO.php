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

    function select($qry, $class)
    {
        $stmt = self::$db->query($qry);
        return $stmt->fetchAll(PDO::FETCH_CLASS, $class);
    }

    function where($qry, $param, $class)
    {
        $stmt = self::$db->prepare($qry);
        $stmt->execute([$param]);
        return $stmt->fetchAll(PDO::FETCH_CLASS, $class);
    }

    function update($qry, $param)
    {
        $stmt = self::$db->prepare($qry);
        return $stmt->execute($param);
    }
}
