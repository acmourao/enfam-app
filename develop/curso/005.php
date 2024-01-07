<?php

$nome = strtolower($_GET['nome']);
$email = $_GET['email'];

echo "Nome enviado foi $nome e contato $email<br><hr>";

var_dump($_GET);

echo '<br><hr>';

echo $nome . '<br><hr>';

$b = isset($_GET['nome']) && is_string($_GET['nome']) ? $_GET['nome'] : 'vazio';

echo $b . '<br><hr>';

echo '<a href="/curso/004.php">Voltar</a>';
