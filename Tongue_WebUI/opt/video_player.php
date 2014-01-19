<?php
/**
 * Created by PhpStorm.
 * User: sysferland
 * Date: 12/27/13
 * Time: 10:03 PM
 */
require "init.php";
$res = $conn->query("SELECT `feed`, `feed_server` FROM `tongue`.`feeds` WHERE `in_use` != 1 LIMIT 1");
$feeds = $res->fetch(2);
var_dump($feeds);
$feed = $feeds['feed'];
$exp = explode(".", $feed);
$len = strlen($exp[0]);
$int = (int)$exp[0][$len-1];
$feed_server = $feeds['feed_server'];
$res = $conn->prepare("INSERT INTO `tongue`.`waiting` (`video_id`, `table`, `feed`, `feed_server`, `seek`) VALUES(?, ?, ?, ?, ?)");

$seek = "00:00:00";

$res->bindParam(1, $_GET['video_id'], PDO::PARAM_INT);
$res->bindParam(3, $_GET['table'], PDO::PARAM_STR);
$res->bindParam(2, $feed, PDO::PARAM_STR);
$res->bindParam(3, $feed_server, PDO::PARAM_STR);
$res->bindParam(4, $seek, PDO::PARAM_STR);
$res->execute();
sleep(1);
$stream_source = "http://".$feed_server."/stream".$int.".webm";
$smarty->assign("stream_source", $stream_source);
$smarty->display("html5_stream_player.tpl");