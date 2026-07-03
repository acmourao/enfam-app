app.service('cadastroService', ['usuarioService', 'estadoService', function ($usuarioService, $estadoService) {

    this.getUsuarios = function () {
        return $usuarioService.get();
    }

    this.getUsuarioUnique = function ($id) {
        return $usuarioService.getUnique($id);
    }
    this.getEstados = function () {
        return $estadoService.get();
    }

    this.getEstadoUnique = function ($id) {
        return $estadoService.getUnique($id);
    }

    this.save = function ($req) {
        return $usuarioService.save($req);
    }

}]);
