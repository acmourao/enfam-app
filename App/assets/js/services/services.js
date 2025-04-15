app.service('AlertService', ['$window', function ($window) {
    this.alert = function (msg) {
        $window.alert(msg);
    }
}]);

app.service('HttpService', ['$rootScope', '$http', function ($rootScope, $http) {

    this.post = function ($url) {
        $http.post($url, $rootScope.item).then(function (response) {
            return response.data;
        }), function (error) {
            return error.data;
        }
    }

    this.get = function ($url) {
        $http.get($url)
            .then(function (response) {
                $rootScope.lista = response.data;
                return $rootScope.lista;
            });
    }

    this.getById = function ($url) {
        $http.get($url)
            .then(function (response) {
                $rootScope.item = response.data[0];
                return $rootScope.item;
            });
    }
}]);
