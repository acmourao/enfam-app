module.exports = {
    context: __dirname + '/App',
    name: 'sampleApp',
    mode: 'production',
    entry: {
        app: [
            './assets/js/services/httpService.js',
            './assets/js/services/usuarios/usuarioService.js',
            './assets/js/controllers/mainController.js',
            './assets/js/controllers/usuarios/usuarioController.js',
            './assets/js/filters/filters.js'
        ]
    },
    output: {
        path: __dirname + '/App/assets/js/vendor',
        filename: 'bundle.js'
    },
    plugins: [
    ]
};