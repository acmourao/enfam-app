module.exports = {
    context: __dirname + '/public',
    name: 'sampleApp',
    mode: 'production',
    entry: {
        app: [
            './assets/js/services/httpService.js',
            './assets/js/services/usuarios/usuarioService.js',
            './assets/js/controllers/mainController.js',
            './assets/js/controllers/usuarios/usuarioController.js',
            './assets/js/modules/angular-locale_pt-br.js',
            './assets/js/modules/directives.js',
            './assets/js/modules/filters.js'
        ]
    },
    output: {
        path: __dirname + '/public/assets/js/vendor',
        filename: 'bundle.js'
    },
    plugins: [
    ]
};