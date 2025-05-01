<?php include_once '../../includes/cabecalho.php' ?>

<main>
    <div class="container-xxl bd-gutter mt-3 bd-layout" ng-controller="userController" ng-init="init()">
        <h4>
            Lista de Usuários
        </h4>
        <table class="table table-hover table-striped table-bordered" id="usuariosTable">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col-lg-6">Nome:</th>
                    <th scope="col">CPF:</th>
                    <th scope="col">Email:</th>
                    <th scope="col">Telefone:</th>
                    <th scope="col">Nascimento:</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="usr in usuarios track by usr.id">
                    <td class="table-active"> {{ usr.id }}</td>
                    <td class="table-light"> {{ usr.nome }} </td>
                    <td class="table-warning"> {{ usr.cpf }}</td>
                    <td class="table-info"> {{ usr.email }} </td>
                    <td class="table-success"> {{ usr.telefone }} </td>
                    <td class="table-danger"> {{ usr.nascimento | validate }} </td>
                    <td>
                        <i ng-click="editar(usr.id)" class="bi bi-blockquote-left align-middle text-center" style="font-size: 18px; color: rgb(13, 204, 140);"></i>
                        <i ng-click="buscarById(usr.id)" data-bs-toggle="modal" data-bs-target="#staticBackdrop" class="bi bi-box-arrow-in-up-right align-middle text-center" style="font-size: 18px; color: rgb(13, 204, 140);"></i>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Avançar Etapa - Usuários</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        {{ usuario.cpf }} - {{ usuario.nome }}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" ng-click="save()">Gravar</button>
                    </div>
                    <div>{{ msg.$$state.value }}</div>
                </div>
            </div>
        </div>

</main>

<?php include_once '../../includes/rodape.php' ?>