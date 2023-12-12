<!--
//?php
//namespace php_code\app;
//use php_code\dao\DataObj;
//$lista = new DataObj();
//?-->
<!doctype html>
<html>

<head>
    <title>Teste Lista Usuários com Store Procedures</title>
    <meta charset="UTF-8">
</head>

<body>
    <?php
    require '../dao/usuarios.php';
    $lista = new DataObj();
    //      foreach($result->buscaUser('andersson moura') as $row){
    foreach ($lista->buscaAllUsers() as $row) {
        printf("%s %s %s <br/>", $row['id'], $row['nome'], $row['email']);
    }
    $lista = null;
    ?>
</body>

</html>