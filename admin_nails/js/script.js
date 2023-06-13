
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


const validName = document.getElementById('valid-name');
const validPhone = document.getElementById('valid-phone');


function validate(){
    if(validPhone){
        var regName = /^[0-9]{3}-[0-9]{3}-[0-9]{4}$/;
        // var regPhoneVN = /^[0-9]{9,12}$/;
        if(!regName.test(validPhone.value)){
            var str = 'Phone number must be formattrd in XXX-XXX-XXXX';
            // if(!regPhoneVN.test(validPhone.value)){
            //     str = 'Phone number must be formattrd in XXX-XXX-XXXX or Vietnamese phone number with 9 to 12 digits';
            // }
            alert(str);
            return false;
        }

        
        if(validName){
            let valueName = validName.value;
            let arr = valueName.split(" ").filter(s => s!== "");
            if(arr.length != 2){
                validName.focus = true;
                alert("Full name included first name and last name. e.g. John Devid");
                return false;
            }else{
                validName.focus = false;
            }
        }
    }

    return true;
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
