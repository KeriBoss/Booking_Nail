<?php
session_start();
require_once  "../../model/config.php";
require_once "../../model/database.php";
require_once  "../../model/booking.php";

if(isset($_GET['company_id'])){
    $company_id = $_GET['company_id'];

    $booking = new Booking();
    $getInfoByCompany = $booking->getInfoByCompany($company_id);
    
    echo json_encode($getInfoByCompany);
}
