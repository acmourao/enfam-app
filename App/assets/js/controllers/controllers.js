app.controller('mainController', function ($scope, $rootScope, $timeout) {
    $scope.idUserLogado = null;
    $scope.AppName = $rootScope.AppName;
    $scope.versao = $rootScope.versao;
    $scope.liberacao = $rootScope.liberacao;

    $scope.callAtTimeout = function () {
        console.log("$scope.callAtTimeoutmeout encerrou a sessão!");
    }

    $timeout(function () { $scope.callAtTimeout(); }, 60);
});
