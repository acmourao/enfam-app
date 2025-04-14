<!DOCTYPE html>
<html lang="pt-br" data-bs-theme="dark" ng-app="sampleApp">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Aula JS">
    <meta name="author" content="Anderson C M">
    <meta name="generator" content="Anderson 0.84.0">
    <title>W3 Bootstrap 3 Example</title>
    <?php include_once 'css_config.php' ?>
</head>

<body>
    <header>
        <div class="container p-1 bg-secundary text-white text-center">
            <img class="img-fluid" src="/assets/img/logo.png" height=auto>
            <h4>Escola Nacional de Formação de Magistrados</h4>
            <div class="row">
                <div class="col-sm-8">
                    <div class="container text-bg-dark">
                        <ul class="nav nav-pills">
                            <li class="nav-item">
                                <a class="nav-link active" href="/">Voltar</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">Usuários</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item"
                                            href="/views/pages/usuario/listar_usuarios.php">Listar</a>
                                    </li>
                                    <li><a class="dropdown-item" href="#">Cadastrar</a></li>
                                    <li><a class="dropdown-item" href="#">Autorizar</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Configurações</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link"
                                    href="https://www.enfam.jus.br/institucional/sobre-a-escola/">Contato</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col">
                    <a class="btn btn-dark" href="/logoff">
                        <span class="badge bg-danger">Logoff</span>
                    </a>
                </div>
            </div>
    </header>