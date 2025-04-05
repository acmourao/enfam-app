app.controller('mainController', ['$scope', 'CtrlService', function ($scope, ctrlService) {

    $scope.AppName = null;
    $scope.versao = null;
    $scope.liberacao = null;
    $scope.lista_usuarios = [];

    $scope.buscarListaUsuarios = function () {
        $scope.lista_usuarios = ctrlService.getListaUsuarios($scope);
    }

    $scope.buscarDadosApp = function ($scope) {
        ctrlService.getDadosApp($scope);
    }

    $scope.init = function () {
        //$scope.buscarDadosApp();
        $scope.buscarListaUsuarios();
    }

    $scope.init();

}]);
