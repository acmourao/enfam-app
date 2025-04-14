app.controller('userController', ['$scope', 'UserService', function ($scope, userService) {

    $scope.usuario =
    {
        "active": true,
        "id": 1,
        "nome": "THIAGO DE ANDRADE VIEIRA",
        "cpf": "73022403100",
        "email": "thiago.vieira@cnj.jus.br",
        "telefone": "61996992209",
        "nascimento": "0000-00-00"
    };

    $scope.init = function () {
        userService.getListaUsuarios($scope);
    }

    $scope.init();

}]);
