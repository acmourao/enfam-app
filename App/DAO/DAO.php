<?php

namespace DAO;

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
        $stmt->execute();
        return $stmt->fetchAll();
    }

    function where($qry, $param)
    {
        $stmt = self::$db->prepare($qry);
        $stmt->execute([$param]);
        return $stmt->fetchAll();
    }
}
