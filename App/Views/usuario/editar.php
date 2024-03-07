<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário</title>
</head>
<?php

if (isset($item)) {
    //    var_dump($item);
    $nome = $item['nome'];
    $email = $item['email'];
}

if (isset($_POST['enviar-formulario'])) {
    $erros = array();
    $nome = filter_input(INPUT_POST, 'nome', FILTER_SANITIZE_SPECIAL_CHARS);
    if (strlen($nome) == 0) {
        $erros[] = 'Nome não pode ser em branco!';
    }

    $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $erros[] = 'Email precisa ser informado!';
    };

    if (!empty($erros)) {
        foreach ($erros as $erro) :
            echo "<li> $erro </li>";
        endforeach;
    } else {
        header("Location: usuario.gravar?nome=$nome&email=$email");
    };
};
$_SESSION['usuario_logado'] = false;
?>

<body>
    <form action="/usuario.editar" method="post">
        <div>
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" value="<?php echo $nome ?>" />
        </div>
        <div>
            <label for="email">E-mail:</label>
            <input type="email" id="email" name="email" value="<?php echo $email ?>" />
        </div>

        <button type="submit" name="enviar-formulario">Enviar</button><br>

    </form>

</body>

</html>