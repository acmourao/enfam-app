app.service('HttpService', ['$rootScope', '$http', function ($rootScope, $http) {

    this.post = function ($url, $req) {
        return $http.post($url, $req).then(function (response) {
            return response.data
        }), function (error) {
            return error.data
        }
    };

    this.get = function ($url) {
        var arr = [];
        $http.get($url)
            .then(function (response) {
                //$rootScope.lista = response.data;
                response.data.forEach((element) => arr.push(element));
            });
        return arr;
    };

    this.getOne = function ($url) {
        var one = new Object();
        $http.get($url)
            .then(function (response) {
                //$rootScope.item = response.data[0];
                one = Object.assign(one, response.data[0]);
            });
        return one;
    };

}]);
