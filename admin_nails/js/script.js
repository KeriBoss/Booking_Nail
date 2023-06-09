
// Get the modal
var modal = document.getElementById("newModal");
var modalService = document.getElementById("modalService");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");
var myBtnService = document.getElementById("myBtnService");

// Get the <span> element that closes the modal
var span1 = document.querySelectorAll(".close1");
var span = document.querySelectorAll(".close");

if(modal && btn && span1){
    if (modal.dataset.display == 'true') {
        modal.style.display = 'block'
    } else if (modal.dataset.display == 'false') {
        modal.style.display = 'none'
    }
    
    
    // When the user clicks the button, open the modal 
    btn.onclick = function () {
        modal.style.display = "block";
    }
    
    // When the user clicks on <span> (x), close the modal
    span1.forEach(item => {
        item.onclick = function (event) {
            if (event.target.dataset.modal == 'close') {
                modal.style.display = "none";
            }
        }
    
    })
}
if(modalService && myBtnService && span){
    if (modalService.dataset.display == 'true') {
        modalService.style.display = 'block'
    } else if (modalService.dataset.display == 'false') {
        modalService.style.display = 'none'
    }
    
    
    // When the user clicks the button, open the modal 
    myBtnService.onclick = function () {
        modalService.style.display = "block";
    }
    
    // When the user clicks on <span> (x), close the modal
    span.forEach(item => {
        item.onclick = function () {
            if (item.dataset.modal == 'close') {
                modalService.style.display = "none";
            }
        }
    
    })
}
// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target == modalService) {
        modalService.style.display = "none";
    }
    if (event.target == modal) {
        modal.style.display = "none";
    }
    
}


$('#time_start').timepicker({
    timeFormat: 'H:i',
});
$('#time_end').timepicker({
    timeFormat: 'H:i',
});
$('#time_completion').timepicker({
    timeFormat: 'H:i',
    step: 15,
});

//Show password
$(".reveal").on('click',function() {
    var $pwd = $(".pwd");
    if ($pwd.attr('type') === 'password') {
        $pwd.attr('type', 'text');
    } else {
        $pwd.attr('type', 'password');
    }
});
