<?php
session_start();
require 'php/func.php';
if (!isset($_SESSION['id_user'])) Header('Location: sign_in.php?user=false');
$table = table_for_all("salon");
if ((isset($_POST['check'])) && (isset($_POST['model']))) {
    $id_salon = htmlspecialchars($_POST["id_salon"]);
    $mark = htmlspecialchars($_POST["mark"]);
    $rez = add_car($_POST, $_FILES["user_file"], "car");
    header("Location: user.php?rez=$rez");
}
