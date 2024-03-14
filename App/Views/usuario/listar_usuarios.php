<?php
include PATH_VIEW . 'includes/cabecalho.php';
?>

<main>
    <section class="text-center container-fluid">
        <span class="badge badge-pill bg-primary">
            <b5>Lista de Usuários</h5>
        </span>
    </section>
    <div class="navbar">
        <div class="container-fluid">
            <table class="table table-sm table-hover table-border">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Cod</th>
                        <th scope="col-lg-6">Nome:</th>
                        <th scope="col">Email:</th>
                        <th class="align-middle text-center" scope="col">CPF:</th>
                        <th scope="col">Ações</th>
                        <th scope="col">Telefone:</th>
                        <th scope="col">Nascimento:</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($lista as $row) : ?>
                        <tr>
                            <td class="table-active"> <?= $row['id'] ?> </td>
                            <td> <?= $row['nome'] ?> </td>
                            <td> <?= $row['email'] ?> </td>
                            <td class="table-warning align-middle text-center"> <?= Functions::formatcpf($row['cpf']) ?> </td>
                            <td>
                                <i onclick="location.href = '/irpf?cpf=<?= $row['cpf'] ?>'" class="bi bi-filetype-pdf align-middle text-center" style="font-size: 18px; color: rgb(13, 204, 140);"></i>
                                <i onclick="location.href = '#'" class="bi bi-blockquote-left align-middle text-center" style="font-size: 18px; color: rgb(13, 204, 140);"></i>
                                <i onclick="setDadosForm(<?= $row['id'] ?>)" data-bs-toggle="modal" data-bs-target="#exampleModal" class="bi bi-box-arrow-in-up-right align-middle text-center" style="font-size: 18px; color: rgb(13, 204, 140);"></i>
                                <!-- <i onclick="location.href = '/usuario.editar?id=<= $row['id'] ?>'" class="bi bi-box-arrow-in-up-right align-middle text-center" style="font-size: 18px; color: rgb(13, 204, 140);"></i> -->
                            </td>
                            <td> <?= $row['telefone'] ?> </td>
                            <td> <?= $row['nascimento'] ?> </td>
                        </tr>
                    <?php endforeach ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Janela Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Minha janela modal</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
                </div>
                <div class="modal-body">
                    <form id="meu-form" method="post" action="/usuario.editar">
                        <div class="mb-3">
                            <label for="cod" class="form-label">Cod:</label>
                            <input type="text" class="form-control" id="cod" name="cod" value="<?= $row['id'] ?>" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="nome" class="form-label">Nome:</label>
                            <input type="text" class="form-control" id="nome" name="nome" value="<?= $row['nome'] ?>">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">E-mail:</label>
                            <input type="email" class="form-control" id="email" name="email" value="<?= $row['email'] ?>">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-primary" onclick="submitForm()">Enviar</button>
                </div>
            </div>
        </div>
    </div>

</main>

<!-- Script para enviar o formulário -->
<script>
    function submitForm() {
        // alert("Dados serão gravados!");
        //var minhaVar = $('#exampleModal').data('var');
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "id");
        hiddenField.setAttribute("value", "<?= $row['id'] ?>");
        document.getElementById("meu-form").appendChild(hiddenField);
        document.getElementById("meu-form").submit();
    }

    function setDadosForm(dados) {
        alert(dados);
    }
</script>

<?php include PATH_VIEW . 'includes/rodape.php' ?>