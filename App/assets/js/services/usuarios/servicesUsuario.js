app.service('UserService', ['$http', function ($http) {

    this.save = function ($scope) {
        $http.post('/usuario/post', $scope.usuario).then(function (response) {
            console.log(response.data);
        }), function (error) {
            console.log(error.data);
        }
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
