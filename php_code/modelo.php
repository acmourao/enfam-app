<?php

require 'config.php';

try {
	if ($pdo) {
        $nome = 'ándersson';
        // Armazena o resultado em um objeto que vamos saída mais tarde em nossa HTML
        //$result = $pdo->query('call buscaUser(?);');
        $stmt = $pdo->prepare("call buscaUser(?);");
        $stmt->bindValue(1, $nome);
        $stmt->execute();        
	}
    } catch (PDOException $e) {
    	echo $e->getMessage();
    }
    // fetch all rows into an array.
    $result = $stmt->fetchAll();
    $stmt = null;
?>