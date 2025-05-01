<?php

try {

    //$dsn = "mysql:host=172.18.0.1:3306;dbname=educaenfam;charset=UTF8";
    $dsn = "mysql:host=mysql:3306;dbname=educaenfam;charset=UTF8";
    $conexao = new PDO($dsn, 'root', 'root', [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    $conexao->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "SET NAMES 'utf8'");

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

    echo "Deu certo. Conectado! " . $dsn;
} catch (Exception $ex) {

    echo $ex->getMessage();
}

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

// $sql = 'select
//         product_id,
//         product_name,
//         retail_price                                 
//         from products
//        ';

// $stmt = $pdo->prepare($sql);
// $stmt->execute();

// $products = [];

// while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
//     $products[] = $row;
// }

// $response = [];
// $response['data'] =  $products;

// echo json_encode($response, JSON_PRETTY_PRINT);
