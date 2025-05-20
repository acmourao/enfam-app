app.controller('usuarioController', ['$scope', 'usuarioService', function ($scope, userService) {

    $scope.init = function () {
        $scope.usuarios = userService.get();
    }

    $scope.buscarById = function ($id) {
        $scope.usuario = userService.getUnique($id);
    }

    $scope.editar = function ($id) {
        window.location.assign('form_edit_usuario.php?id=' + $id);
    }

    $scope.save = function () {
        $scope.msg = (userService.save($scope.usuario));

        if ($scope.msg == 'OK') {
            appInfo('registro salvo com sucesso!');
            document.getElementById("closeModalButton").click();
        }
    }

}]);
