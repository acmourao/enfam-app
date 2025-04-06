<footer>
    <div class="container p-1 my-1 bg-dark text-white">
        <span class="badge">
            {{ $rootScope.liberacao }}
        </span>
        <span class="badge bg-primary">
            {{ $rootScope.AppName }} Sistema de Amostra AngularJS
        </span>
        <span class="badge bg-success">
            {{ $rootScope.versao }}
        </span>
    </div>
</footer>

<?php include '/var/www/html/views/includes/js_config.php' ?>

</body>

</html>