app.filter('validate', function () {
    return function (str) {
        return (str == "0000-00-00" || str == null) ? 'Inválido!' : str;
    };
});
