app.service('UserService', ['HttpService', '$rootScope', function ($httpService) {

    this.save = function ($url) {
        return $httpService.post($url);
    }

    this.getListaUsuarios = function ($url) {
        return $httpService.get($url);
    }

    this.getUsuarioById = function ($url) {
        return $httpService.getById($url);
    }

}]);
