<?php
require "init.php";

$res = $conn->prepare("SELECT `id`, `grouped`, `group`, `filename`, `dvd_raw` FROM `tongue`.`movie_files` ORDER BY LOWER(`filename`) ASC");
$res->execute();
$movies = array();

$prev = 0;
foreach($res->fetchAll(2) as $row)
{
    if($prev == $row['group'] and $row['grouped'] == 1)
    {
        $prev = (int)$row['group'];
        continue;
    }else
    {
        $prev = (int)$row['group'];

    }

    $movies[] = array($row['id'], stripslashes($row['filename']), $row['group']);
}
$smarty->assign("movies", $movies);
$smarty->display("movies_template.tpl");