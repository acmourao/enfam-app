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
        return parent::getStatment("SELECT * FROM educaenfam.vwusuarios WHERE id = ?", $id)->fetch();
    }

    public function buscaUser($nome)
    {
        return parent::getStatment("call educaenfam.buscaByNome(?)", $nome)->fetchAll();
    }
}
