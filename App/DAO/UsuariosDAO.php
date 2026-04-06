<?php

namespace DAO;

use DateTime;

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
        //  $date = $_POST['user_date']; // Automatically formatted as 'YYYY-MM-DD'

        // 1. Create a DateTime object from the specific 'd/m/Y' format
        $date = DateTime::createFromFormat('d/m/Y', $request->nascimento);

        // // 2. Format it to 'Y-m-d' for MySQL
        if ($date) {
            $mysqlDate = $date->format('Y-m-d');
            // Output: 1995-12-31
        } else {
            // Handle the error if the date format is incorrect
            return "Data de nascimento inválida. Use o formato dd/MM/yyyy.";
        }

        return parent::update("UPDATE educaenfam.usuarios SET nascimento = ? WHERE id = ?", [$mysqlDate, $request->id]);
    }

    public function filtro($nome)
    {
        return parent::where("call buscaUser(?)", $nome);
    }
}
