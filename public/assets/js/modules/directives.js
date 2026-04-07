app.directive('maskCompanyPin', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, element, attrs, ctrl) {
            element.bind("keyup", function (event) {
                element.val(maskCompanyPINBR(element.val()));
                // Atualiza o valor do ngModel também
                ctrl.$setViewValue(element.val());
                ctrl.$render();
            });
        }
    }
});

app.directive('maskCurrency', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, element, attrs, ctrl) {
            element.bind("keyup", function (event) {
                var prefix = attrs.currencyPrefix != undefined ? attrs.currencyPrefix : null;
                element.val(maskCurrencyBR(element.val(), prefix));
                // Atualiza o valor do ngModel também
                ctrl.$setViewValue(element.val());
                ctrl.$render();
            });
        }
    }
});

app.directive('maskDate', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, element, attrs, ctrl) {
            element.bind("keyup", function (event) {
                element.val(maskDateBR(element.val()));
                ctrl.$setViewValue(element.val());
                ctrl.$render();
            });
        }
    }
});

app.directive('maskHours', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, element, attrs, ctrl) {
            element.bind("keyup", function (event) {
                element.val(maskHours(element.val()));
                ctrl.$setViewValue(element.val());
                ctrl.$render();
            });
        }
    }
});

app.directive('maskDuracao', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, element, attrs, ctrl) {
            element.bind("keyup", function (event) {
                element.val(maskDuracao(element.val()));
                ctrl.$setViewValue(element.val());
                ctrl.$render();
            });
        }
    }
});


app.directive('maskNumber', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, element, attrs, ctrl) {
            element.bind("keyup", function (event) {
                element.val(onlyNumbers(element.val()));
                // Atualiza o valor do ngModel também
                ctrl.$setViewValue(element.val());
                ctrl.$render();
            });
        }
    }
});


app.directive('maskPhoneNumber', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, element, ctrl, ngModel) {
            ngModel.$formatters.push(function (fromModel) {
                if (fromModel == null)
                    return null;
                fromModel = maskPhoneNumberBR(fromModel);
                console.log(fromModel);
                return fromModel;
            });
            ngModel.$parsers.push(function (fromField) {
                fromField = onlyNumbers(fromField);
                console.log(fromField);
                return fromField;
            });
            element.bind("keyup", function () {
                element.val(maskPhoneNumberBR(element.val()));
                if (ctrl && ctrl.$setViewValue) {
                    ctrl.$setViewValue(element.val());
                    ctrl.$render();
                }
            });
        }
    }
});

app.directive('cpfCnpj', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, element, ctrl, ngModel) {
            ngModel.$formatters.push(function (fromModel) {
                if (fromModel == null)
                    return null;
                // console.log(fromModel);
                return maskPersonPINBR(fromModel);
            });
            ngModel.$parsers.push(function (fromField) {
                // console.log(fromField);
                return onlyNumbers(fromField);
            });
            element.bind("keyup", function () {
                element.val(maskPersonPINBR(element.val()));
                if (ctrl && ctrl.$setViewValue) {
                    ctrl.$setViewValue(element.val());
                    ctrl.$render();
                }
            });
        }
    }
});


app.directive('mysqlDate', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, element, attrs, ngModel) {
            ngModel.$formatters.push(function (fromModel) {
                if (fromModel == null || fromModel == "0000-00-00")
                    return null;
                let parts = fromModel.split('-');
                fromModel = new Date(parts[1] + '/' + parts[2] + '/' + parts[0]);
                return fromModel;
            });
            ngModel.$parsers.push(function (fromField) {
                fromField = fromField.getFullYear() + '-' + (fromField.getMonth() + 1).toString().padStart(2, '0') + '-' + fromField.getDate().toString().padStart(2, '0');
                return fromField;
            });
        }
    }
});
