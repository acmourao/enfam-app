var app = angular.module("sampleApp", []);

app.run(function ($rootScope) {
    $rootScope.AppName = "SampleApp";
    $rootScope.versao = "1.0.1";
    $rootScope.liberacao = "2025.04.05a";
});

app.service('CtrlService', ['$log', '$http', 'AlertService', '$rootScope', function ($log, $http, alertService, $rootScope) {
    this.save = function ($scope) {
        $log.log($rootScope + ' <++> ' + $scope);
        alertService.doAlert('Gravação concluída com sucesso!');
    }

    this.getListaUsuarios = function ($scope) {
        $http.get("http://localhost/usuarios")
            .then(function (response) {
                // First function handles success
                $scope.lista_usuarios = response.data.records;
                $log.log($scope.lista_usuarios);
            }, function (response) {
                // Second function handles error
                $scope.lista_usuarios = null;
            });
    }

    this.getDadosApp = function ($scope) {
        $scope.AppName = $rootScope.AppName;
        $scope.versao = $rootScope.versao;
        $scope.liberacao = $rootScope.liberacao;
    }

    this.setDadosApp = function ($scope) {
        $rootScope.AppName = $scope.AppName;
        $rootScope.versao = $scope.versao;
        $rootScope.liberacao = $scope.liberacao;
    }

}]);

app.service('AlertService', ['$window', function ($window) {
    this.doAlert = function (msg) {
        $window.alert(msg);
    }
}]);
