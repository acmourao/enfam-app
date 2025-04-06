var app = angular.module("sampleApp", []);

app.run(function ($rootScope) {
    $rootScope.AppName = "SampleApp";
    $rootScope.versao = "1.0.1";
    $rootScope.liberacao = "2025.04.05a";
    console.log($rootScope.AppName + " app running!");
});
