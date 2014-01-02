<?php
require "init.php";

$fp = fsockopen("172.16.0.57", 8090, $errno, $errstr, 3);
if (!$fp) {
    $smarty->assign("ffserver_status", '<span style="background-color: red">Stopped</span>');
}else{
    $smarty->assign("ffserver_status", '<span style="background-color: green">Running</span>');
}

$fp = @fsockopen("172.16.0.57", 50007, $errno, $errstr, 3);
if (!$fp) {
    $smarty->assign("tongue_status", '<span style="background-color: red">Stopped</span>');
}else{
    $smarty->assign("tongue_status", '<span style="background-color: green">Running</span>');
}
$smarty->display("index.tpl");