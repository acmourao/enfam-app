<?php

namespace DAO;

class UsuariosDAO extends DAO
{

    /**
     * Retorna todos os registros da tabela 
     */
    function getAll()
    {
        return parent::select("SELECT * FROM educaenfam.vwusuarios limit " . $GLOBALS["MAX_LISTA"]);
    }

    /**
     * Retorna um registros por Id
     */

    function get($id)
    {
        return parent::where("SELECT * FROM educaenfam.vwusuarios WHERE id = ?", [$id]);
    }

    function save($request)
    {
        return parent::update("UPDATE educaenfam.usuarios SET remember_token = ? WHERE id = ?", [$request->remember_token, $request->id]);
    }

    public function filtro($nome)
    {
        return parent::where("call buscaUser(?)", $nome);
    }
}
