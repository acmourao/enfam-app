<?php
require('fpdf.php');

if (count($argv) == 1) {
    echo "passe o CPF do usuários como parâmetro, SOMENTE números, por ex.: 90564340715 !!!";
    die();
}

$CPF = $argv[1];

try {

    $dsn = 'mysql:host=mysql;dbname=sys;charset=UTF8';
    $conexao = new PDO($dsn, 'root', 'root', [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    $conexao->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "SET NAMES 'utf8'");

    $stmt = $conexao->prepare("SELECT * FROM irpf.2023 where cpf= ?");
    $stmt->execute([$CPF]);
    $lista = $stmt->fetch();
    //var_dump($lista);
    if ($lista != NULL) {

        $pdf = new FPDF("P", "pt", "A4");

        $pdf->AddPage();

        $pdf->SetDisplayMode('fullwidth');

        // put the image in first order
        $pdf->Image('dirf.jpg', 5, 3, 590);
        $pdf->SetFont('helvetica', 'B', 11);
        $pdf->Text(50, 179, FPdfExt::formatcpf($lista['cpf']));
        $pdf->Text(150, 179, $lista['nome']);
        $pdf->SetFont('courier', 'B', 8);
        $pdf->Text(543, 232, FPdfExt::alinhadir($lista['RTRT']));
        $pdf->Text(543, 246, FPdfExt::alinhadir($lista['RTPO']));
        $pdf->Text(543, 298, FPdfExt::alinhadir($lista['RTIRF']));
        $pdf->Text(543, 369, FPdfExt::alinhadir($lista['RIDAC']));
        $pdf->Output("C:/Users/amourao/Desktop/arquivo.pdf", "F");
    }
    echo "PDF gerado com sucesso!!";
} catch (Exception $ex) {
    echo $ex->getMessage();
}

class FPdfExt
{
    public static function alinhadir($valor)
    {
        $val = number_format($valor, 2, ',', '.');
        return str_pad($val, 9, " ", STR_PAD_LEFT);
    }

    public static function formatcpf($cpf)
    {
        $parte_um     = substr($cpf, 0, 3);
        $parte_dois   = substr($cpf, 3, 3);
        $parte_tres   = substr($cpf, 6, 3);
        $parte_quatro = substr($cpf, 9, 2);
        return "$parte_um.$parte_dois.$parte_tres-$parte_quatro";
    }
}
