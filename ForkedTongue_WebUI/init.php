<?php
define('WWW_DIR', $_SERVER['DOCUMENT_ROOT']."/tongue_ui/");

define('SMARTY_DIR', '/var/www/tongue_ui/smarty/libs/');

require SMARTY_DIR.'Smarty.class.php';

$smarty = new Smarty();

$smarty->setTemplateDir( WWW_DIR."smarty/templates/");
$smarty->setCompileDir( WWW_DIR."smarty/templates_c/" );

$show_mnt = "/mnt/e/Shows";
$movies_mnt = "/mnt/Movies";
$music_mnt = "/mnt/music";

$host              = "172.16.1.76";
$service           = "mysql";
$username          = "root";
$password          = "W!res191";
$dsn               = $service.':host='.$host.';dbname=tongue';
$options = array(
    PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
    PDO::ATTR_PERSISTENT => TRUE,
);
$conn    = new PDO($dsn, $username, $password, $options);