<?php
session_start();
require "./vendor/autoload.php";

use Twilio\Rest\Client;

require_once  "../model/config.php";
require_once "../model/database.php";
require_once  "../model/user.php";
require_once  "../model/booking.php";


$user = new User();

if(isset($_SESSION['error-ip'])){
    unset($_SESSION['error-ip']);
}

if (isset($_POST['fullname']) && isset($_POST['phone']) && isset($_POST['email']) && isset($_POST['description'])) {
    $fullname = $_POST['fullname'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $description = $_POST['description'];

    // if user from the share internet  
    if(!empty($_SERVER['HTTP_CLIENT_IP'])) {  
        $ip_user = $_SERVER['HTTP_CLIENT_IP'];  
    }  
    //if user is from the proxy  
    elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {  
        $ip_user = $_SERVER['HTTP_X_FORWARDED_FOR'];  
    }  
    //if user is from the remote address  
    else{  
        $ip_user = $_SERVER['REMOTE_ADDR'];  
    }  

    $user = new User();
    $getUserByPhone = $user->getUserByPhone($phone);

    if(isset($_POST['id_company'])){
        $id_com = $_POST['id_company'];

        if(count($getUserByPhone) > 0){
            
            foreach($getUserByPhone as $item){
                if($ip_user == $item['ip_user']){
                    $_SESSION['error-ip'] = "This phone number has been booked with us, please wait until the appointment is over";
                    header("location: step3.php?id=$id_com");die();
                }else{
                    unset($_SESSION['error-ip']);
                }
                $booking = new Booking();
                $getBookingByUser = $booking->getBookingByUser($item['id']);
                foreach($getBookingByUser as $data){
                    $current_date = date('Y-m-d');
                    if($data['date_duration'] < $current_date){
                        $_SESSION['error-phone'] = "You missed an appointment with us at a certain service. This phone number is currently not allowed to make an appointment for our service";
                        header("location: step3.php?id=$id_com");
                        die();
                    }else if($data['date_duration'] == $current_date){
                        $current_time = date('H:i:s');
                        if($data['time_duration'] <= $current_time){
                            $_SESSION['error-phone'] = "You missed an appointment with us at a certain service. This phone number is currently not allowed to make an appointment for our service";
                            header("location: step3.php?id=$id_com");
                            die();
                        }
                    }
                    else{
                        if(isset($_SESSION['error-phone'])){
                            unset($_SESSION['error-phone']);
                        }
                    }
                }
            }
        }
    }

    try {
        $ID_COM;
        if (isset($_SESSION['register'])) {
            unset($_SESSION['register']);
        }

        $insert_id = $user->insert($fullname, $phone, $email, $description, $ip_user);
        if($insert_id){
            $_SESSION['user-book'] = [$fullname, $phone];
        }
        if (isset($_SESSION['cart'])) {
            foreach ($_SESSION['cart'] as $item) {
                $company_id = $item['company_id'];
                $service_id = $item['service_id'];
                $staff_id = $item['staff_id'];
                $date_duration = $item['date_duration'];
                $time_duration = $item['time_duration'];

                if(substr($time_duration, -2, 2) == 'PM'){
                    $hour = substr($time_duration, 0, 2);
                    $minute = substr($time_duration, 3, 2);
                    $hour = $hour + 12;
                    $time_duration = $hour . ':' . $minute . ':00';
                }else if(substr($time_duration, -2, 2) == 'AM'){
                    $hour = substr($time_duration, 0, 2);
                    $minute = substr($time_duration, 3, 2);
                    $time_duration = $hour . ':' . $minute . ':00';
                }
                $ID_COM = $company_id;

                $booking = new Booking();
                // var_dump($company_id, $service_id,$staff_id,$date_duration,$time_duration,$insert_id);die();
                $insertBooking = $booking->insert($company_id, $service_id, $staff_id, $date_duration, $time_duration, $insert_id);
            }
            $countService = count($_SESSION['cart']);

            $listService = "";
            foreach ($_SESSION['cart'] as $item) {
                $listService .= $item['name_service'] . ", ";
            }

            // Find your Account SID and Auth Token at twilio.com/console
            // and set the environment variables. See http://twil.io/secure

            $twilio = new Client('ACbe33c0954cb9daeae087e7647f3fb368', '1386375556faa7d9b390651f3bf597c6');
            // //AC5917b53b6fe53799a1f4f06dd14d65fa 324e8886538d3046e211b039871ba69c

            $message = $twilio->messages
                ->create(
                    "+84969747473", // to 84969747473
                    [
                        "body" => "Nails By The Falls SMS for you! You have $countService service: $listService in $date_duration $time_duration, Please arrive early 5 minutes before the reservation time for the best quality. Thank you very much!",
                        "from" => "+13613094713", //12542685884
                        "statusCallback" => "http://postb.in/1234abcd" //option
                    ]
                );

            // if (isset($_SESSION['date_pick']) && isset($_SESSION['time_pick'])) {
            //     unset($_SESSION['date_pick']);
            //     unset($_SESSION['time_pick']);
            // }

            header("location: ./step4.php?id=$ID_COM");
        }else{
            header("location: ./index.php?id=$ID_COM");
        }
        // }
    } catch (Throwable $err) {
        echo $err;
    }
}
