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



/**
 * Corrige um bug na data do datepicker do ui.bootstrap, quando não usa uma data UTC
 * @param data
 */
function fixDatepickerDate(data) {

    try {
        var ano = data.getFullYear();
        var mes = data.getMonth();
        var dia = data.getDate();

        return new Date(ano, mes, dia);

    } catch (e) {

        if (data && data.indexOf('-') >= 0) {
            var tmp = data.split("-");
            return new Date(tmp[0], tmp[1] - 1, tmp[2]);
        }

    }

    return null;

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
            return String(horas) + ":" + min;
        } else
            return String(horas) + ":00";
    }
    return "0:00";
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


function maskCurrencyInputBR(campo, prefixo) {

    if (!prefixo && prefixo != "")
        prefixo = "R$ ";

    campo.value = maskCurrencyBR(campo.value, prefixo);

}
function maskCurrencyBR(amount, prefix) {

    if (!amount)
        return "";

    if (!prefix && prefix != "")
        prefix = "R$ ";

    amount = "" + amount;

    if (amount.indexOf(prefix) != -1) {
        amount = amount.substr(prefix.length);
    }

    //Se só veio com uma casa decimal
    if ((amount.indexOf(".") != -1) && amount.indexOf(".") == amount.length - 2) {
        amount += "0";
    }

    var finalAmount = "";
    var vr = removeMasksAndLeadingZero(amount);

    if (!vr)
        return "";

    var tam = vr.length;

    if (isNaN(vr)) {
        finalAmount = onlyNumbers(vr);
        return maskCurrencyBR(finalAmount, prefix);
    }

    if (tam == 1) {
        finalAmount = prefix + "0,0" + vr;
    }
    if (tam == 2) {
        finalAmount = prefix + "0," + vr;
    }
    if (tam > 2 && tam <= 5) {
        finalAmount = prefix + vr.substr(0, tam - 2) + "," + vr.substr(tam - 2, tam);
    }
    if (tam >= 6 && tam <= 8) {
        finalAmount = prefix + vr.substr(0, tam - 5) + "." + vr.substr(tam - 5, 3) + "," + vr.substr(tam - 2, tam);
    }
    if (tam >= 9 && tam <= 11) {
        finalAmount = prefix + vr.substr(0, tam - 8) + "." + vr.substr(tam - 8, 3) + "." + vr.substr(tam - 5, 3) + "," + vr.substr(tam - 2, tam);
    }
    if (tam >= 12 && tam <= 14) {
        finalAmount = prefix + vr.substr(0, tam - 11) + "." + vr.substr(tam - 11, 3) + "." + vr.substr(tam - 8, 3) + "." + vr.substr(tam - 5, 3) + "," + vr.substr(tam - 2, tam);
    }
    if (tam >= 15 && tam <= 18) {
        finalAmount = prefix + vr.substr(0, tam - 14) + "." + vr.substr(tam - 14, 3) + "." + vr.substr(tam - 11, 3) + "." + vr.substr(tam - 8, 3) + "." + vr.substr(tam - 5, 3) + "," + vr.substr(tam - 2, tam);
    }

    return finalAmount;
}

function maskDateBR(content) {

    var valor = onlyNumbers(content);

    if (!valor)
        return null;

    var aux = valor;

    if (valor.length >= 5) {

        var p1 = valor.substring(0, 2);
        var p2 = valor.substring(2, 4);
        var p3 = valor.substring(4, 8);

        aux = p1 + "/" + p2 + "/" + p3;

    } else if (valor.length >= 3) {

        var p1 = valor.substring(0, 2);
        var p2 = valor.substring(2);

        aux = p1 + "/" + p2;
    }

    return aux;

}

function maskDateInputBR(field) {

    field.value = maskDateBR(field.value);

}

function maskHours(hours) {

    var valor = onlyNumbers(hours);

    if (!valor)
        return "";

    let tam = valor.length;
    if (tam > 2) {

        var p1 = valor.substring(0, tam - 2);
        var p2 = valor.substring(tam - 2, tam);

        return p1 + ":" + p2;

    }

    return valor;

}

function maskDuracao(hours) {

    let valor = onlyNumbers(hours);

    if (!valor)
        return;

    let tam = valor.length;

    if (tam > 2) {
        let p1 = valor.substring(0, tam - 2);
        let p2 = valor.substring(tam - 2, tam);
        return p1 + ":" + p2;
    }

    return valor;
}

function maskPersonPINBR(pin) {

    var valor = onlyNumbers(pin);

    if (!valor)
        return "";

    if (valor.length >= 10) {

        var p1 = valor.substring(0, 3);
        var p2 = valor.substring(3, 6);
        var p3 = valor.substring(6, 9);
        var p4 = valor.substring(9, 11);

        return p1 + "." + p2 + "." + p3 + "-" + p4;

    } else if (valor.length >= 7) {

        var p1 = valor.substring(0, 3);
        var p2 = valor.substring(3, 6);
        var p3 = valor.substring(6);


        return p1 + "." + p2 + "." + p3;
    } else if (valor.length >= 4) {

        var p1 = valor.substring(0, 3);
        var p2 = valor.substring(3);


        return p1 + "." + p2;
    }

    return valor;

}

function maskPIS(pis) {

    var valor = onlyNumbers(pis);

    if (!valor)
        return "";

    if (valor.length >= 10) {

        var p1 = valor.substring(0, 1);
        var p2 = valor.substring(1, 4);
        var p3 = valor.substring(4, 7);
        var p4 = valor.substring(7, 10);
        var p5 = valor.substring(10, 11);

        return p1 + "." + p2 + "." + p3 + "." + p4 + "-" + p5;

    }
    return valor;

}

