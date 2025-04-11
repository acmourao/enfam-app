module.exports = {
    context: __dirname + '/App',
    name: 'sampleApp',
    mode: 'production',
    entry: {
        app: ['./assets/js/services/services.js',
            './assets/js/services/usuarios/servicesUsuario.js',
            './assets/js/controllers/controllers.js',
            './assets/js/controllers/usuarios/controllersUsuarios.js',
            './assets/js/filters/filters.js',
            './assets/js/app/common.js']
    },
    output: {
        path: __dirname + '/App/assets/js/vendor',
        filename: 'bundle.js'
    },
    plugins: [
    ]
};