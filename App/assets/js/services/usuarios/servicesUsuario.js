app.service('UserService', ['$http', function ($http) {

    this.save = function ($scope) {
        $http.post('/usuario/post', $scope.usuario).success(function (response) {
            console.log(response);
        }).error(function (error) {
            console.log(error);
        })
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
