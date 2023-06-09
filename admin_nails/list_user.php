<?php
include_once "./header.php";
require_once "../model/user.php";
require_once "../model/company.php";

$user = new User();
$getAllUser = $user->getAllUser();

if(isset($_SESSION['owner'])){
    $company = new Company();
    $getAllUser = $company->getUserByCompany($current_user['id']);
}
?>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">All list of booking</h1>
        <a id="myBtn" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Add new user</a>
    </div>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">List of user</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered custom-table" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Fullname</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Description</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $count = 1;
                        foreach ($getAllUser as $item) {
                        ?>
                            <tr>
                                <td><?= $count++ ?></td>
                                <td><?= $item['fullname'] ?></td>
                                <td><?= $item['phone'] ?></td>
                                <td><?= $item['email'] ?></td>
                                <td><?= $item['description'] ?></td>
                                <td><a href="./edit_user.php?id=<?=$item['id']?>" class="icon edit"><i class='bx bx-edit'></i></a></td>
                                <td><a onclick="if(CheckForm() == false) return false" href="./action/delete_user.php?id=<?=$item['id']?>" class="icon delete"><i class='bx bxs-message-square-x'></i></a></td>
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
        <form action="action/add_user.php" method="post" enctype="multipart/form-data">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Add New User</h5>
                <button type="button" data-modal="close" class="close">
                    <span aria-hidden="true">&times;</span>
                    
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="fullname"><b>Fullname:</b></label>
                    <input type="text" class="form-control" name="fullname" placeholder="Enter fullname..." required>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="form-group">
                            <label for="phone"><b>Phone:</b></label>
                            <input type="text" name="phone" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="form-group">
                            <label for="email"><b>Email:</b></label>
                            <input type="email" name="email" class="form-control" required>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="description"><b>Description:</b></label>
                    <textarea name="description" class="form-control" placeholder="Enter note..." rows="5"></textarea>
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