<?php
session_start();
require 'php/func.php';
$table = table_for_all("salon");
$row = row("car", htmlspecialchars($_GET["id_car"]));

if ((isset($_POST['check'])) && (isset($_POST['model'])) && isset($_GET['mark'])) {
    $rez = save_car($_POST, $_GET, $_FILES["user_file"], "car");
    header("Location: user.php?edit=$rez");
}