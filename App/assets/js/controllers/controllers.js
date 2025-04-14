app.controller('mainController', ['$scope', '$rootScope', '$interval', '$timeout', 'AppService',
    function ($scope, $rootScope, $interval, $timeout, appService) {

        $scope.callAtTimeout = function () {
            window.location.replace("/logoff");
            //console.log("$scope.callAtTimeoutmeout encerrou a sessão!");
        }

        $timeout(function () { $scope.callAtTimeout(); }, 600000);

        $scope.init = function () {
            $scope.ultimoSalvamento = new Date().toLocaleTimeString();
        }

        $interval(function () {
            $scope.ultimoSalvamento = new Date().toLocaleTimeString();
            //console.log($scope.ultimoSalvamento);
        }, 300000);

        $scope.init();

    }]);
