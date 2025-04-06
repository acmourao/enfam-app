app.service('AlertService', ['$window', function ($window) {
    this.alert = function (msg) {
        $window.alert(msg);
    }
}]);

app.service('LogService', ['$rootScope', function ($rootScope) {
    this.log = function (msg) {
        console.log($rootScope.AppName + ' <-> ' + msg);
    }
}]);

app.service('AppService', ['$rootScope', function ($rootScope) {
    this.appInfo = function ($scope) {
        console.log("AppService running!");
    }
}]);