<?php
session_start();
require_once  "../../model/config.php";
require_once "../../model/database.php";
require_once  "../../model/user.php";

if(isset($_GET['id'])){
    $id = $_GET['id'];
}

try{
    $user = new User();
    $delete = $user->delete($id);

    header('location: ../list_user.php');
} catch(Throwable $err){
    echo $err;
}