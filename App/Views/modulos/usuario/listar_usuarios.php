<?php include PATH_VIEW . 'includes/cabecalho.php' ?>

<main>
    <section class="py-1 text-center container-fluid">
        <span class="badge bg-success">
            <h5><strong>Lista de Usuários</strong></h5>
        </span>
    </section>
    <div class="navbar shadow-sm">
        <div class="container-fluid">
            <table class="table table-bordered table-sm">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col-lg-6">Nome:</th>
                        <th scope="col">Email:</th>
                        <th scope="col">CPF:</th>
                        <th scope="col">Telefone:</th>
                        <th scope="col">Nascimento:</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($lista as $row) : ?>
                        <tr>
                            <td class="table-active"> <?= $row['id'] ?> </td>
                            <td class="table-light"> <?= $row['nome'] ?> </td>
                            <td class="table-warning"> <?= $row['cpf'] ?> </td>
                            <td class="table-info"> <?= $row['email'] ?> </td>
                            <td class="table-success"> <?= $row['telefone'] ?> </td>
                            <td class="table-danger"> <?= $row['nascimento'] ?> </td>
                        </tr>
                    <?php endforeach ?>
                </tbody>
            </table>
        </div>
    </div>
</main>

<?php include PATH_VIEW . 'includes/rodape.php' ?>