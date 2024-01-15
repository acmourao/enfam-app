<?php
try {

    $dsn = "mysql:host=localhost:3307;dbname=mydb";
    $conexao = new PDO($dsn, 'root', 'root');

    $conexao->beginTransaction();

    $sql = "INSERT INTO pessoa (nome) VALUES ('Biancola II - a missao'); ";
    $stmt = $conexao->prepare($sql);
    $stmt->execute();

    $ultima_pessooa = $conexao->lastInsertId();

    $sql = "INSERT INTO endereco (id_pessoa, logradouro) VALUES (?, 'Rua dos Itapuís'); ";
    $stmt = $conexao->prepare($sql);
    $stmt->bindValue(1, $ultima_pessooa);
    $stmt->execute();

    $ultimo_endereco = $conexao->lastInsertId();

    $conexao->commit();

    echo "Deu certo. ID Inserida = ";

}  catch(Exception $ex) {

    echo $ex->getMessage();
}


$con = mysql_connect("localhost","root","root","API_DATA");
$response = array();

if($con) {
	$sql = "select * from data";
	$result = mysql_query($con,$sql);
if ($result){
	header("Content-Type: JSON");
	$i=0;
	while($row = mysql_fetch_assoc($result)) {
		$response[$i]['id'] = $row['id'];
		$response[$i]['nome'] = $row['nome'];
		$response[$i]['email'] = $row['email'];
		$response[$i]['indicado'] = $row['indicado'];
		$id++;
	}
	echo json_encode($response. JSON_PRETTY_PRINT);
}
else
{
	echo "Database connection failed";
}
?>

https://database.guide/6-ways-to-extract-json-data-in-mysql/






<?php
$link = mysqli_connect("localhost", "root", "root", "Mydb"); 
  
if($link === false){ 
    die("ERROR: Could not connect. "  
                . mysqli_connect_error()); 
} 
  
$sql = "UPDATE data SET Age='28' WHERE id=201"; 
if(mysqli_query($link, $sql)){ 
    echo "Record was updated successfully."; 
} else { 
    echo "ERROR: Could not able to execute $sql. "  
                            . mysqli_error($link); 
}  
mysqli_close($link); 
?> 


<?php
$mysqli = new mysqli("localhost", "root", "root", "Mydb"); 
  
if($mysqli === false){ 
    die("ERROR: Could not connect. " 
            . $mysqli->connect_error); 
} 
  
$sql = "UPDATE data SET Age='28' WHERE id=201";
 
if($mysqli->query($sql) === true){ 
    echo "Records was updated successfully."; 
} else{ 
    echo "ERROR: Could not able to execute $sql. " . $mysqli->error; 
} 

$mysqli->close(); 
?> 


<?php
try{ 
    $pdo = new PDO("mysql:host=localhost; 
                    dbname=Mydb", "root", ""); 
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
} catch(PDOException $e){ 
    die("ERROR: Could not connect. " . $e->getMessage()); 
} 
  
try{ 
    $sql = "UPDATE data SET Age='28' WHERE id=201"; 
    $pdo->exec($sql); 
    echo "Records was updated successfully."; 
} catch(PDOException $e){ 
    die("ERROR: Could not able to execute .: $sql" . $e->getMessage()); 
} 
unset($pdo);
?> 
