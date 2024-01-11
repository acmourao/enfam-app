<?php include PATH_VIEW . 'includes/cabecalho.php' ?>

<main class="container mt-3">

    <h4>
        Lista de Usuários
    </h4>

    <table class="table table-hover mt-3">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Id</th>
                <th scope="col-lg-6">Nome:</th>
                <th scope="col">Email:</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($lista->buscaAllUsers() as $row) : ?>
                <tr>
                    <td> <?= $row['id'] ?> </td>
                    <td> <?= $row['nome'] ?> </td>
                    <td> <?= $row['email'] ?> </td>
                </tr>
            <?php endforeach ?>
        </tbody>
    </table>
</main>

<?php include PATH_VIEW . 'includes/rodape.php' ?>