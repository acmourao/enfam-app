<?php include_once '../../includes/cabecalho.php' ?>

<main>
    <div class="container-xxl bd-gutter mt-3 bd-layout" ng-controller="usuarioController"
        ng-init="buscarById(<?php echo $_GET['id']; ?>)">
        <h4>
            Cadastro do Usuário - {{usuario.id}} - {{usuario.nome}}
        </h4>

        <form class="row g-3 needs-validation" novalidate>
            <div class="col-md-4">
                <label for="validationCustom01" class="form-label">CPF</label>
                <input type="text" class="form-control" id="validationCustom01" ng-model="usuario.cpf" required>
                <div class="valid-feedback">
                    Tudo ok!
                </div>
                <div class="invalid-feedback">
                    forneça um válido cpf com no max 11 caracteres.
                </div>
            </div>
            <div class="col-md-4">
                <label for="validationCustom02" class="form-label">Nome</label>
                <input type="text" class="form-control" id="validationCustom02" ng-model="usuario.nome" required>
                <div class="valid-feedback">
                    Tudo ok!
                </div>
                <div class="invalid-feedback">
                    Nomes devem conter no máximo 120 caracteres.
                </div>
            </div>
            <div class="col-md-4">
                <label for="validationCustomUsername" class="form-label">eMail</label>
                <div class="input-group has-validation">
                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                    <input type="text" class="form-control" id="validationCustomUsername"
                        aria-describedby="inputGroupPrepend" ng-model="usuario.email" required>
                    <div class="invalid-feedback">
                        indique um email.
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <label for="validationCustom03" class="form-label">Telefone</label>
                <input type="text" class="form-control" id="validationCustom03" ng-model="usuario.telefone" required>
                <div class="invalid-feedback">
                    Informe um telefone válido.
                </div>
            </div>
            <div class="col-md-3">
                <label for="validationCustom04" class="form-label">Naturalidade</label>
                <select class="form-select" id="validationCustom04" required>
                    <option selected disabled value="">:. Selecione .:</option>
                    <option>Acre</option>
                    <option>Bahia</option>
                    <option>Aracajú</option>
                    <option>DF</option>
                    <option>Pará</option>
                </select>
                <div class="invalid-feedback">
                    Selecione um Estado.
                </div>
            </div>
            <div class="col-md-3">
                <label for="validationCustom05" class="form-label">Nascimento</label>
                <input type="text" class="form-control" id="validationCustom05" ng-model="usuario.nascimento" required>
                <div class="invalid-feedback">
                    data de nascimento inválida!
                </div>
            </div>
            <div class="col-12">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                    <label class="form-check-label" for="invalidCheck">
                        Confirmo todas as informações prestadas, na forma da lei.
                    </label>
                    <div class="invalid-feedback">
                        Você deve confirmar suas informações antes de enviar.
                    </div>
                </div>
            </div>
            <div class="col-12">
                <button class="btn btn-primary" type="submit">Salvar</button>
            </div>
        </form>
</main>

<?php include_once '../../includes/rodape.php' ?>