<?php

require "../db/database.php";

// namespace develop\dao;
// use develop\db\ConnectaDb;

class DataObj extends ConnectaDb
{

    public function __construct()
    {
        parent::__construct();
    }

    public function buscaAllUsers()
    {
        $stmt = parent::query("SELECT * FROM educaenfam.vwUsuarios");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function buscaUser($nome)
    {
        $stmt = parent::prepare("call buscaUser(?)");
        $stmt->execute([$nome]);
        return $stmt->fetchAll();
    }
}
