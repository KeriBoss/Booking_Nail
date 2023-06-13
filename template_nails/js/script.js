const list_hour = document.querySelectorAll('.list-hour');
        if(list_hour){
            list_hour.forEach(item => {
                var arr = item.querySelectorAll('div');
                arr.forEach(data => {
                    data.addEventListener('click', function(){
                        clear();
                        data.classList.add('active');
                        data.querySelector('input[type=radio]').checked = true;
                    })
                })
            })
        }
        function clear(){
            if(list_hour){
                list_hour.forEach(item => {
                    var arr = item.querySelectorAll('div');
                    arr.forEach(data => {
                        data.classList.remove('active');
                    })
                })
            }
        }


//
// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}


const validName = document.getElementById('valid-name');
const validPhone = document.getElementById('valid-phone');


function validate(){
    if(validPhone && validName){
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

    return true;
}
// if(validPhone){
//     validPhone.addEventListener("invalid", function(event) {
//         event.preventDefault();
//         validPhone.setCustomValidity("Please enter a valid input");
//     });
// }

//Change color BG
const settingColor = document.querySelector('.setting-color');
const btnSetting = document.querySelector('.setting-color .icon-setting');
const groupBtn = document.querySelectorAll('.setting-color .group-color ul button');

if(btnSetting){
    btnSetting.addEventListener('click', function(){
        settingColor.classList.toggle('active')
    })
}
if(groupBtn){
    groupBtn.forEach(item => {
        item.addEventListener('click', function(event){
            const root = document.querySelector(':root');

            var color = event.target.dataset.color;
            var colorBtn = event.target.dataset.button;
            // set css variable
            root.style.setProperty('--bg-home', color);
            root.style.setProperty('--btn-main', colorBtn);
            root.style.setProperty('--bg-main', colorBtn);

            // Save data in localStorage
            localStorage.setItem('bgColor', color);
            localStorage.setItem('btnColor', colorBtn);
            localStorage.setItem('bgMain', colorBtn);

            // console.log( getComputedStyle(root).getPropertyValue('--bg-main'));
        })
    })
}
window.addEventListener('load', function(event){
    if(localStorage.getItem('bgColor') && localStorage.getItem('btnColor') && localStorage.getItem('bgMain')){
        var root = document.querySelector(':root');
        root.style.setProperty('--bg-home', localStorage.getItem('bgColor'));
        root.style.setProperty('--btn-main', localStorage.getItem('btnColor'));
        root.style.setProperty('--bg-main', localStorage.getItem('bgMain'));
    }
})