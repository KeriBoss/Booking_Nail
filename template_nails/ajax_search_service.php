<?php
session_start();
require_once  "../model/config.php";
require_once "../model/database.php";
require_once  "../model/nailtype.php";

if(isset($_GET['keyword']) && isset($_GET['com_id'])){
    $keyword = $_GET['keyword'];
    $com_id = $_GET['com_id'];

    $nailtype = new NailType();
    $search = $nailtype->search($com_id,$keyword);

    echo json_encode($search);
}
