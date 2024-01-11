<?php

namespace App\DAO;

use PDO;
use PDOException;

class ConnectaDb extends PDO
{

    private string $user = 'root';
    private string $password = 'root';

    // Conectar a um banco de dados de teste

    private $dsn = "mysql:host=mysql;dbname=educaenfam;charset=UTF8";

    public function __construct()
    {
        try {
            parent::__construct($this->dsn, $this->user, $this->password, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
            $this->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "SET NAMES 'utf8'");
            //echo "Connected to the database successfully !!<br/><br/>";
        } catch (PDOException $e) {
            die($e->getMessage());
        }
    }

    public function recuperaQuery($qry)
    {
        $stmt = parent::query($qry);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function parametrosQuery($qry, $param)
    {
        $stmt = parent::prepare($qry);
        $stmt->execute([$param]);
        return $stmt->fetchAll();
    }
}
