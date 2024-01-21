<!DOCTYPE html>
<html lang="pt-br">

<head>
    <script src="/assets/js/color-modes.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>W3 Bootstrap 3 Example</title>
    <link rel="stylesheet" href="/assets/dist/css/css@3.css">
    <link href="/assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/dist/css/app.css" rel="stylesheet">
</head>

<body>
    <div class="dropdown position-fixed bottom-0 bd-mode-toggle">
        <button class="btn btn-bd-primary py-2 dropdown-toggle d-flex align-items-center" id="bd-theme" type="button" aria-expanded="false" data-bs-toggle="dropdown" aria-label="Toggle theme (auto)">
            <svg class="bi my-1 theme-icon-active" width="1em" height="1em">
                <use href="#circle-half"></use>
            </svg>
            <span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
        </button>
        <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="bd-theme-text">
            <li>
                <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="light" aria-pressed="false">
                    <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
                        <use href="#sun-fill"></use>
                    </svg>
                    Light
                    <svg class="bi ms-auto d-none" width="1em" height="1em">
                        <use href="#check2"></use>
                    </svg>
                </button>
            </li>
            <li>
                <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="dark" aria-pressed="false">
                    <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
                        <use href="#moon-stars-fill"></use>
                    </svg>
                    Dark
                    <svg class="bi ms-auto d-none" width="1em" height="1em">
                        <use href="#check2"></use>
                    </svg>
                </button>
            </li>
            <li>
                <button type="button" class="dropdown-item d-flex align-items-center active" data-bs-theme-value="auto" aria-pressed="true">
                    <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
                        <use href="#circle-half"></use>
                    </svg>
                    Auto
                    <svg class="bi ms-auto d-none" width="1em" height="1em">
                        <use href="#check2"></use>
                    </svg>
                </button>
            </li>
        </ul>
    </div>
    <header>
        <div class="album bg-body-tertiary data-bs-theme=dark">
            <div class="navbar navbar-dark bg-dark shadow-sm">
                <div class="container">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
                        <a href="/">
                            <span class="navbar-toggler-icon"></span>
                        </a>
                    </button>
                    <img class="img-fluid" src="/assets/img/logo.png" height=auto>
                    <div class="navbar-brand d-flex align-items-center">
                        <strong>Escola Nacional de Formação de Magistrados</strong>
                    </div>
                    <a href="#">
                        <span class="badge bg-success">Login</span>
                    </a>
                </div>
            </div>
            <div class="container-fluid text-center">
                <div class="col-sm">
                    <div class="container">
                        <ul class="nav nav-pills">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">Usuários</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="/usuario">Listar</a></li>
                                    <li><a class="dropdown-item" href="#">Cadastrar</a></li>
                                    <li><a class="dropdown-item" href="#">Autorizar</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Configurações</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="https://www.enfam.jus.br/institucional/sobre-a-escola/">Contato</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
    </header>