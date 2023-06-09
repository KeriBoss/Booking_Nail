<?php
include_once './header.php';

?>

    <!-- Booking start-->
    <section class="booking-nail mb-5 pt-5">
        <div class="container">
            <div class="row">
                <div class="col-12 ">
                    <form action="./add_user.php" method="post" onsubmit="return validate();">
                    <input type="number" name="id_company" value="<?=$ID_COM?>" hidden>
                        <!-- <input type="date" name="date_pick" value="<?php if(isset($_SESSION['date_pick']))  echo $_SESSION['date_pick'];?>" hidden>
                        <input type="text" name="time_pick" value="<?php if(isset($_SESSION['time_pick']))  echo $_SESSION['time_pick'];?>" hidden> -->
                        <div class="info-content">
                            <div class="header">
                                <div class="title text-center mb-4">
                                    <h5><b>How do we say hello?</b></h5>
                                    <span class="subtitle">
                                        Your name and phone number will be used for sending appointment confirmation and reminderes, as well as for contacting you in case any changes.
                                    </span>
                                </div>
                                <div class="form-group">
                                    <div class="icon-info"><i class='bx bx-user' ></i></div>
                                    <input id="valid-name" type="text" name="fullname" class="form-control" placeholder="Enter your full name (required)..." pattern="[a-zA-Z]+ [a-zA-Z]+" required>
                                </div>
                                <div class="form-group">
                                    <div class="icon-info"><i class='bx bx-phone' ></i></div>
                                    <input id="valid-phone" type="text" name="phone" class="form-control" placeholder="Enter your phone number XXX-XXX-XXXX (required)" required>
                                </div>
                                <?php if(isset($_SESSION['error-phone'])){ ?>
                                    <div class="text-danger">
                                        <span><?=$_SESSION['error-phone']?></span>
                                    </div>
                                <?php } ?>
                                <div class="form-group">
                                    <div class="icon-info"><i class='bx bx-envelope' ></i></div>
                                    <input type="email" name="email" class="form-control" placeholder="Enter your email (optional)...">
                                </div>
                                <div class="form-group">
                                    <textarea name="description" class="form-control" placeholder="Enter your appointmant note (optional)..."></textarea>
                                </div>
                                <div class="form-group">
                                    <div class="accept-condition">
                                        <div class="item">
                                            <input type="checkbox" name="verify" required>
                                        </div>
                                        <div class="desc">
                                            <p>I have read and agree to <span>the cancellation policy</span> of Nails By the Falls & also agree to Min Marketing's <span>terms and conditions/privacy policy.</span></p>
                                            <p>By creating this appointment, T agree to receive automatted transactional and booking reminder text messages from this merchant.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="footer-end mt-5">
                                    <div class="group-btn">
                                        <a href="index.php?id=<?=$ID_COM?>" class="back">Back</a>
                                        <button type="submit">Book appointment</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Booking end-->

<?php
include_once './footer.php';
?>