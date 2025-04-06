app.service('AlertService', ['$window', function ($window) {
    this.doAlert = function (msg) {
        $window.alert(msg);
    }
}]);

app.service('LogService', ['$log', '$rootScope', function ($log, $rootScope) {
    this.doLog = function (msg) {
        $log.log($rootScope.AppName + ' <-> ' + msg);
    }
}]);
