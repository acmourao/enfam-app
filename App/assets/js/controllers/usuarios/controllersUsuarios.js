app.controller('userController', ['$scope', '$rootScope', 'UserService', function ($scope, $rootScope, userService) {

    (this.init = function () {
        $scope.usuarios = userService.get("/usuarios");
    })();

    $scope.buscarById = function ($id) {
        $scope.usuario = userService.getOne('/usuario/get/' + $id);
        //console.log($scope.usuario);
    }

    $scope.save = function () {
        $scope.msg = userService.save('/usuario/post', $scope.usuario);
        //console.log($scope);
    }

}]);
