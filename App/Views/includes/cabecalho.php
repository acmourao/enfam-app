<!DOCTYPE html>
<html lang="pt-br" data-bs-theme="dark" ng-app="sampleApp">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Aula JS">
    <meta name="author" content="Anderson C M">
    <meta name="generator" content="Anderson 0.84.0">
    <title>W3 Bootstrap 3 Example</title>
    <?php include '/var/www/html/views/includes/css_config.php' ?>

</head>

<body>
    <header>
        <div class="container p-1 bg-primary text-white text-center">
            <img class="img-fluid" src="/assets/img/logo.png" height=auto>
            <h4>Escola Nacional de Formação de Magistrados</h4>
            <div class="row">
                <div class="col-sm-8">
                    <div class="container text-bg-info">
                        <ul class="nav nav-pills">
                            <li class="nav-item">
                                <a class="nav-link active" href="/">Voltar</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">Usuários</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item"
                                            href="/views/pages/usuario/listar_usuarios_api.php">Listar</a>
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
                    <span class="badge bg-success">
                        <a class="btn btn-danger" href="/logoff">
                            <span class="badge bg-success">Logoff</span>
                        </a>
                    </span>
                </div>
            </div>
    </header>