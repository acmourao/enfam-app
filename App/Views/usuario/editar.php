<?php

include PATH_VIEW . 'includes/cabecalho.php';

$usuario = $_SESSION['usuario'];

$nome = $usuario['nome'];
$email = $usuario['email'];

?>

<main>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
        Open modal
    </button>

    <div class="container mt-3">
        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Editar Usuário</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="/usuario.editar" method="post">
                            <div>
                                <label for="nome">Nome:</label>
                                <input type="text" id="nome" name="nome" value="<?php echo $nome ?>" />
                            </div>
                            <div>
                                <label for="email">E-mail:</label>
                                <input type="email" id="email" name="email" value="<?php echo $email ?>" />
                            </div>
                        </form>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger" name="enviar-formulario" data-bs-dismiss="modal">Enviar</button>
                    </div>

                </div>
            </div>
        </div>
    </div>
</main>

<?php include PATH_VIEW . 'includes/rodape.php' ?>