<?php
require_once "database.php";

class Booking extends Database{
    /**
     * Admin
     * Get all list of user
     */
    function getAllBooking(){
        $sql = parent::$connection->prepare("SELECT *, booking.id as booking_id FROM booking inner join company on booking.company_id = company.id inner join services on booking.service_id = services.id inner join user on user.id = booking.user_id inner join staff on booking.staff_id = staff.id ORDER BY booking.id DESC");
        return parent::select($sql);
    }
    /**
     * 
     */
    function insert($company_id, $service_id, $staff_id, $date_duration, $time_duration, $user_id){
        $sql = parent::$connection->prepare("INSERT INTO `booking`(`company_id`, `service_id`, `staff_id`, `date_duration`, `time_duration`, `user_id`) VALUES (?, ?, ?, ?, ?, ?)");
        $sql->bind_param('iiissi', $company_id, $service_id, $staff_id, $date_duration, $time_duration, $user_id);
        return $sql->execute();
    }
    /**
     * 
     */
    function getBookingById($id){
        $sql = parent::$connection->prepare("SELECT *, booking.id as booking_id FROM booking inner join company on booking.company_id = company.id inner join services on booking.service_id = services.id inner join user on user.id = booking.user_id WHERE booking.`id` = ?");
        $sql->bind_param('i', $id);
        return parent::select($sql);
    }
    /**
     * 
     */
    function update($id, $company_id, $service_id, $staff_id, $date_duration, $time_duration, $user_id){
        $sql = parent::$connection->prepare("UPDATE `booking` SET `company_id`= ? ,`service_id`= ? ,`staff_id`= ? ,`date_duration`= ? ,`time_duration`= ? ,`user_id`= ? WHERE `id` = ?");
        $sql->bind_param('iiissii',$company_id, $service_id, $staff_id, $date_duration, $time_duration, $user_id, $id);
        return $sql->execute();
    }
    /**
     *  
     */
    function delete($id){
        $sql = parent::$connection->prepare("DELETE FROM `booking` WHERE `id` = ?");
        $sql->bind_param('i', $id);
        return $sql->execute();
    }
    /**
     * 
     */
    function getAllInfoBooking(){
        $sql = parent::$connection->prepare("SELECT * FROM company ORDER BY `id` DESC");
        return parent::select($sql);
    }
    /**
     * Get service and staff by company
     */
    function getInfoByCompany($company_id){
        $sql = parent::$connection->prepare("SELECT *, staff.id as ID_staff FROM company INNER JOIN services ON company.id = services.company_id INNER JOIN staff ON company.id = staff.company_id WHERE company.`id` = ?");
        $sql->bind_param('i', $company_id);
        return parent::select($sql);
    }
    /**
     * Get service and staff by company
     */
    function getBookingByCompany($company_id){
        $sql = parent::$connection->prepare("SELECT * FROM booking INNER JOIN company ON booking.company_id = company.id INNER JOIN services ON services.id = booking.service_id INNER JOIN staff ON booking.staff_id = staff.id INNER JOIN user ON booking.user_id = user.id WHERE booking.company_id = ?");
        $sql->bind_param('i', $company_id);
        return parent::select($sql);
    }
    /**
     * Get service and staff by company
     */
    function getInfoByService($service_id){
        $sql = parent::$connection->prepare("SELECT *, staff.id as ID_staff FROM staff INNER JOIN services ON staff.service_id = services.id INNER JOIN company ON staff.company_id = company.id WHERE services.`id` = ?");
        $sql->bind_param('i', $service_id);
        return parent::select($sql);
    }
    /**
     * Get service and staff by company
     */
    function getBookingByUser($user_id){
        $sql = parent::$connection->prepare("SELECT * FROM booking WHERE booking.`user_id` = ?");
        $sql->bind_param('i', $user_id);
        return parent::select($sql);
    }
    /**
     * Get service and staff by company
     */
    function getBookingByStaff($staff_id){
        $sql = parent::$connection->prepare("SELECT * FROM booking WHERE booking.`staff_id` = ?");
        $sql->bind_param('i', $staff_id);
        return parent::select($sql);
    }
    /**
     * Check date of user pick up
     */
    function checkDatePickUp($company_id, $service_id, $staff_id, $date_duration){
        $sql = parent::$connection->prepare("SELECT * FROM booking WHERE company_id = ? and service_id = ? and staff_id = ? and date_duration = ? ");
        $sql->bind_param('iiis', $company_id, $service_id, $staff_id, $date_duration);
        return parent::select($sql);
    }
}