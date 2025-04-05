var app = angular.module("sampleApp", []);

app.run(function ($rootScope) {
    $rootScope.firstName = "John";
    $rootScope.lastName = "Doe";
    $rootScope.AppName = "SampleApp";
    $rootScope.meuNome = "zé do caixão";
    $rootScope.versao = "1.0.1";
    $rootScope.liberacao = "zé do caixão";
});

app.controller('mainController', function ($scope, $rootScope) {
    $scope.updateRootScope = function () {
        $rootScope.meuNome = $scope.meuNome;
    }
});

app.controller('layoutController', ['$scope', 'CtrlService', function ($scope, ctrlService) {

    $scope.saveLayoutToAPI = function () {
        $scope.meuNome = 'Tiririca';
        ctrlService.save($scope);
    }

}]);

app.controller('LayoutController2', ['$scope', 'CtrlService', function ($scope, ctrlService) {

    $scope.saveLayoutToAPI = function () {
        $scope.meuNome = "João Lingüiça";
        ctrlService.save($scope);
    }
    $scope.loadLayoutFromAPI = function () {
        ctrlService.load($scope);
    };

}]);

app.service('CtrlService', ['$log', 'AlertService', '$rootScope', function ($log, alertService, $rootScope) {
    this.save = function ($scope) {
        $log.log($rootScope.meuNome + ' <- ' + $scope.meuNome);
        // alertService.doAlert($rootScope.meuNome + ' <- ' + $scope.meuNome);
        $rootScope.meuNome = $scope.meuNome;
    };

    this.load = function ($scope) {
        $scope.meuNome = "zé do caixão";
        this.save($scope);
    };

}]);

app.service('AlertService', ['$window', function ($window) {
    this.doAlert = function (msg) {
        $window.alert(msg);
    };
}]);