<?php include_once '../../includes/cabecalho.php' ?>

<main>
    <div class="container-xxl bd-gutter mt-3 bd-layout" ng-controller="userController">
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
                <tr ng-repeat="u in lista_usuarios track by u.id">
                    <td class="table-active"> {{ u.id }}</td>
                    <td class="table-light"> {{ u.nome }} </td>
                    <td class="table-warning"> {{ u.cpf }}</td>
                    <td class="table-info"> {{ u.email }} </td>
                    <td class="table-success"> {{ u.telefone }} </td>
                    <td class="table-danger"> {{ u.nascimento | validate }} </td>
                </tr>
            </tbody>
        </table>
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
            Launch static backdrop modal
        </button>

        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        {{ usuario.id }} {{ usuario.nome }}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Understood</button>
                    </div>
                </div>
            </div>
        </div>

</main>

<?php include_once '../../includes/rodape.php' ?>