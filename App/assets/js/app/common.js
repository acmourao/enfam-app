function appAlertare(msg) {
    window.alert(msg);
}

function appAlert(message, title) {
    if (message) {
        if (message.substr(0, 9) == 'Undefined') {
            message = 'O campo ' + message.substr(message.indexOf('"'), message.length) + ' é obrigatório!'
        }
        toastr.error(title, message,
            {
                'timeOut': 5000,
                'closeButton': true,
                'progressBar': true
            }
        );
    }
}

function appInfo(message, titulo, timeout) {
    if (message) {
        if (!timeout)
            timeout = 5000;

        toastr.info(titulo, message,
            {
                'timeOut': timeout,
                'closeButton': true,
                'progressBar': true,
                "showDuration": 500,
                "hideDuration": 500,
                'showEasing': "swing",
                'hideEasing': "linear",
                'showMethod': "show",
                'hideMethod': "hide"
            }
        );
    }
}

function addFormError(field, message) {

    var msg = "<div class='help-block validation-error text-red'>" + message + "</div>";

    var hasWarningField = document.getElementById("warning-" + field) !== null;
    var fieldExists = document.getElementById(field) !== null;

    var field = field.replace(/\./g, "\\.");

    if (hasWarningField) {
        $("#warning-" + field).html(msg).parent().addClass('has-error');
    } else if (fieldExists) {
        $("#" + field).parent().append(msg).addClass('has-error');
    } else {
        appAlert(message);
    }
}


function fixMaskDuracao(valor) {
    if (valor) {
        valor = String(valor);
        if (valor.length < 3)
            valor = "000:" + valor.padStart(2, '0')
        else
            valor = valor.padStart(6, '0');

        if (valor.substr(4, 1) > "5") {
            appAlert("Carga horária inválida!");
            return null;
        }
    }
    return valor;
}

function castPercentHoraToMaskDuracao(total) {
    if (total) {
        total = Number(total).toFixed(2);
        let horas = Math.floor(total);
        let minutos = Math.round((total - horas) * 60);
        horas = String(horas).padStart(3, '0');
        minutos = String(minutos).padStart(2, '0');
        return horas + ":" + minutos;
    }
}

function castPercentHoraToMinutos(valor) {
    if (valor) {
        valor = String(valor);
        if (valor.indexOf('.') > 0) {
            let pos = valor.indexOf('.');
            let p1 = valor.substr(0, pos);
            let p2 = valor.substr(pos + 1);
            let h = parseInt(p1) * 60;
            let m = Math.floor(p2 * .6);
            return h + m;
        } else
            return parseInt(valor);
    }
    return 0;
}

function castMaskDuracaoToPercentHoras(valor) {
    let min = castMaskDuracaoToMinutos(valor);
    if (min > 0) {
        return min / 60;
    }
    return 0;
}

function castMinutosToPercentHoras(valor) {
    if (valor > 0) {
        return valor / 60;
    }
    return 0;
}


function castMinutosToMaskDuracao(valor) {
    if (valor) {
        let horas = Math.floor(valor / 60);
        let minutos = valor % 60;
        //let hr = String(horas).padStart(3, '0');
        if (minutos > 0) {
            let min = String(minutos).padStart(2, '0');
            return String(horas) + "h" + min;
        } else
            return String(horas) + "h";
    }
    return "0h00";
}

function castMaskDuracaotoHorasMinutos(valor) {
    if (valor) {
        if (valor.indexOf(':00') > 0) {
            return valor.replace(':00', 'h');
        } else
            return valor.replace(':', 'h');
    }
    return "0h00";
}


function castMaskDuracaoToMinutos(valor) {
    if (valor) {
        valor = String(valor);
        if (valor.indexOf(':') > 0) {
            let pos = valor.indexOf(':');
            let p1 = valor.substr(0, pos);
            let p2 = valor.substr(pos + 1);
            let h = parseInt(p1) * 60;
            let m = parseInt(p2);
            return h + m;
        } else
            return parseInt(valor);
    }
    return 0;
}
