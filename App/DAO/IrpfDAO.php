<?php

namespace DAO;

class IrpfDAO extends DAO
{

    /**
     * Retorna todos os registros da tabela 
     */
    function getAllRows()
    {
        return parent::QueryAll("SELECT * FROM irpf.2023 limit " . $GLOBALS["MAX_LISTA"]);
    }

    /**
     * Retorna um registros por Id
     */

    function getByCpf($CPF)
    {
        return parent::QueryUnique("SELECT * FROM irpf.2023 WHERE cpf = ?", $CPF);
    }

    public function buscaIRPF($nome)
    {
        return parent::QueryMany("call buscaIRPF(?)", $nome);
    }
}
