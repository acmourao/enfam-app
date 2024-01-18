<?php

namespace DAO;

use PDO;
use PDOException;

/*  
  * Constantes de parâmetros para configuração da conexão  
  */

define('USER', 'root');
define('PASSWORD', 'root');
define('DSN', 'mysql:host=127.0.0.1;dbname=educaenfam;charset=UTF8');

class Conexao extends PDO
{

    /*  
    * Atributo estático para instância do PDO  
    */
    private static $pdo;

    // Conectar a um banco de dados de teste


    /*  
    * Escondendo o construtor da classe  
    */
    private function __construct()
    {
    }

    /*  
    * Método estático para retornar uma conexão válida  
    * Verifica se já existe uma instância da conexão, caso não, configura uma nova conexão  
    */
    public static function getInstance()
    {
        if (!isset(self::$pdo)) {
            try {
                self::$pdo = new PDO(DSN, USER, PASSWORD, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
                self::$pdo->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "SET NAMES 'utf8'");
                //echo "Connected to the database successfully !!<br/><br/>";
            } catch (PDOException $e) {
                print "Erro Conexão DB:: " . $e->getMessage();
            }
        }
        return self::$pdo;
    }
}
