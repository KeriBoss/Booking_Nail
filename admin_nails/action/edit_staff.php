<?php
session_start();
require_once  "../../model/config.php";
require_once "../../model/database.php";
require_once  "../../model/staff.php";
require_once  "../../model/service.php";


$target_dir =  "../../template_nails/img/staff/";

$target_name_file = basename($_FILES["image"]["name"]);

if($target_name_file == ''){
    $target_name_file = $_POST['name_img_product'];
}
$target_file = $target_dir . $target_name_file;

$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

// Check if image file is a actual image or fake image
if (isset($_POST["submit"])) {
    $check = getimagesize($_FILES["image"]["tmp_name"]);
    if ($check !== false) {
        echo "File is an image - " . $check["mime"] . ".";
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }
}

// Check file size
if ($_FILES["image"]["size"] > 500000) {
    echo "Sorry, your file is too large.";
    $uploadOk = 0;
}

// Allow certain file formats
if (
    $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
    && $imageFileType != "gif"
) {
    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    $uploadOk = 0;
}

// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
    // if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        $image = $target_name_file;
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
    $image = $target_name_file;
}

// var_dump($_POST['birth']);die();

if(isset($_POST['staff_id']) && isset($_POST['staff_name']) && isset($_POST['phone']) && isset($_POST['email']) && isset($_POST['birth']) && isset($_POST['gender']) && isset($_POST['address']) && isset($_POST['company_id']) && isset($_POST['service_id'])){
    $staff_id = $_POST['staff_id'];
    $staff_name = $_POST['staff_name'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $birth = $_POST['birth'];
    $gender = $_POST['gender'];
    $address = $_POST['address'];
    $company_id = $_POST['company_id'];
    $service_id = $_POST['service_id'];

    // var_dump($time_start);die();
    try{
        $staff = new Staff();
        $update = $staff->update($staff_id,$staff_name,$image, $phone,$email,$address,$birth,$gender,$company_id,$service_id);

        header('location: ../list_staff.php');
    } catch(Throwable $err){
        $_SESSION['error'] = "This item cannot be editted! Please check the information and try again!";
        header('location: ../404.php');
    }
}