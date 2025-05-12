app.controller('userController', ['$scope', '$rootScope', 'UserService', function ($scope, $rootScope, userService) {

    $scope.init = function () {
        $scope.usuarios = userService.get("/usuarios");
    }

    $scope.buscarById = function ($id) {
        $scope.usuario = userService.getUnique('/usuario/get/' + $id);
    }

    $scope.editar = function ($id) {
        window.location.assign('form_edit_usuario.php?id=' + $id);
    }

    $scope.save = function () {
        $scope.msg = (userService.save('/usuario/post', $scope.usuario));
        appInfo('registro salvo com sucesso!');
        document.getElementById("closeModalButton").click();
    }

}]);
