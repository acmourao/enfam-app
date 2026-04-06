app.service('estadoService', ['httpService', function ($httpService) {

    this.get = function () {
        return $httpService.get("/ufs")
    }

    this.getUnique = function ($id) {
        return $httpService.getUnique('/uf/get/' + $id)
    }

}]);
