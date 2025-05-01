app.controller('userController', ['$scope', '$rootScope', 'UserService', function ($scope, $rootScope, userService) {

    (this.init = function () {
        $scope.usuarios = userService.getListaUsuarios("/usuarios");
        console.log($scope);
    })();

    $scope.buscarById = function ($id) {
        $scope.usuario = userService.getUsuarioById('/usuario/get/' + $id);
        //console.log($scope);
    }

    $scope.save = function () {
        $scope.msg = userService.save('/usuario/post', $scope.usuario);
        //console.log($scope);
    }

}]);
