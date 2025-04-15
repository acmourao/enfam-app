app.controller('mainController', ['$scope', '$rootScope', '$interval', '$timeout',
    function ($scope, $rootScope, $interval, $timeout) {

        this.callAtTimeout = function () {
            window.location.replace("/logoff");
        }

        $timeout(function () { this.callAtTimeout(); }, 600000);

        this.init = function () {
            $scope.ultimoSalvamento = new Date().toLocaleTimeString();
        }

        $interval(function () {
            $scope.ultimoSalvamento = new Date().toLocaleTimeString();
        }, 1000);

        this.init();

    }]);
