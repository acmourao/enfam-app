<?php
require('fpdf.php');

$pdf = new FPDF("P", "pt", "A4");

$pdf->AddPage();

$pdf->SetDisplayMode('fullwidth');

// put the image in first order
$pdf->Image('dirf.jpg', 5, 3, 590);
$pdf->SetFont('helvetica', 'B', 11);
$pdf->Text(50, 179, '000.000.000-00');
$pdf->Text(150, 179, 'FULANO DE TAL');
$pdf->SetFont('courier', 'B', 8);
$pdf->Text(543, 232, '00.000,00');
$pdf->Text(543, 246, '00.000,00');
$pdf->Text(543, 298, '00.000,00');
$pdf->Text(543, 369, '00.000,00');
$pdf->Output("arquivo.pdf", "F");
