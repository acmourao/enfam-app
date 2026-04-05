<?php

namespace DAO;

class EstadosDAO extends DAO
{

    /**
     * Retorna todos os registros da tabela 
     */
    function getAll()
    {
        return parent::select("SELECT * FROM educaenfam.estados");
    }

    /**
     * Retorna um registros por Id
     */

    function get($sigla)
    {
        return parent::where("SELECT * FROM educaenfam.estados WHERE sigla = ?", [$sigla]);
    }
}
