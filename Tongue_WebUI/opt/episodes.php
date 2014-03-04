<?php
/**
 * Created by PhpStorm.
 * User: sysferland
 * Date: 12/27/13
 * Time: 8:16 PM
 */

$season = (int)$_GET['season'];

require "init.php";

$res = $conn->prepare("SELECT  `video_files`.`id` ,  `video_files`.`video` ,  `video_files`.`season_id` ,  `seasons`.`season_name` ,  `shows`.`show_name`
FROM  `tongue`.`video_files` ,  `tongue`.`seasons` ,  `tongue`.`shows`
WHERE  `video_files`.`season_id` = ?
AND  `seasons`.`id` =  `video_files`.`season_id`
AND  `shows`.`id` =  `video_files`.`show_id`");

$res->bindParam(1, $season, PDO::PARAM_INT);
$res->execute();
$videos = array();

foreach($res->fetchAll(2) as $row)
{
    $shows[] = array($row['id'], htmlentities(stripslashes($row['video']), ENT_QUOTES));
}
$smarty->assign("videos", $shows);
$smarty->display("episodes_template.tpl");