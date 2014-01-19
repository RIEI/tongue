<?php
/**
 * Created by PhpStorm.
 * User: sysferland
 * Date: 1/12/14
 * Time: 5:19 PM
 */

$movie = (int)$_GET['movie'];
$group = (int)$_GET['group'];

require "init.php";

if($group != 0)
{
    $res = $conn->prepare("SELECT * FROM `tongue`.`movie_files` WHERE `group` = ?");
    $res->bindParam(1, $group, PDO::PARAM_INT);
}else
{
    $res = $conn->prepare("SELECT * FROM `tongue`.`movie_files` WHERE `id` = ?");
    $res->bindParam(1, $movie, PDO::PARAM_INT);
}


$res->execute();
$movies_fetch = $res->fetchAll(2);
$movies = array();
$i = 0;

$search = array("\\");
$replace = array("");
foreach($movies_fetch as $movie)
{
    #var_dump($movie);
    #die();
    $movies[$i]['id']           = $movie['id'];
    $movies[$i]['runtime']      = $movie['runtime'];
    $movies[$i]['dimentions']   = $movie['dimentions'];
    $movies[$i]['filename']     = stripslashes($movie['filename']);
    $movies[$i]['grouped']      = $movie['grouped'];
    $movies[$i]['group']        = $movie['group'];
    $movies[$i]['dvd_raw']      = $movie['dvd_raw'];
    $i++;
}

$smarty->assign("movies", $movies);
$smarty->assign("movie_name", $movies[0]['filename']);
$smarty->display("movie_details_template.tpl");