app.controller('mainController', ['$scope', '$rootScope', '$interval', '$timeout',
    function ($scope, $rootScope, $interval, $timeout) {

        (this.init = function () {
            $scope.ultimoSalvamento = new Date().toLocaleTimeString();
        })();

        function callAtTimeout() {
            window.location.replace("/logoff");
        }

        $timeout(function () { callAtTimeout() }, 6e4);

        $interval(function () {
            $scope.ultimoSalvamento = new Date().toLocaleTimeString();
        }, 1e3);

    }]);
