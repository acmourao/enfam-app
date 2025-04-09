<?php

namespace DAO;

use Model\UsuarioModel;

class UsuarioDAO extends DAO
{

    /**
     * Retorna todos os registros da tabela 
     */
    function getAllRows()
    {
        return parent::select("SELECT * FROM educaenfam.vwUsuarios limit " . $GLOBALS["MAX_LISTA"], "Model\UsuarioModel");
    }

    /**
     * Retorna um registros por Id
     */

    function get($id)
    {
        return parent::where("SELECT * FROM educaenfam.vwUsuarios WHERE id = ?", $id, "Model\UsuarioModel");
    }

    function post()
    {
        return parent::update(
            "UPDATE educaenfam.usuarios SET remember_token = ? WHERE id = ?",
            [$$_POST['nome'], $$_POST['id']]
        );
    }

    public function filtro($nome)
    {
        return parent::where("call buscaNomeEmailUserLike(?)", $nome, "Model\UsuarioModel");
    }
}
