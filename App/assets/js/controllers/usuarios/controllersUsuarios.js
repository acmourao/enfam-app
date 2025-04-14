app.controller('userController', ['$scope', 'UserService', function ($scope, userService) {

    $scope.init = function () {
        userService.getListaUsuarios($scope);
    }

    $scope.buscarById = function ($id) {
        $scope.id = $id;
        userService.getUsuarioById($scope);
    }

    $scope.init();

}]);
