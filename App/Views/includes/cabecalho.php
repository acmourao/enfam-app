<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NOME_APP</title>
    <?php include PATH_VIEW . 'includes/css_config.php' ?>
    <?php include PATH_VIEW . 'includes/js_config.php' ?>
</head>

<body>
    <header class="container mt-3">
        <div class="row mb-3">
            <div class="col-md-7">
                <?php echo NOME_APP ?><h5><br>Ambiente Desenvolvimento
                    <hr>
                </h5>
            </div>
        </div>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/">Home</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/">Voltar</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Usuários
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/usuario">Listar Usuários</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/usuario/Perfil">Buscar</a>
                            <a class="dropdown-item" href="/usuario/Editar">Editar</a>
                            <a class="dropdown-item" href="/usuario/Apagar">Apagar</a>
                        </div>
                    </li>

                </ul>
            </div>
        </nav>

    </header>