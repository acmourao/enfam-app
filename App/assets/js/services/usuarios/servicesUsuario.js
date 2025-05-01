app.service('UserService', ['HttpService', '$rootScope', function ($httpService) {

    this.getListaUsuarios = function ($url) {
        var $resp = $httpService.get($url);
        console.log($resp);
        return $resp;
    }

    this.getUsuarioById = function ($url) {
        return $httpService.get($url);
    }

    this.save = function ($url, $req) {
        return $httpService.post($url, $req);
    }

}]);
