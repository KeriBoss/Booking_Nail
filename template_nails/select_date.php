<?php
include_once './header.php';
require_once '../model/staff.php';

$arr_allTime = [];//Array time all time frames 
$arr_morning = [];//Array time in morning of service
$arr_afternoon = [];//Array time in afternoon of service
$arr_evening = [];//Array time in evening of service

if(isset($_GET['staff_id']) && $_GET['staff_id'] != 'undefined'){
    $com_id = $_GET['id'];
    $staff_id = $_GET['staff_id'];

    $staff = new Staff();
    $getStaffById = $staff->getStaffById($staff_id);
    
    
        $time_start = $getStaffById[0]['time_start'];
        $time_end = $getStaffById[0]['time_end'];
        $time_completion = $getStaffById[0]['time_completion'];
    
        $startTime = date($time_start);//khởi tạo
        $endTime = date($time_end);//khởi tạo
    
        $hour = substr($time_completion,0,2);
        $minute = substr($time_completion,3,2);
        $second = substr($time_completion,6,2);
    
        $cenvertedTime = date('H:i:s',strtotime("+$hour hour +$minute minutes +$second seconds",strtotime($startTime)));
    
        $last_timeJob = date('H:i:s',strtotime("-$hour hour -$minute minutes -$second seconds",strtotime($endTime)));
    
        array_push($arr_allTime, $time_start);
    
        $tempTime;
        for ($i=0; $i < 48; $i++) { 
            $tempTime = date('H:i:s',strtotime("+$hour hour +$minute minutes +$second seconds",strtotime($startTime)));
            $startTime = $tempTime;
            if(strtotime($startTime) >= strtotime($last_timeJob)){
                break;
            }
            array_push($arr_allTime, $tempTime);
        }
    
        //Add once time in frame
        foreach($arr_allTime as $item){            
            $hour_start = substr($item,0,2);

            $minute_start = substr($item,3,2);

            $period_start = $hour_start  >= 12 ? 'PM' : 'AM';
            $hour_start = $hour_start > 12 ? $hour_start - 12 : $hour_start;
            $hour_start = $hour_start < 10 && strlen($hour_start) < 2 ? '0'.$hour_start : $hour_start;

            $last_time_start = $hour_start . ':' . $minute_start . '' . $period_start;

            if(strtotime($item) <= strtotime("12:00:00")){
                array_push($arr_morning, $last_time_start);
            }else if(strtotime($item) > strtotime("12:00:00") && strtotime($item) <= strtotime("17:00:00")){
                array_push($arr_afternoon, $last_time_start);
            }else{
                array_push($arr_evening, $last_time_start);
            }
            
        }
}else{
    header("location: 404.php");
}



?>
    <!-- Booking start-->
    <section class="booking-nail mb-5 pt-5">
        <div class="container">
            <form action="./ajax_show_cart.php" method="get">
            <?php if(isset($_GET['staff_id'])){ ?>
                <input type="number" id="guest_com" name="staff_id" value="<?=$staff_id?>" hidden>
                <input type="number" id="id_staff" name="staff_id" value="<?=$staff_id?>" hidden>
            <?php } ?>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="pickup-main">
                            <div class="title">
                                <h5>Select date and time</h5>
                            </div>
                            <div class="list-date mt-3 mb-3">
                            <!-- onchange="propressTime(<?=$staff_id?>);" -->
                                <input id="myInput" name="date_checked" class="form-control" hidden/>
                                <div class="row">
                                    <div class="col-lg-12 col-12 text-center">
                                        <a class="month-year"><b>March, 2023</b></a>
                                    </div>
                                    <div class="col-12 p-0">
                                        <div class="group-date py-3">
                                            <div class="btn btn-previous"><i class='bx bxs-chevron-left'></i></div>
                                            <div class="parent-date">
                                                <div class="list-date">
                                                    <div class="item">
                                                        <div class="info-date">
                                                            <p class="date-letter">SUN</p>
                                                            <p class="date-number">01</p>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <div class="info-date">
                                                            <p class="date-letter">MON</p>
                                                            <p class="date-number">01</p>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <div class="info-date">
                                                            <p class="date-letter">TUE</p>
                                                            <p class="date-number">01</p>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <div class="info-date">
                                                            <p class="date-letter">WED</p>
                                                            <p class="date-number">01</p>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <div class="info-date">
                                                            <p class="date-letter">THU</p>
                                                            <p class="date-number">01</p>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <div class="info-date">
                                                            <p class="date-letter">FRI</p>
                                                            <p class="date-number">01</p>
                                                        </div>
                                                    </div>
                                                    <div class="item">
                                                        <div class="info-date">
                                                            <p class="date-letter">SAT</p>
                                                            <p class="date-number">01</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn btn-next"><i class='bx bxs-chevron-right' ></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-12 p-0 mb-2">
                                        <div class="title-time">
                                            <h5><b>Morning</b></h5>
                                            <div class="line"></div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="row text-center list-hour">
                                            <?php foreach($arr_morning as $item){ ?>
                                                <div class="col-lg-3 col-md-6 col-6">
                                                    <input type="radio" name="time_checked" value="<?=$item?>" hidden>
                                                    <?=$item?>
                                                </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-12 p-0 mb-2">
                                        <div class="title-time">
                                            <h5><b>Afternoon</b></h5>
                                            <div class="line"></div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="row text-center list-hour">
                                            <?php foreach($arr_afternoon as $item){ ?>
                                                <div class="col-lg-3 col-md-6 col-6">
                                                    <input type="radio" name="time_checked" value="<?=$item?>" hidden>
                                                    <?=$item?>
                                                </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-12 p-0 mb-2">
                                        <div class="title-time">
                                            <h5><b>Evening</b></h5>
                                            <div class="line"></div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="row text-center list-hour">
                                            <?php foreach($arr_evening as $item){ ?>
                                                <div class="col-lg-3 col-md-6 col-6">
                                                    <input type="radio" name="time_checked" value="<?=$item?>" hidden>
                                                    <?=$item?>
                                                </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="footer-end mt-5">
                                <div class="group-btn">
                                    <a href="index.php?id=<?=$ID_COM?>" class="back">Back</a>
                                    <button type="submit">Continue</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- Booking end-->

<?php
include_once './footer.php';
?>