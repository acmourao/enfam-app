<!doctype html>
<html>

<head>
    <title>Teste Lista Usuários com Store Procedures</title>
    <meta charset="UTF-8">
</head>

<body>
    <?php
    require '../dao/usuarios.php';

    $result = new Dao();

    //      foreach($result->buscaUser('andersson moura') as $row){
    foreach ($result->buscaAllUsers() as $row) {
        printf("%s %s %s <br/>", $row['id'], $row['nome'], $row['email']);
    }
    $result = null;
    ?>
</body>

</html>