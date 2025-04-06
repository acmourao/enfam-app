var app = angular.module("sampleApp", []);

app.run(function ($rootScope) {
    $rootScope.AppName = "SampleApp";
    $rootScope.versao = "1.0.1";
    $rootScope.liberacao = "2025.04.05a";
});

app.service('UserService', ['$log', '$http', 'AlertService', '$rootScope', function ($log, $http, alertService, $rootScope) {
    this.save = function ($scope) {
        $log.log($rootScope + ' <++> ' + $scope);
        alertService.doAlert('Gravação concluída com sucesso!');
    }

    this.getListaUsuarios = function ($scope) {
        $http.get("/usuarios")
            .then(function (response) {
                $scope.lista_usuarios = response.data;
                //alertService.doAlert('Lista carregada!');
                //$log.log($rootScope.AppName + ' <++> carregou ' + $scope.lista_usuarios.length + ' registros');
            });
    }

}]);

app.service('AlertService', ['$window', function ($window) {
    this.doAlert = function (msg) {
        $window.alert(msg);
    }
}]);
