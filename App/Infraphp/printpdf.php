<?php
include 'FPDF.php';
include 'Functions.php';
$pdf = new FPDF("P", "pt", "A4");
$pdf->AddPage();
$pdf->SetDisplayMode('fullwidth');
// put the image in first order
$pdf->Image(PATH_IMG . 'dirf.jpg', 5, 3, 590);
$pdf->SetFont('helvetica', 'B', 11);
$pdf->Text(50, 179, Functions::formatcpf($item['cpf']));
$pdf->Text(150, 179, $item['nome']);
$pdf->SetFont('courier', 'B', 8);
$pdf->Text(543, 232, Functions::alinhadir($item['RTRT']));
$pdf->Text(543, 246, Functions::alinhadir($item['RTPO']));
$pdf->Text(543, 298, Functions::alinhadir($item['RTIRF']));
$pdf->Text(543, 369, Functions::alinhadir($item['RIDAC']));
$pdf->Output("demontrativo_irpf_2023.pdf", "D");
