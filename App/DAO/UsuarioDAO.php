<?php

namespace DAO;

class UsuarioDAO extends DAO
{

    /**
     * Retorna todos os registros da tabela 
     */
    function getAllRows()
    {
        return parent::QueryAll("SELECT * FROM educaenfam.vwusuarios limit " . $GLOBALS["MAX_LISTA"]);
    }

    /**
     * Retorna um registros por Id
     */

    function getById($id)
    {
        return parent::QueryUnique("SELECT * FROM educaenfam.vwusuarios WHERE id = ?", $id);
    }

    public function buscaUser($nome)
    {
        return parent::QueryMany("call buscaUser(?)", $nome);
    }
}
