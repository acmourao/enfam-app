<?php

namespace DAO;

use Model\Model;

class UsuarioDAO extends DAO
{

    /**
     * Retorna todos os registros da tabela 
     */
    function getAll()
    {
        return parent::select("SELECT * FROM educaenfam.vwusuarios limit " . $GLOBALS["MAX_LISTA"], Model::class);
    }

    /**
     * Retorna um registros por Id
     */

    function get($id)
    {
        return parent::where("SELECT * FROM educaenfam.vwusuarios WHERE id = ?", [$id], Model::class);
    }

    function save($request)
    {
        return parent::update("UPDATE educaenfam.usuarios SET nascimento = ? WHERE id = ?", [$request->nascimento, $request->id]);
    }

    public function filtro($nome)
    {
        return parent::where("call buscaUser(?)", $nome, Model::class);
    }
}
