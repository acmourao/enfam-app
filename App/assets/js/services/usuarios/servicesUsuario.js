app.service('UserService', ['HttpService', '$rootScope', function ($httpService) {

    this.get = function ($url) {
        return $httpService.get($url);
    };

    this.getOne = function ($url) {
        return $httpService.getOne($url);
    };

    this.save = function ($url, $req) {
        return $httpService.post($url, $req);
    };

}]);
