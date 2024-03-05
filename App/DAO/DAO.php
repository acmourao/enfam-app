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

    function QueryAll($qry)
    {
        $stmt = self::$conn->query($qry);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    function QueryMany($qry, $params)
    {
        $stmt = self::$conn->prepare($qry);
        $stmt->execute([$params]);
        return $stmt->fetchAll();
    }

    function QueryUnique($qry, $params)
    {
        $stmt = self::$conn->prepare($qry);
        $stmt->execute([$params]);
        return $stmt->fetch();
    }

    function UpdatePost($id, $table)
    {
        $qry = "UPDATE $table SET ";
        $params = array();
        // Iterate $_POST variables
        foreach ($_POST as $key => $value) {
            // Append a new SET key/value pair
            $qry .= "$key = :$key, ";
            // You're using prepared qrys, right?
            $params[$key] = $value;
        }
        // Cut off last comma and append WHERE clause
        $qry = substr($qry, 0, -2) . " WHERE id = :id";
        // Store id for prepared qry
        $params['id'] = $id;
        // Prepare the query
        // $pdo->prepare($qry);
        $stmt = self::$conn->prepare($qry);
        // Execute with parameters
        //$result = $pdo->execute($params);
        return $stmt->execute([$params]);
    }
}
