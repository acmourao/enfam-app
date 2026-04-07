app.filter('validate', function () {
    return function (str) {
        return (str == "0000-00-00" || str == null) ? 'Inválido!' : str;
    };
});

app.filter('datePtBr', function () {
    return function (input) {
        if (input == "0000-00-00" || input == null) {
            return 'Inválido!';
        }
        let parts = input.split('-');
        return parts[2] + '/' + parts[1] + '/' + parts[0];
    };
});

app.filter('cpfCnpj', function () {
    return function (input) {
        if (input == "00000000000" || input == "00000000000000" || input == null) {
            return 'Inválido!';
        }
        if (input.length === 11) {
            return input.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, '$1.$2.$3-$4');
        } else if (input.length === 14) {
            return input.replace(/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/, '$1.$2.$3/$4-$5');
        }
        return input;
    };
});

app.filter('phone', function () {
    return function (input) {
        if (input == ""  || input == null) {
            return 'Inválido!';
        }
        if (input.length == 10) {
            return input.replace(/(\d{2})(\d{4})(\d{4})/, '($1) $2-$3');
        } else if (input.length == 11) {
            return input.replace(/(\d{2})(\d{5})(\d{4})/, '($1) $2-$3');
        }
        return input;
    };
});

app.filter('cep', function () {
    return function (input) {
        if (input == "00000000" || input == null) {
            return 'Inválido!';
        }
        if (input.length === 8) {
            return input.replace(/(\d{5})(\d{3})/, '$1-$2');
        }
        return input;
    };
});

app.filter('currencyBr', function () {
    return function (input) {
        if (input == null || input == 0) {
            return 'R$ 0,00';
        }
        return input.toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1.');
    };
});

app.filter('booleanBr', function () {
    return function (input) {
        if (input === true || input === 'true' || input === 1 || input === '1') {
            return 'Sim';
        }
        if (input === false || input === 'false' || input === 0 || input === '0') {
            return 'Não';
        }
        return input;
    };
});

app.filter('truncate', function () {
    return function (input, limit) {
        if (!input) return '';
        if (input.length <= limit) return input;
        return input.substring(0, limit) + '...';
    };
});

app.filter('capitalize', function () {
    return function (input) {
        if (!input) return '';
        return input.charAt(0).toUpperCase() + input.slice(1);
    };
});

app.filter('titleCase', function () {
    return function (input) {
        if (!input) return '';
        return input.replace(/\w\S*/g, function (txt) {
            return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
        });
    };
});

app.filter('removeAccents', function () {
    return function (input) {
        if (!input) return '';
        return input.normalize('NFD').replace(/[\u0300-\u036f]/g, '');
    };
});

app.filter('slugify', function () {
    return function (input) {
        if (!input) return '';
        return input.toString().toLowerCase()
            .replace(/\s+/g, '-')           // Replace spaces with -
            .replace(/[^\w\-]+/g, '')       // Remove all non-word chars
            .replace(/\-\-+/g, '-')         // Replace multiple - with single -
            .replace(/^-+/, '')             // Trim - from start of text
            .replace(/-+$/, '');            // Trim - from end of text
    };
});

app.filter('bytes', function () {
    return function (input) {
        if (input == null || input == 0) {
            return '0 Bytes';
        }
        var k = 1024,
            sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
            i = Math.floor(Math.log(input) / Math.log(k));
        return parseFloat((input / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
    };
});

app.filter('timeAgo', function () {
    return function (input) {
        if (!input) return '';
        var now = new Date();
        var past = new Date(input);
        var diff = Math.floor((now - past) / 1000);

        if (diff < 60) return diff + ' segundos atrás';
        if (diff < 3600) return Math.floor(diff / 60) + ' minutos atrás';
        if (diff < 86400) return Math.floor(diff / 3600) + ' horas atrás';
        if (diff < 2592000) return Math.floor(diff / 86400) + ' dias atrás';
        if (diff < 31536000) return Math.floor(diff / 2592000) + ' meses atrás';
        return Math.floor(diff / 31536000) + ' anos atrás';
    };
});

app.filter('ordinal', function () {
    return function (input) {
        if (input == null || isNaN(input)) return input;
        var suffixes = ['º', 'º', 'º', 'º', 'º', 'º', 'º', 'º', 'º', 'º'];
        var lastDigit = input % 10;
        var lastTwoDigits = input % 100;
        if (lastTwoDigits >= 11 && lastTwoDigits <= 13) {
            return input + 'º';
        } else {
            return input + suffixes[lastDigit];
        }
    };
});

app.filter('percentage', function () {
    return function (input) {
        if (input == null || isNaN(input)) {
            return '0%';
        }
        return input.toFixed(2) + '%';
    };
});

app.filter('currencySymbol', function () {
    return function (input, symbol) {
        if (input == null || isNaN(input)) {
            return symbol + ' 0,00';
        }
        return symbol + ' ' + input.toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1.');
    };
});

app.filter('numberAbbreviate', function () {
    return function (input) {
        if (input == null || isNaN(input)) {
            return '0';
        }
        var suffixes = ['', 'K', 'M', 'B', 'T'];
        var suffixIndex = 0;
        while (input >= 1000 && suffixIndex < suffixes.length - 1) {
            input /= 1000;
            suffixIndex++;
        }
        return input.toFixed(1) + suffixes[suffixIndex];
    };
});

app.filter('timeFormat', function () {
    return function (input) {
        if (input == null || isNaN(input)) {
            return '00:00:00';
        }
        var hours = Math.floor(input / 3600);
        var minutes = Math.floor((input % 3600) / 60);
        var seconds = input % 60;
        return (hours < 10 ? '0' + hours : hours) + ':' + (minutes < 10 ? '0' + minutes : minutes) + ':' + (seconds < 10 ? '0' + seconds : seconds);
    };
});

app.filter('fileSize', function () {
    return function (input) {
        if (input == null || input == 0) {
            return '0 Bytes';
        }
        var k = 1024,
            sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
            i = Math.floor(Math.log(input) / Math.log(k));
        return parseFloat((input / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
    };
});

app.filter('currencyFormat', function () {
    return function (input, symbol) {
        if (input == null || isNaN(input)) {
            return symbol + ' 0,00';
        }
        return symbol + ' ' + input.toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1.');
    };
});

app.filter('dateTimePtBr', function () {
    return function (input) {
        if (input == null || isNaN(input)) {
            return '00/00/0000 00:00:00';
        }
        var date = new Date(input);
        return date.toLocaleString('pt-BR');
    };
});

app.filter('removeHtml', function () {
    return function (input) {
        if (!input) return '';
        return input.replace(/<[^>]+>/g, '');
    };
});

app.filter('wordCount', function () {
    return function (input) {
        if (!input) return 0;
        return input.trim().split(/\s+/).length;
    }
});

app.filter('lineBreaks', function () {
    return function (input) {
        if (!input) return '';
        return input.replace(/\n/g, '<br>');
    };
});

app.filter('currencyWithSymbol', function () {
    return function (input, symbol) {
        if (input == null || isNaN(input)) {
            return symbol + ' 0,00';
        }
        return symbol + ' ' + input.toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1.');
    };
});

app.filter('dateOnlyPtBr', function () {
    return function (input) {
        if (input == null || isNaN(input)) {
            return '00/00/0000';
        }
        var date = new Date(input);
        return date.toLocaleDateString('pt-BR');
    };
});

app.filter('timeOnly', function () {
    return function (input) {
        if (input == null || isNaN(input)) {
            return '00:00:00';
        }
        var date = new Date(input);
        return date.toLocaleTimeString('pt-BR');
    };
});
