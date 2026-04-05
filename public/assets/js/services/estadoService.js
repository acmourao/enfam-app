app.service('estadoService', ['httpService', '$rootScope', function ($httpService) {

    this.get = function () {
        return $httpService.get("/ufs")
    }

    this.getUnique = function ($id) {
        return $httpService.getUnique('/uf/get/' + $id)
    }

}]);
