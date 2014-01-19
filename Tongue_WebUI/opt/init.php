<?php
require "config.php";
define('WWW_DIR', $_SERVER['DOCUMENT_ROOT']."/tongue_ui/");
define('SMARTY_DIR', $smarty_lib);

require SMARTY_DIR.'Smarty.class.php';

$smarty = new Smarty();

$smarty->setTemplateDir( WWW_DIR."smarty/templates/");
$smarty->setCompileDir( WWW_DIR."smarty/templates_c/" );

$dsn               = $service.':host='.$sqlhost.';dbname=tongue';
$options = array(
    PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
    PDO::ATTR_PERSISTENT => TRUE,
);

$conn    = new PDO($dsn, $sqluser, $sqlpwd, $options);