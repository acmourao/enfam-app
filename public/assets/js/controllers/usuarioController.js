app.controller('usuarioController', ['$scope', 'usuarioService', 'estadoService', function ($scope, userService, estadoService) {

    $scope.usuarios = [];
    $scope.ufs = [];

    $scope.init = function () {
        $scope.usuarios = userService.get();
    }

    $scope.buscarUserById = function ($id) {
        $scope.usuario = userService.getUnique($id);
        $scope.ufs = estadoService.get();
    }

    $scope.editar = function ($id) {
        window.location.assign('form_edit_usuario.php?id=' + $id);
    }

    $scope.save = function () {

        //console.log($scope.usuario);
        $scope.msg = (userService.save($scope.usuario));

        if ($scope.msg == 'OK') {
            appInfo('registro salvo com sucesso!');
            document.getElementById("closeModalButton").click();
        }
    }

}]);
