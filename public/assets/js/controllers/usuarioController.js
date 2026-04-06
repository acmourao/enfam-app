app.controller('usuarioController', ['$scope', 'cadastroService', function ($scope, cadastroService) {

    $scope.usuarios = [];
    $scope.ufs = [];

    $scope.init = function () {
        $scope.usuarios = cadastroService.getUsuarios();
    }

    $scope.buscarUserById = function ($id) {
        $scope.usuario = cadastroService.getUsuarioUnique($id);
        $scope.ufs = cadastroService.getEstados();
    }

    $scope.editarUsuario = function ($id) {
        window.location.assign('form_edit_usuario.php?id=' + $id);
    }

    $scope.salvarUsuario = function () {

        $scope.msg = (cadastroService.save($scope.usuario));

        if ($scope.msg == 'OK') {
            appInfo('registro salvo com sucesso!');
            document.getElementById("closeModalButton").click();
        }
    }

}]);
