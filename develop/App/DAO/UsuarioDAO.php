<?php

namespace App\DAO;

class UsuarioDAO extends DAO
{

    /**
     * Retorna todos os registros da tabela 
     */
    function getAllRows()
    {
        return parent::recuperaQuery("SELECT * FROM educaenfam.vwUsuarios");
    }

    function getById($id)
    {
        return parent::parametrosQuery("SELECT * FROM educaenfam.vwUsuarios WHERE id = ?", $id);
    }
}
