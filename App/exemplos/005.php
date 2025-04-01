<?php
header('Content-type: application/json');

$nome = isset($_GET['nome']) && is_string($_GET['nome']) ? $_GET['nome'] : null;

$lista_json = array('nome' => $nome, 'email' => $_GET['email']);

echo json_encode($lista_json, JSON_PRETTY_PRINT);
