app.service('usuarioService', ['httpService', '$rootScope', function ($httpService) {

    this.get = function () {
        return $httpService.get("/usuarios")
    }

    this.getUnique = function ($id) {
        return $httpService.getUnique('/usuario/get/' + $id)
    }

    this.save = function ($req) {
        try {
            $httpService.post('/usuario/save', $req);
            return "OK";
        }
        catch (e) {
            console.error(e);
            return e;
        }
    }

}]);
