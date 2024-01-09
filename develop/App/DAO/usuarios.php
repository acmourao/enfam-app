<?php

namespace dao;

use db\ConnectaDb;

require_once "../db/database.php";

class DataObj extends ConnectaDb
{
    public function buscaAllUsers()
    {
        return parent::recuperaQuery("SELECT * FROM educaenfam.vwUsuarios");
    }

    public function buscaUser($nome)
    {
        return parent::parametrosQuery("call buscaUser(?)", $nome);
    }

    public function insertUser($json)
    {
        return parent::parametrosQuery("call insertUser(?)", $json);
    }
}
