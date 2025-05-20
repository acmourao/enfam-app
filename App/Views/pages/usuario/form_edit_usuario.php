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
                <div class="invalid-feedback">
                    forneça um válido cpf com no max 11 caracteres.
                </div>
            </div>
            <div class="col-md-4">
                <label for="validationCustom02" class="form-label">Nome</label>
                <input type="text" class="form-control" id="validationCustom02" ng-model="usuario.nome" required>
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
                    Informe um telefone para contato.
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
                    Informe o seu estado de origem.
                </div>
            </div>
            <div class="col-md-3">
                <label for="nascimento" class="form-label">Nascimento</label>
                <input type="date" class="form-control" id="nascimento" placeholder="dd/MM/yyyy" ng-model="usuario.nascimento" required>
                <div class="invalid-feedback">
                    Informe a data de nascimento.
                </div>
            </div>
            <div class="col-12">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                    <label class="form-check-label" for="invalidCheck">
                        Confirmo todas as informações prestadas, na forma da lei.
                    </label>
                </div>
            </div>
            <div class="col-12">
                <button class="btn btn-primary" type="submit">Salvar</button>
            </div>
        </form>
</main>

<?php include_once '../../includes/rodape.php' ?>