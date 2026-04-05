module.exports = {
    context: __dirname + '/public',
    name: 'sampleApp',
    mode: 'production',
    entry: {
        app: [
            './assets/js/services/httpService.js',
            './assets/js/services/usuarioService.js',
            './assets/js/services/estadoService.js',
            './assets/js/controllers/mainController.js',
            './assets/js/controllers/usuarioController.js',
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