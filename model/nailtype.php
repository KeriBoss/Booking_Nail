<?php
require_once "database.php";

class NailType extends Database{
    /**
     * Admin
     * Get all list of companies
     */
    function getAllType(){
        $sql = parent::$connection->prepare("SELECT * FROM nailtype ORDER BY `id` DESC");
        return parent::select($sql);
    }
    /**
     * 
     */
    function insert($name, $img, $desc, $status){
        $sql = parent::$connection->prepare("INSERT INTO `nailtype`(`type_name`, `img_type`, `description`, `status`) VALUES (?, ?, ?, ?)");
        $sql->bind_param('sssi', $name, $img, $desc, $status);
        return $sql->execute();
    }
    /**
     * 
     */
    function getTypeById($id){
        $sql = parent::$connection->prepare("SELECT * FROM nailtype WHERE `id` = ?");
        $sql->bind_param('i', $id);
        return parent::select($sql);
    }
    /**
     * 
     */
    function update($id, $name, $img, $desc, $status){
        $sql = parent::$connection->prepare("UPDATE `nailtype` SET `type_name`= ? ,`img_type`= ? ,`description`= ? ,`status`= ? WHERE `id` = ?");
        $sql->bind_param('sssii', $name, $img, $desc, $status, $id);
        return $sql->execute();
    }
    /**
     *  
     */
    function delete($id){
        $sql = parent::$connection->prepare("DELETE FROM `nailtype` WHERE `id` = ?");
        $sql->bind_param('i', $id);
        return $sql->execute();
    }
}