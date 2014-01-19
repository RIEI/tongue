<?php
/**
 * Created by PhpStorm.
 * User: sysferland
 * Date: 12/27/13
 * Time: 7:34 PM
 */
require "init.php";

$search = array("\\");
$replace = array("");

$show = (int)$_GET['show'];
$res = $conn->prepare("SELECT `seasons`.`id`, `seasons`.`season_name`, `shows`.`show_name` from `tongue`.`seasons`, `tongue`.`shows` WHERE `seasons`.`show_id` = `shows`.`id` AND `shows`.`id` = ?");
$res->bindParam(1, $show, PDO::PARAM_INT);
$res->execute();
$seasons = array();
foreach($res->fetchAll(2) as $row)
{
    $rep1 = str_replace($search, $replace, $row['season_name']);
    $show_name = str_replace($search, $replace, $row['show_name']);
    if(strcasecmp($row['season_name'], $row['show_name']) < 0)
    {
        $seasons[] = array($row['id'], $rep1);
    }else{
        $rep = str_replace($show_name."/", "", $rep1);
        $seasons[] = array($row['id'], $rep);
    }
}
$smarty->assign('seasons', $seasons);
$smarty->display('seasons_template.tpl');