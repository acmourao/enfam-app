<?php
try {

    $dsn = 'mysql:host=mysql;dbname=educaenfam;charset=UTF8';
    $conexao = new PDO($dsn, 'appuser', 'appuser', [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    $conexao->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "SET NAMES 'utf8'");
    echo "Connected to the database successfully !!<br/><br/>";

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

    // echo "Deu certo. ID Inserida = " . $dsn;
} catch (Exception $ex) {

    echo $ex->getMessage();
}
