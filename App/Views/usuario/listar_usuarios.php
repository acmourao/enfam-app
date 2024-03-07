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
                        <th scope="col">Id</th>
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
                                <i onclick="location.href = '/'" class="bi bi-blockquote-left align-middle text-center" style="font-size: 18px; color: rgb(13, 204, 140);"></i>
                                <i onclick="location.href = '/usuario.editar?id=<?= $row['id'] ?>'" class="bi bi-box-arrow-in-up-right align-middle text-center" style="font-size: 18px; color: rgb(13, 204, 140);"></i>
                            </td>
                            <td> <?= $row['telefone'] ?> </td>
                            <td> <?= $row['nascimento'] ?> </td>
                        </tr>
                    <?php endforeach ?>
                </tbody>
            </table>
        </div>
    </div>
</main>

<?php include PATH_VIEW . 'includes/rodape.php' ?>