app.service('UserService', ['$http', 'AlertService', '$rootScope', function ($http, alertService, $rootScope) {
    this.save = function ($scope) {
        alertService.doAlert('Gravação concluída com sucesso!');
        console.log($rootScope + ' <++> ' + $scope);
    }

    this.getListaUsuarios = function ($scope) {
        $http.get("/usuarios")
            .then(function (response) {
                $scope.lista_usuarios = response.data;
            });
    }

    this.getUsuarioById = function ($scope) {
        $http.get("/usuario/get/" + $scope.id)
            .then(function (response) {
                $scope.usuario = response.data[0];
            });
    }

}]);
