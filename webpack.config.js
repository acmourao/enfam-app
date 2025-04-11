module.exports = {
    name: 'sampleApp',
    mode: 'production',
    entry: [
        './App/assets/js/modules/modules.js',
        './App/assets/js/services/services.js',
        './App/assets/js/services/usuarios/servicesUsuario.js',
        './App/assets/js/controllers/controllers.js',
        './App/assets/js/controllers/usuarios/controllersUsuarios.js',
        './App/assets/js/filters/filters.js',
        './App/assets/js/app/common.js'
    ],
    output: {
        path: 'C:/Users/ander/enfam-app/App/assets/js/vendor',
        filename: 'bundle.js'
    }
};