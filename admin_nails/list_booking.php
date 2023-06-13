<?php
include_once "./header.php";
require_once "../model/company.php";
require_once "../model/service.php";
require_once "../model/staff.php";
require_once "../model/user.php";
require_once "../model/booking.php";

$booking = new Booking();
$getAllBooking = $booking->getAllBooking();

$service = new Service();
$getAllService = $service->getAllService();

$company = new Company();
$getAllCompany = $company->getAllCompany();

$staff = new Staff();
$getAllStaff = $staff->getAllStaff();

$user = new User();
$getAllUser = $user->getAllUser();
?>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">All booking list</h1>
        <a id="myBtn" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Add new booking</a>
    </div>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Booking list of user</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered custom-table" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <?php if(isset($_SESSION['admin'])){ ?>
                                <th>Company</th>
                            <?php } ?>
                            <th>Service</th>
                            <th>Staff</th>
                            <th>Date duration</th>
                            <th>Time duration</th>
                            <th>Username</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $count = 1;
                        foreach ($getAllBooking as $item) {
                        ?>
                            <tr>
                                <td><?= $count++ ?></td>
                                <?php if(isset($_SESSION['admin'])){ ?>
                                    <td><?= $item['company_name'] ?></td>
                                <?php } ?>
                                <td><?= $item['name_service'] ?></td>
                                <td><?= $item['user_name'] ?></td>
                                <td><?= $item['date_duration'] ?></td>
                                <td><?= $item['time_duration'] ?></td>
                                <td><?= $item['fullname'] ?></td>
                                <td><a href="./edit_booking.php?id=<?=$item['booking_id']?>" class="icon edit"><i class='bx bx-edit'></i></a></td>
                                <td><a onclick="if(CheckForm() == false) return false" href="./action/delete_booking.php?id=<?=$item['booking_id']?>" class="icon delete"><i class='bx bxs-message-square-x'></i></a></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

<!-- Modal -->
<div id="newModal" class="modal1" data-display="false">
    <!-- Modal content -->
    <div class="modal-content">
        <form action="action/add_booking.php" method="post" enctype="multipart/form-data">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Add New Booking</h5>
                <button type="button" data-modal="close" class="close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="form-group">
                            <label for="company_id"><b>Comapany name:</b></label>
                            <select name="company_id" id="set_company" class="form-control">
                                <?php foreach($getAllCompany as $item){ 
                                    if(isset($_SESSION['owner'])){
                                        $com_id = $current_user['id'];
                                        if($com_id == $item['id']){ ?>
                                            <option value="<?=$item['id'] ?>" selected><?=$item['company_name'] ?></option>
                                    <?php }else{ ?>
                                            <option value="<?=$item['id'] ?>" hidden><?=$item['company_name'] ?></option>
                                    <?php }}else{ ?>
                                        <option value="<?=$item['id'] ?>"><?=$item['company_name'] ?></option>
                                <?php }} ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="form-group">
                            <label for="service_id"><b>Service:</b></label>
                            <select name="service_id" id="set_service" class="form-control">
                                <?php foreach($getAllService as $item){ ?>
                                    <option value="<?=$item['id']?>"><?=$item['name_service']?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="form-group">
                            <label for="staff_id"><b>Staff:</b></label>
                            <select name="staff_id" id="set_staff" class="form-control">
                                <?php foreach($getAllStaff as $item){ 
                                    if(isset($_SESSION['owner'])){
                                        $com_id = $current_user['id'];
                                        if($com_id == $item['id']){ ?>
                                            <option value="<?=$item['id'] ?>" selected><?=$item['user_name'] ?></option>
                                    <?php }else{ ?>
                                            <option value="<?=$item['id'] ?>" hidden><?=$item['user_name'] ?></option>
                                    <?php }}else{ ?>
                                        <option value="<?=$item['id']?>"><?=$item['user_name']?></option>
                                <?php }} ?>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="form-group">
                            <label for="mo_ta"><b>Date duration:</b></label>
                            <input type="date" name="date_duration" class="form-control">
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="form-group">
                            <label for="address"><b>End of work:</b></label>
                            <input type="text" name="time_duration" id="time_completion" class="form-control">
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="form-group">
                            <label for="address"><b>Choose Customer:</b></label>
                            <select name="user_id" class="form-control">
                                <?php foreach($getAllUser as $item){ ?>
                                    <option value="<?=$item['id']?>"><?=$item['fullname']?> - <?=$item['phone']?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="btnAddVehicle" type="submit" class="btn btn-primary">Add New</button>
            </div>
        </form>
    </div>
</div>
<!-- End of Content Wrapper -->
<?php include_once "./footer.php"; ?>