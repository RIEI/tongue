<?php
require "opt/init.php";
$fp = @fsockopen($ffserver, $ffserver_port, $errno, $errstr, 3);
if (!$fp) {
    $smarty->assign("ffserver_status", '<span style="background-color: red">Stopped</span>');
}else{
    $smarty->assign("ffserver_status", '<span style="background-color: green">Running</span>');
}


$fp = @fsockopen($tongue_server, $tongue_port, $errno, $errstr, 3);
if (!$fp) {
    $smarty->assign("tongue_status", '<span style="background-color: red">Stopped</span>');
}else{
    $smarty->assign("tongue_status", '<span style="background-color: green">Running</span>');
}
$smarty->display("index.tpl");