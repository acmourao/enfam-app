app.service('httpService', ['$http', function ($http) {

    this.get = function ($url) {
        var arr = [];
        $http.get($url)
            .then(function (response) {
                response.data.forEach((element) => arr.push(element))
            })
        return arr
    }

    this.getUnique = function ($url) {
        var obj = {};
        $http.get($url)
            .then(function (response) {
                Object.assign(obj, response.data[0])
            })
        return obj
    }

    this.post = function ($url, $req) {
        return $http.post($url, $req).then(function (response) {
            return response.statusText;
        });
    }

}]);
