app.controller('userController', ['$scope', 'UserService', function ($scope, userService) {

    $scope.init = function () {
        userService.getListaUsuarios($scope);
    }

    $scope.buscarById = function ($id) {
        $scope.id = $id;
        userService.getUsuarioById($scope);
    }

    $scope.save = function () {
        userService.save($scope);
    }

    $scope.init();

}]);
