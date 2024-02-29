<?php

try {

    $dsn = 'mysql:host=mysql;dbname=sys;charset=UTF8';
    $conexao = new PDO($dsn, 'root', 'root', [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    $conexao->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "SET NAMES 'utf8'");

    //$conexao->beginTransaction();

    $filename = "C:\Users\amourao\Documents\BPFDEC.txt";
    $findCPF = "SELECT cpf FROM irpf.2023 where cpf= ?";

    $RTRT = 0;
    $RTIRF = 0;
    $RTPO = 0;

    // obtém todas as linhas do arquivo
    $linhas = file($filename, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    // percorre todas as linhas e as exibe na página
    foreach ($linhas as $num_linha => $linha) {
        $row = explode("|", $linha);
        $total = 0;
        if (($row[0] == "BPFDEC") || ($row[0] == "FIM")) {

            if (($RTRT > 0 || $RTIRF > 0 || $RTPO > 0) && $num_linha > 0) {
                $stmt = $conexao->prepare($sql);
                if (substr($sql, 0, 3) == "INS") {
                    $stmt->execute([$CPF, $NOME, $RTRT, $RTIRF, $RTPO]);
                } else {
                    $stmt->execute([$RTRT, $RTIRF, $RTPO, $CPF]);
                }
                echo $sql;
                //var_dump([$CPF, $NOME, $RTRT, $RTPO, $RTIRF]);
                $RTRT = 0;
                $RTPO = 0;
                $RTIRF = 0;
            }
            if ($row[0] != "FIM") {
                //CPF + NOME
                $CPF = $row[1];
                $NOME = $row[2];
                var_dump($CPF, $NOME);
                $stmt = $conexao->prepare($findCPF);
                $stmt->execute([$CPF]);
                $lista = $stmt->fetchAll();
                if ($lista == NULL) {
                    $sql = "INSERT INTO irpf.2023 (cpf, nome, RTRT, RTPO, RTIRF) VALUES (?, ?, ?, ?, ?)";
                } else {
                    $sql = "UPDATE irpf.2023 SET RTRT = ?, RTPO = ?, RTIRF = ? WHERE cpf = ?";
                }
                var_dump($sql);
            }
        } else {
            foreach ($row as $chave => $valor) {
                if ($valor != 0) {
                    $total += (int) $valor;
                }
            }
            var_dump($row[0]);
            if ($total > 0) {
                if ($row[0] == "RTRT") {
                    $RTRT = $total * .01;
                }
                if ($row[0] ==  "RTPO") {
                    $RTPO = $total * .01;
                }
                if ($row[0] ==  "RTIRF") {
                    $RTIRF = $total * .01;
                }
            }
        }
    }
    $conexao->commit();

    echo "Deu certo... Dados atualizados pela ..: " . $dsn;
} catch (Exception $ex) {

    echo $ex->getMessage();
}

//            $RIDAC = number_format($total * .01, 2, ',', '.');
