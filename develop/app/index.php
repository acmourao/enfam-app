<?php

namespace app;

use dao\DataObj;

require "../dao/usuarios.php";

$lista = new DataObj();

// foreach($result->buscaUser('andersson moura') as $row){
foreach ($lista->buscaAllUsers() as $row) {
    printf("%s %s %s <br />", $row['id'], $row['nome'], $row['email']);
}
