<?php
require "init.php";

#$res = $conn->prepare("SELECT `video_files`.`video`, `seasons`.`season_name`, `shows`.`show_name` FROM `video_files`, `seasons`, `shows` WHERE `seasons`.`id` = `video_files`.`season_id` and `shows`.`id` = `video_files`.`show_id`");
$res = $conn->prepare("SELECT `id`, `show_name` FROM `tongue`.`shows` ORDER BY `show_name` ASC");
$res->execute();
$shows = array();
$search = array("\\ ", "\\'");
$replace = array(" ", "'");
#$prep = $conn->prepare("INSERT INTO `waiting` (`id`, `file_to_feed`, `feed`) VALUES ('', ?, ?)");

foreach($res->fetchAll(2) as $row)
{
    $shows[] = array($row['id'], htmlentities(stripslashes($row['show_name']), ENT_QUOTES));
}
$smarty->assign("shows", $shows);
$smarty->display("shows_template.tpl");