<?php
session_start();
//error_reporting(0);
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'reationsfb');
define('DB_PASSWORD', 'camisa10');
define('DB_DATABASE', 'reations');
define("BASE_URL", "http://localhost/seusite/");

function getDB() 
{
	$dbhost=DB_SERVER;
	$dbuser=DB_USERNAME;
	$dbpass=DB_PASSWORD;
	$dbname=DB_DATABASE;
	$dbConnection = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbConnection->exec("set names utf8");
	$dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	return $dbConnection;
}

include_once 'feed.php';
$feed = new feed();
?>