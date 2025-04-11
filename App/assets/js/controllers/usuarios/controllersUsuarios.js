app.controller('userController', ['$scope', 'UserService', function ($scope, userService) {

    $scope.usuario = [];

    $scope.buscarListaUsuarios = function () {
        $scope.lista_usuarios = userService.getListaUsuarios($scope);
    }

    $scope.init = function () {
        $scope.lista_usuarios = $scope.buscarListaUsuarios();
    }

    $scope.init();

}]);
