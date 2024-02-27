<?php

try {

    $dsn = 'mysql:host=mysql;dbname=sys;charset=UTF8';
    $conexao = new PDO($dsn, 'root', 'root', [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    $conexao->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "SET NAMES 'utf8'");

    //$conexao->beginTransaction();

    $filename = "C:\Users\amourao\Documents\BPFDEC.txt";
    $sql = "SELECT cpf FROM irpf.2023 where cpf= ?";

    // obtém todas as linhas do arquivo
    $linhas = file($filename, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    // percorre todas as linhas e as exibe na página
    foreach ($linhas as $num_linha => $linha) {
        $row = explode("|", $linha);
        $total = 0;
        if ($row[0] == "BPFDEC") {
            //CPF + NOME
            $CPF = $row[1];
            $NOME = $row[2];
            var_dump($CPF, $NOME);
            $RTRT = 0;
            $RTIRF = 0;
            $RTPO = 0;
            $stmt = $conexao->prepare($sql);
            $stmt->execute([$CPF]);
            if (is_array($stmt->fetchAll())) {
                $sql = "INSERT INTO irpf.2023 (cpf, nome, RTRT, RTIRF, RTPO) VALUES (?, ?, ?, ?, ?)";
            } else {
                $sql = "UPDATE irpf.2023 SET RTRT = ?, RTIRF = ?, RTPO = ? WHERE cpf = ?";
            }
            var_dump($sql);
            die();
        } else {
            foreach ($row as $chave => $valor) {
                if ($valor != 0) {
                    $total += (int) $valor;
                }
            }
            var_dump($row[0], $total);
            if ($total > 0) {
                if ($row[0] == "RTRT") {
                    $RTRT = $total * .01;
                }
                if ($row[0] ==  "RTIRF") {
                    $RTIRF = $total * .01;
                }
                if ($row[0] ==  "RTPO") {
                    $RTPO = $total * .01;
                }
            }
        }
        var_dump($RTRT, $RTIRF, $RTPO);

        if ($num_linha > 30) {
            die();
        }

        //        $result[] = [$CPF, $NOME, number_format($total * .01, 2, ',', '.')];
    }

    //     $sql = "UPDATE data SET Age='28' WHERE id=201"; 
    //            $sql = "INSERT INTO irpf.2023 (cpf, nome, RTRT, RTIRF, RIDAC) VALUES (?, ?, 0, 0, ?)";
    //            $stmt = $conexao->prepare($sql);
    //            $stmt->execute([$CPF, $NOME, $RIDAC]);

    //    $conexao->commit();

    echo "Deu certo... Dados atualizados pela ..: " . $dsn;
} catch (Exception $ex) {

    echo $ex->getMessage();
}

//            $RIDAC = number_format($total * .01, 2, ',', '.');
