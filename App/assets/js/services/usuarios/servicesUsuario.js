app.service('UserService', ['$http', 'AlertService', 'LogService', '$rootScope', function ($http, alertService, logService, $rootScope) {
    this.save = function ($scope) {
        alertService.doAlert('Gravação concluída com sucesso!');
        logService.doLog($rootScope + ' <++> ' + $scope);
    }

    this.getListaUsuarios = function ($scope) {
        $http.get("/usuarios")
            .then(function (response) {
                $scope.lista_usuarios = response.data;
                //alertService.doAlert('Lista carregada!');
                logService.doLog('carregou ' + $scope.lista_usuarios.length + ' registros');
            });
    }

}]);
