<?php

try {

    $dsn = 'mysql:host=mysql;dbname=sys;charset=UTF8';
    $conexao = new PDO($dsn, 'root', 'root', [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    $conexao->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "SET NAMES 'utf8'");

    $conexao->beginTransaction();

    $filename = "C:\Users\amourao\Documents\RIDAC.txt";
    $result = array();

    // obtém todas as linhas do arquivo
    $linhas = file($filename, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

    // percorre todas as linhas e as exibe na página
    foreach ($linhas as $num_linha => $linha) {
        if ($num_linha % 2 == 0) {
            list($BPFDEC, $CPF, $NOME) = explode("|", $linha);
        } else {
            $total = 0;
            $values = explode("|", $linha);
            foreach ($values as $chave => $valor) {
                if ($chave > 0 && $valor > 0) {
                    $total += (int) $valor;
                }
            }
            $RIDAC = $total * .01;
            $sql = "INSERT INTO irpf.2023 (cpf, nome, RTRT, RTIRF, RIDAC) VALUES (?, ?, 0, 0, ?)";
            $stmt = $conexao->prepare($sql);
            $stmt->execute([$CPF, $NOME, $RIDAC]);
        }
    }

    $conexao->commit();

    echo "Deu certo... Dados inseridos pela ..: " . $dsn;
} catch (Exception $ex) {

    echo $ex->getMessage();
}
