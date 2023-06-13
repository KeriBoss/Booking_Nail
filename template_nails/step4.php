<?php
include_once './header.php';
if(isset($_SESSION['cart'])){
    unset($_SESSION['cart']);
}

?>

    <!-- Booking start-->
    <section class="booking-nail mb-5 pt-5">
        <div class="success-section container">
            <div class="row">
                <div class="col-12">
                    <div class="success-content">
                        <p><b>Thank you for your booking!</b></p>
                        <p class="mb-5">We appreciate your trust in our services and we promise to make it a wonderful experience for you. We'll send you a confirmation message shortly and a reminder closer to your appointment date. If you need to make any changes or have any questions, feel free to contact us.</p>
                        <!-- <img src="./img/image 1.png" class="img-fluid" alt=""> -->
                        <div class="circle">
                            <span>Lottie file</span>
                            <div class="checkmark"></div>
                        </div>
                        <p class="mt-5">Would you like to make a booking for a friend or relative? </p>
                        <a class="btn btn-booking" href="index.php?id=<?=$ID_COM?>">Continue booking</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Booking end-->

<?php
include_once './footer.php';
?>