<?php
/**
 * Created by PhpStorm.
 * User: sysferland
 * Date: 12/27/13
 * Time: 8:16 PM
 */

$episode = (int)$_GET['episode'];

require "init.php";

$res = $conn->prepare("SELECT `id`, `video`, `runtime`, `dimensions` FROM `tongue`.`video_files` WHERE `id` = ?");

$res->bindParam(1, $episode, PDO::PARAM_INT);
$res->execute();

$row = $res->fetch(2);
$file = array(
                'id'        => $row['id'],
                'filename'  => htmlentities(stripslashes($row['video']), ENT_QUOTES),
                'runtime'   => $row['runtime'],
                'dimensions'=> $row['dimensions']
            );
$smarty->assign("file", $file);
$smarty->display("episode_details_template.tpl");