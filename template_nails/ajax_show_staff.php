<?php
require_once '../model/config.php';
require_once '../model/database.php';
require_once '../model/staff.php';

if(isset($_GET['company_id']) && isset($_GET['service_id'])){
    $company_id = $_GET['company_id'];
    $service_id = $_GET['service_id'];

    $staff = new Staff();
    $getStaffByCompanyAndService = $staff->getStaffByCompanyAndService($company_id, $service_id);

    echo json_encode($getStaffByCompanyAndService);
}