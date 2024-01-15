<?php

namespace App\DAO;

class UsuarioDAO extends DAO
{

    /**
     * Retorna todos os registros da tabela 
     */
    function getAllRows()
    {
        return parent::recuperaQuery("SELECT * FROM educaenfam.vwUsuarios limit 100");
    }

    /**
     * Retorna um registros por Id
     */

    function getById($id)
    {
        return parent::parametrosQuery("SELECT * FROM educaenfam.vwUsuarios WHERE id = ?", $id);
    }

    public function buscaUser($nome)
    {
        return parent::parametrosQuery("call buscaUser(?)", $nome);
    }
}
