var app = angular.module("sampleApp", []);
app.run(function ($rootScope) {
    $rootScope.AppName = "SampleApp";
    $rootScope.versao = "1.0.1";
    $rootScope.liberacao = "2025.04.05a";
});
(() => {
    'use strict'
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    const forms = document.querySelectorAll('.needs-validation')
    // Loop over them and prevent submission
    Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
            }
            form.classList.add('was-validated')
        }, false)
    })
})();