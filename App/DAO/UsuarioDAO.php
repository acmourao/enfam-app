<?php

namespace DAO;

use Model\UsuarioModel;

class UsuarioDAO extends DAO
{

    /**
     * Retorna todos os registros da tabela 
     */
    function getAll()
    {
        return parent::select("SELECT * FROM educaenfam.vwusuarios limit " . $GLOBALS["MAX_LISTA"], UsuarioModel::class);
    }

    /**
     * Retorna um registros por Id
     */

    function get($id)
    {
        return parent::where("SELECT * FROM educaenfam.vwusuarios WHERE id = ?", [$id], UsuarioModel::class);
    }

    function save($request)
    {
        return parent::update("UPDATE educaenfam.usuarios SET nascimento = ? WHERE id = ?", [$request->nascimento, $request->id]);
    }

    public function filtro($nome)
    {
        return parent::where("call buscaUser(?)", $nome, UsuarioModel::class);
    }
}
