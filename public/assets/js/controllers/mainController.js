app.controller('mainController', ['$scope', '$interval', '$timeout',
    function ($scope, $interval, $timeout) {

        (this.init = function () {
            $scope.ultimoSalvamento = new Date().toLocaleTimeString();
        })();

        function callAtTimeout() {
            window.location.replace("/logoff");
            $scope.debug = null;
        }

        $timeout(function () { callAtTimeout() }, 18e4);

        $interval(function () {
            $scope.ultimoSalvamento = new Date().toLocaleTimeString();
        }, 1e3);

    }]);
