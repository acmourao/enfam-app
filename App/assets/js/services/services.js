app.service('HttpService', ['$rootScope', '$http', function ($rootScope, $http) {

    this.post = function ($url, $req) {
        return $http.post($url, $req).then(function (response) {
            return response.data
        }), function (error) {
            return error.data
        }
    };

    this.get = function ($url) {
        return $http.get($url)
            .then(function (response) {
                //$rootScope.lista = response.data;
                //console.log(response.data);
                if (response.data.lenght == 1) {
                    return response.data[0]
                } else {
                    return response.data
                }
            });
    };

}]);
