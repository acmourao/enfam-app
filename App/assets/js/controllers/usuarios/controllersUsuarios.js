app.controller('userController', ['$scope', '$rootScope', 'UserService', function ($scope, $rootScope, userService) {

    this.init = function () {
        //console.log($scope);
        userService.getListaUsuarios("/usuarios");
    }

    $scope.buscarById = function ($id) {
        //console.log($scope);
        userService.getUsuarioById("/usuario/get/" + $id);
    }

    $scope.save = function () {
        //console.log($scope.item);
        userService.save('/usuario/post');
    }

    this.init();

}]);
