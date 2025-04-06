<footer>
    <div ng-controller="mainController">
        <div class="container p-1 my-1 bg-dark text-white">
            <span class="badge">
                {{ liberacao }}
            </span>
            <span class="badge bg-primary">
                {{ AppName }} Sistema de Amostra AngularJS
            </span>
            <span class="badge bg-success">
                {{ versao }}
            </span>
            <span class="badge bg-success">
                {{ ultimoSalvamento }}
            </span>

        </div>
</footer>

<?php include '/var/www/html/views/includes/js_config.php' ?>

</body>

</html>