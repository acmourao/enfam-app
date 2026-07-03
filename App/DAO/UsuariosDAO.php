<?php

namespace DAO;

use DateTime;
use DateTimeFormatter;
use LocalDate;

class UsuariosDAO extends DAO
{

    /**
     * Retorna todos os registros da tabela 
     */
    function getAll()
    {
        return parent::select("SELECT * FROM educaenfam.vwusuarios limit " . $GLOBALS["MAX_LISTA"]);;
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
        $mysqldate = null;
        if (isset($request->nascimento)) {
            $phpdate = strtotime($request->nascimento);
            $mysqldate = date('Y-m-d', $phpdate);
        }
        return parent::update("UPDATE educaenfam.usuarios SET cpf = ?, nome = ?, email = ?, telefone = ?, remember_token = ?, nascimento = ? " .
            "WHERE id = ?", [$request->cpf, $request->nome, $request->email, $request->telefone, $request->remember_token, $mysqldate, $request->id]);
    }

    public function filtro($nome)
    {
        return parent::where("call buscaUser(?)", $nome);
    }
}
