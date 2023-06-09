<?php
include_once './header.php';
require_once '../model/company.php';
require_once '../model/service.php';
require_once '../model/staff.php';

if(!isset($_SESSION['cart'])){
    header("location: 404.php");
}

?>

<!-- Booking start-->
<section class="booking-nail mb-5 pt-5">
    <div class="container">
        <form action="">
            <div class="row">

                <div class="col-lg-12">
                    <div class="schedule-main">
                        <div class="title">
                            <h5>Review and confirm your services and staffs</h5>
                        </div>
                        <div class="list-card mt-3 mb-3">
                            <?php foreach($_SESSION['cart'] as $item){
                                $hour = substr($item['time_completion'],0,2);
                                $minute = substr($item['time_completion'],3,2);
                                ?>
                                <div class="schedule-card">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="left">
                                            <p class="name"><?=$item['type_name']?> $ <?=$item['name_service']?> <i class='bx bx-time-five'></i> <?=$item['date_duration']?> <?=$item['time_duration']?></p>
                                            <p><i class='bx bx-time-five'></i> <?=$hour?> hours <?=$minute?>
                                                minutes
                                            <?php if($item['price_status'] === 1){ ?>
                                                <span class="space">.</span> <span class="price">$<?=$item['price']?></span>
                                            <?php } ?>
                                            </p>
                                            <p class="user"><i class='bx bx-user'></i> <?=$item['user_name']?></p>
                                        </div>
                                        <div class="right">
                                            <div class="btn-delete" onclick="deleteCart(<?=$item['staff_id']?>,<?=$item['company_id']?>,<?=$item['service_id']?>);">Delete</div>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>
                        <a id="myBtn" class="btn btn-addmore"><i class='bx bx-plus'></i> Add more services</a>
                        <div class="footer-end mt-5">
                            <div class="group-btn">
                                <a href="index.php?id=<?=$ID_COM?>" class="back">Back</a>
                                <a href="step3.php?id=<?=$ID_COM?>">Continue</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- Booking end-->

<!-- Modal -->
<div id="newModal" class="modal1" data-display="false">
    <!-- Modal content -->
    <div class="modal-content">
        <form enctype="multipart/form-data">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Add more service</h5>
                <button type="button" data-modal="close" class="close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row booking-main">
                    <div class="col-lg-12 text-center mb-3">
                        <h5><b>Choose Service name:</b> </h5>
                    </div>
                    <div class="col-lg-12 mb-3">
                        <div class="d-flex justify-content-center align-items-center flex-wrap">
                            <?php if(isset($_GET['id'])){ ?>
                                <input type="number" id="guest_com_toggle" name="id_com" value="<?=$ID_COM?>" hidden>
                            <?php }else{ ?>
                            <select id="guest" class="guest">
                                <?php foreach($getAllCompany as $item){ ?>
                                    <option value="<?=$item['id']?>"> <?=$item['company_name']?> </option>
                                <?php } ?>
                            </select>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card-booking">
                            <ul class="nav nav-tabs">
                                <li class="active"><a class="active" data-toggle="tab" href="#home2">Services</a></li>
                                <li><a data-toggle="tab" href="#menu3">Staffs</a></li>
                            </ul>

                            <div class="tab-content mt-4">
                                <div id="home2" class="tab-pane fade show active">
                                    <div class="form-parent mb-3">
                                        <div class="icon-search"><i class='bx bx-search'></i></div>
                                        <input type="search" id="form1" class="form-control" placeholder="Type query" aria-label="Search" />
                                    </div>
                                    <div class="collapse show filter-service2">
                                    </div>
                                </div>
                                <div id="menu3" class="tab-pane fade list-staff2">
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <a id="btnAddVehicle" data-modal="close" onclick="checkStaffChoose();" class="btn btn-primary">Continue</a>
            </div>
        </form>
    </div>
</div>

<?php
include_once './footer.php';
?>