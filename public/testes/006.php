<?php
$tam = strlen($_SERVER['DOCUMENT_ROOT']); // Tamanho do diretório atual
$dir = substr(__DIR__, $tam); // Diretório atual
$url = $_SERVER['HTTP_HOST'];
$files = scandir('./');
echo "<h1>Conteúdo do Diretório $dir ($url)</h1><ul>";
if ($dir != '') {
    echo "<li><a href='$dir/..'>..</a></li>";
}
foreach ($files as $file) {
    if ($file != '.' && $file != '..' && $file != 'index.php') {
        echo "<li><a href='$dir/$file'>$file</a></li>";
    }
}
echo "</ul>";
?>