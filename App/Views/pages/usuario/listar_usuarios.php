<?php include_once '../../includes/cabecalho.php' ?>

<main>
    <div class="container mt-3" ng-controller="userController">
        <h4>
            Lista de Usuários
        </h4>
        <table class="table table-hover table-striped table-bordered" id="usuariosTable">
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
                <tr ng-repeat="usuario in lista_usuarios track by usuario.id">
                    <td class="table-active"> {{ usuario.id }}</td>
                    <td class="table-light"> {{ usuario.nome }} </td>
                    <td class="table-warning"> {{ usuario.cpf }}</td>
                    <td class="table-info"> {{ usuario.email }} </td>
                    <td class="table-success"> {{ usuario.telefone }} </td>
                    <td class="table-danger"> {{ usuario.nascimento | validate }} </td>
                </tr>
            </tbody>
        </table>
    </div>
</main>

<?php include_once '../../includes/rodape.php' ?>