function maskCEP(cep) {

    var valor = onlyNumbers(cep);

    if (!valor)
        return "";

    if (valor.length >= 6) {

        var p1 = valor.substring(0, 5);
        var p2 = valor.substring(5, 8);

        return p1 + "-" + p2;

    }
    return valor;

}


function maskCompanyPINBR(pin) {    // Esta eh a function que formata o cnpj.

    var valor = onlyNumbers(pin);

    if (!valor)
        return "";

    if (valor.length >= 13) {

        var p1 = valor.substring(0, 2);
        var p2 = valor.substring(2, 5);
        var p3 = valor.substring(5, 8);
        var p4 = valor.substring(8, 12);
        var p5 = valor.substring(12, 14);

        return p1 + "." + p2 + "." + p3 + "/" + p4 + "-" + p5;

    } else if (valor.length >= 9) {

        var p1 = valor.substring(0, 2);
        var p2 = valor.substring(2, 5);
        var p3 = valor.substring(5, 8);
        var p4 = valor.substring(8, 12);

        return p1 + "." + p2 + "." + p3 + "/" + p4;

    } else if (valor.length >= 6) {

        var p1 = valor.substring(0, 2);
        var p2 = valor.substring(2, 5);
        var p3 = valor.substring(5);

        return p1 + "." + p2 + "." + p3;

    } else if (valor.length >= 3) {

        var p1 = valor.substring(0, 2);
        var p2 = valor.substring(2);

        return p1 + "." + p2;
    }

    return valor;

}

function maskPhoneNumberBR(number) {

    var valor = onlyNumbers(number);

    if (!valor) return "";

    if (valor.length >= 7) {

        var p1 = valor.substring(0, 2);
        var p2 = valor.substring(2, 6);
        var p3 = valor.substring(6, 11);

        return "(" + p1 + ")" + p2 + "-" + p3;

    } else if (valor.length >= 3) {

        var p1 = valor.substring(0, 2);
        var p2 = valor.substring(2);


        return "(" + p1 + ")" + p2;
    }

    return valor;

}

function maskZipCodeBR(campo) {

    if (isMobile())
        return;

    $("#" + campo).keyup(function () {

        var valor = onlyNumbers(this.value);
        if (valor.length >= 6) {

            var p1 = valor.substring(0, 2);
            var p2 = valor.substring(2, 5);
            var p3 = valor.substring(5);

            if (p3.length > 3)
                p3 = p3.substring(0, 3);

            this.value = p1 + "." + p2 + "-" + p3;

        } else if (valor.length >= 3) {

            var p1 = valor.substring(0, 2);
            var p2 = valor.substring(2);

            this.value = p1 + "." + p2;
        } else {
            this.value = valor;
        }

    });

}

function arrRemove(arr, object) {

    var index = arr.indexOf(object);
    if (index != -1) {
        arr.splice(index, 1);
    }

}

function onlyNumbers(valor) {

    if (!valor)
        return;

    return valor.replace(/[^0-9]/gi, '');

}

function validatePersonPINBR(strCPF) {
    var Soma = 0;
    var Resto;

    strCPF = onlyNumbers(strCPF);

    if (!strCPF || strCPF.length != 11 ||
        strCPF == "00000000000" ||
        strCPF == "11111111111" ||
        strCPF == "22222222222" ||
        strCPF == "33333333333" ||
        strCPF == "44444444444" ||
        strCPF == "55555555555" ||
        strCPF == "66666666666" ||
        strCPF == "77777777777" ||
        strCPF == "88888888888" ||
        strCPF == "99999999999")
        return false;

    for (var i = 1; i <= 9; i++) Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (11 - i);
    Resto = (Soma * 10) % 11;

    if ((Resto == 10) || (Resto == 11)) Resto = 0;
    if (Resto != parseInt(strCPF.substring(9, 10))) return false;

    Soma = 0;
    for (var i = 1; i <= 10; i++) Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (12 - i);
    Resto = (Soma * 10) % 11;

    if ((Resto == 10) || (Resto == 11)) Resto = 0;
    if (Resto != parseInt(strCPF.substring(10, 11))) return false;
    return true;
}


function validarPIS(pis) {
    var multiplicadorBase = "3298765432";
    var total = 0;
    var resto = 0;
    var multiplicando = 0;
    var multiplicador = 0;
    var digito = 99;

    // Retira a mascara
    var strPis = onlyNumbers(pis);


    if (!strPis || strPis.length !== 11 ||
        strPis == "00000000000" ||
        strPis == "11111111111" ||
        strPis == "22222222222" ||
        strPis == "33333333333" ||
        strPis == "44444444444" ||
        strPis == "55555555555" ||
        strPis == "66666666666" ||
        strPis == "77777777777" ||
        strPis == "88888888888" ||
        strPis == "99999999999") {
        return false;
    } else {
        for (var i = 0; i < 10; i++) {
            multiplicando = parseInt(strPis.substring(i, i + 1));
            multiplicador = parseInt(multiplicadorBase.substring(i, i + 1));
            total += multiplicando * multiplicador;
        }

        resto = 11 - total % 11;
        resto = resto === 10 || resto === 11 ? 0 : resto;

        digito = parseInt("" + strPis.charAt(10));
        return resto === digito;
    }
}

function copyProperties(srcObj, destObj) {
    for (var key in destObj) {
        if (destObj.hasOwnProperty(key) && srcObj.hasOwnProperty(key)) {
            destObj[key] = srcObj[key];
        }
    }
}

function parseDate(date) {
    if (date) {
        var atributo = Date.parse(date.replace(/-/g, "/"));
        return atributo;
    }
};

function sanearData(date) {
    if (date) {
        var atributo = date.split("-");
        var retorno = new Date(atributo[0], atributo[1] - 1, atributo[2].substr(0, 2));
        return retorno;
    }
};
