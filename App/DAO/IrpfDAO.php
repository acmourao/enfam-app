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
        return parent::getStatment("call irpf.buscaByCpf(?)", $CPF)->fetch();
    }

    public function buscaIRPF($nome)
    {
        return parent::getStatment("call irpf.buscaByNome(?)", $nome)->fetchAll();
    }
}
