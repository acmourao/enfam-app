<footer>
    <div ng-controller="mainController">
        <div class="container p-1 my-1 bg-dark text-white">
            <br>
            <span class="badge">
                {{ liberacao }}
            </span>
            <span class="badge bg-primary">
                {{ AppName }} Sistema de Amostra AngularJS
            </span>
            <span class="badge bg-success">
                {{ versao }}
            </span>
            <span class="badge bg-danger">
                {{ ultimoSalvamento }}
            </span>

        </div>
</footer>

<?php include_once 'js_config.php' ?>

</body>

</html>