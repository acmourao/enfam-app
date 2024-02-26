<?php

$filename = "C:\Users\amourao\Documents\RIDAC.txt";
$result = array();

// obtém todas as linhas do arquivo
$linhas = file($filename, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

// percorre todas as linhas e as exibe na página
foreach ($linhas as $num_linha => $linha) {
    $total = 0;
    if ($num_linha % 2 == 0) {
        list($BPFDEC, $CPF, $NOME) = explode("|", $linha);
        echo "CPF: " . $CPF . " NOME: " . $NOME . "\n";
    } else {
        $values = explode("|", $linha);
        foreach ($values as $chave => $valor) {
            if ($chave > 0 && $valor > 0) {
                $total += (int) $valor;
            }
        }
        echo number_format($total * .01, 2, ',', '.') . "\n";
    }
}
echo "Fim!";
    

//INSERT INTO `irpf`.`2023` (`cpf`, `nome`, `RTRT`, `RTIRF`, `RIDAC`) VALUES (<{cpf: }>, <{nome: }>, <{RTRT: }>, <{RTIRF: }>, <{RIDAC: }>);


// try {

//     $dsn = 'mysql:host=127.0.0.1;dbname=sys;charset=UTF8';
//     $conexao = new PDO($dsn, 'root', 'root', [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
//     $conexao->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "SET NAMES 'utf8'");

    // $conexao->beginTransaction();

    // $sql = "INSERT INTO pessoa (nome) VALUES ('Biancola II - a missao'); ";
    // $stmt = $conexao->prepare($sql);
    // $stmt->execute();

    // $ultima_pessooa = $conexao->lastInsertId();

    // $sql = "INSERT INTO endereco (id_pessoa, logradouro) VALUES (?, 'Rua dos Itapuís'); ";
    // $stmt = $conexao->prepare($sql);
    // $stmt->bindValue(1, $ultima_pessooa);
    // $stmt->execute();

    // $ultimo_endereco = $conexao->lastInsertId();

    // $conexao->commit();

//     echo "Deu certo. ID Inserida = " . $dsn;
// } catch (Exception $ex) {

//     echo $ex->getMessage();
// }

//https://database.guide/6-ways-to-extract-json-data-in-mysql/

// <?php
// try{ 
//     $pdo = new PDO("mysql:host=localhost; 
//                     dbname=Mydb", "root", ""); 
//     $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
// } catch(PDOException $e){ 
//     die("ERROR: Could not connect. " . $e->getMessage()); 
// } 

// try{ 
//     $sql = "UPDATE data SET Age='28' WHERE id=201"; 
//     $pdo->exec($sql); 
//     echo "Records was updated successfully."; 
// } catch(PDOException $e){ 
//     die("ERROR: Could not able to execute .: $sql" . $e->getMessage()); 
// } 
// unset($pdo);