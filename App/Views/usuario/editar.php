<?php

include PATH_VIEW . 'includes/cabecalho.php';

$usuario = $_SESSION['usuario'];

$nome = $usuario['nome'];
$email = $usuario['email'];

?>

<main>

    <div class="container mt-3">
        <!-- The Modal -->
        <h4 class="modal-title">Editar Usuário</h4>
        <form action="/usuario.editar" method="post">
            <div>
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" value="<?php echo $nome ?>" />
            </div>
            <div>
                <label for="email">E-mail:</label>
                <input type="email" id="email" name="email" value="<?php echo $email ?>" />
            </div>

            <button type="submit" name="gravar">Enviar</button>

        </form>

    </div>
</main>

<?php include PATH_VIEW . 'includes/rodape.php' ?>