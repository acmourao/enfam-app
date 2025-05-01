app.service('UserService', ['HttpService', '$rootScope', function ($httpService, $rootScope) {

    this.get = function ($url) {
        return $httpService.get($url)
    }

    this.getUnique = function ($url) {
        return $httpService.getUnique($url)
    }

    this.save = function ($url, $req) {
        return $httpService.post($url, $req)
    }
}]);
