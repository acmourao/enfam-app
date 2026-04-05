<?php

namespace DAO;

use Model\UfModel;

class UfDAO extends DAO
{

    /**
     * Retorna todos os registros da tabela 
     */
    function getAll()
    {
        return parent::select("SELECT * FROM educaenfam.estados", UfModel::class);
    }

    /**
     * Retorna um registros por Id
     */

    function get($sigla)
    {
        return parent::where("SELECT * FROM educaenfam.estados WHERE sigla = ?", [$sigla], UfModel::class);
    }
}
