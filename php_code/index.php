<?php
require 'modelo.php';
?>
<!doctype html>
<html>
    <head>
        <title>Teste Lista Usuários com Store Procedure</title>
        <meta charset="UTF-8">
    </head>
    <body>
    <?php
        foreach($result as $row){
            printf("%s %s <br/>", $row['id'], $row['nome']);
        }
    ?>
    </body>
</html>