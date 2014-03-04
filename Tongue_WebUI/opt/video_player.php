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

$feed = $feeds['feed'];
$exp = explode(".", $feed);
$len = strlen($exp[0]);
$int = (int)$exp[0][$len-1];
$feed_server = $feeds['feed_server'];
$res = $conn->prepare("INSERT INTO `tongue`.`waiting` (`video_id`, `table`, `feed`, `feed_server`, `seek`) VALUES(?, ?, ?, ?, ?)");

$seek = "00:00:00";

$res->bindParam(1, $_GET['video'], PDO::PARAM_INT);
$res->bindParam(2, $_GET['table'], PDO::PARAM_STR);
$res->bindParam(3, $feed, PDO::PARAM_STR);
$res->bindParam(4, $feed_server, PDO::PARAM_STR);
$res->bindParam(5, $seek, PDO::PARAM_STR);
$res->execute();
sleep(3); #sleep so that the feed can get the source buffered a little. You are probably going to have to still pause the video for a few seconds or a minute to get a good buffer.

$stream_source = "http://".$feed_server."/stream".$int;
$smarty->assign("stream_source", $stream_source);
$smarty->display("flash_player.tpl");