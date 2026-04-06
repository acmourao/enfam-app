<?php include_once '../../includes/cabecalho.php' ?>

<main>
    <div class="container-xxl bd-gutter mt-3 bd-layout" ng-controller="usuarioController"
        ng-init="buscarUserById(<?php echo $_GET['id']; ?>)">
        <h4>
            Cadastro do Usuário - {{usuario.id}} - {{usuario.nome}}
        </h4>

        <form ng-submit="salvarUsuario()" class="row g-3 needs-validation">
            <div class="col-md-4">
                <label for="cpf" class="form-label">CPF</label>
                <input type="text" class="form-control" id="cpf" ng-model="usuario.cpf" required>
                <div class="invalid-feedback">
                    forneça um válido cpf com no max 11 caracteres.
                </div>
            </div>
            <div class="col-md-4">
                <label for="nome" class="form-label">Nome</label>
                <input type="text" class="form-control" id="nome" ng-model="usuario.nome" required>
                <div class="invalid-feedback">
                    Nomes devem conter no máximo 120 caracteres.
                </div>
            </div>
            <div class="col-md-4">
                <label for="email" class="form-label">eMail</label>
                <div class="input-group has-validation">
                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                    <input type="text" autocomplete="email" class="form-control" id="email"
                        aria-describedby="inputGroupPrepend" ng-model="usuario.email" required>
                    <div class="invalid-feedback">
                        indique um email.
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <label for="telefone" class="form-label">Telefone</label>
                <input type="text" class="form-control" id="telefone" ng-model="usuario.telefone" required>
                <div class="invalid-feedback">
                    Informe um telefone para contato.
                </div>
            </div>
            <div class="col-md-3">
                <label for="remember_token" class="form-label">remember_token</label>
                <select ng-model="usuario.remember_token" class="form-select" id="remember_token" required>
                    <option selected disabled value="">:. Selecione .:</option>
                    <option ng-repeat="uf in ufs" value="{{uf.sigla}}">
                        {{uf.estado}}
                    </option>
                </select>
                <div class="invalid-feedback">
                    Informe o seu estado de origem.
                </div>
            </div>
            <div class="col-md-3">
                <label for="nascimento" class="form-label">Nascimento</label>
                <input type="date" mysql-date class="form-control" id="nascimento" ng-model="usuario.nascimento" required>
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