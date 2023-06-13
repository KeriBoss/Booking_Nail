const set_company = document.getElementById('set_company');
const set_service = document.getElementById('set_service');
const set_staff = document.getElementById('set_staff');

const staff_id = document.getElementById('staff_id');

let hiddenModal = document.querySelector('.modal-body #set_service');

if(!staff_id){
    if(hiddenModal){
        var valueId = set_company.value;
        if(set_staff){
            $.ajax({
                url: 'action/ajax_get_staff.php',
                type: 'get',
                dataType: 'json',
                data: {
                    company_id: valueId
                }
            }).done(function (reponse) {
                getStaff(reponse);
            });
        }
        $.ajax({
            url: 'action/ajax_get_service.php',
            type: 'get',
            dataType: 'json',
            data: {
                company_id: valueId
            }
        }).done(function (reponse) {
            if(reponse.length > 1 && set_staff){
                set_staff.innerHTML = ``;
            }
            getService(reponse)
        });
    }
}else{
    var valueId = set_company.value;
    if(set_staff){
        $.ajax({
            url: 'action/ajax_get_staff.php',
            type: 'get',
            dataType: 'json',
            data: {
                company_id: valueId
            }
        }).done(function (reponse) {
            getStaff(reponse);
        });
    }
    if(set_company, set_service){
        $.ajax({
            url: 'action/ajax_get_service.php',
            type: 'get',
            dataType: 'json',
            data: {
                company_id: valueId
            }
        }).done(function (reponse) {
            if(reponse.length > 1 && set_staff){
                set_staff.innerHTML = ``;
            }
            getService(reponse)
        });
    }
}


if(set_company, set_service){
    set_company.addEventListener('change', function(e){
        var valueId = set_company.value;
        e.preventDefault();

        if(set_staff){
            $.ajax({
                url: 'action/ajax_get_staff.php',
                type: 'get',
                dataType: 'json',
                data: {
                    company_id: valueId
                }
            }).done(function (reponse) {
                getStaff(reponse);
            });
        }
        $.ajax({
            url: 'action/ajax_get_service.php',
            type: 'get',
            dataType: 'json',
            data: {
                company_id: valueId
            }
        }).done(function (reponse) {
            if(reponse.length > 1 && set_staff){
                set_staff.innerHTML = "";
            }
            getService(reponse);
        });
    })
    set_service.addEventListener('change', function(e){
        var valueId = set_service.value;
        e.preventDefault();

        if(set_staff){
            $.ajax({
                url: 'action/ajax_change_service.php',
                type: 'get',
                dataType: 'json',
                data: {
                    service_id: valueId
                }
            }).done(function (reponse) {
                console.log(reponse);
                getStaff(reponse);
            });
        }
    })
}

function getService(reponse){
    set_service.innerHTML = ``;
    reponse.forEach(element => {
        set_service.innerHTML += `
            <option value="${element['ID_service']}">${element['name_service']}</option>
        `
    });
}
function getStaff(reponse){
    set_staff.innerHTML = ``;
    reponse.forEach(element => {
        set_staff.innerHTML += `
            <option value="${element['ID_staff']}">${element['user_name']}</option>
        `
    });
}

//Check phone have exits
const phoneCompany = document.querySelector('.phone_company');
const form_company = document.getElementById('form_company');
let PHONE_NUMBER;
let CHECK_PHONE = false;

if(phoneCompany && form_company){
    phoneCompany.addEventListener('keyup', function(event){
        event.preventDefault();
        PHONE_NUMBER = event.target.value;

        $.ajax({
            url: 'ajax_checkphone_company.php',
            type: 'get',
            dataType: 'json',
            data: {
                phone: PHONE_NUMBER
            }
        }).done(function (reponse) {
            if(reponse === true){
                CHECK_PHONE = true;
            }
            else{
                CHECK_PHONE = false;
            }
        });
    })
}

window.addEventListener('load', function(){
    if(form_company){
        form_company.addEventListener('submit', function(event){
            if(CHECK_PHONE === false){
                event.preventDefault();
                phoneCompany.style.border = '1px solid red';
                alert("Phone number have exists")
            }else{
                return true;
            }
        })
    }
})

function validate(){
    if(phoneCompany){
        var regName = /^[0-9]{3}-[0-9]{3}-[0-9]{4}$/;
        var regPhoneVN = /^[0-9]{9,12}$/;
        if(!regName.test(phoneCompany.value) && !regPhoneVN.test(phoneCompany.value)){
            var str = '';
            if(!regName.test(phoneCompany.value)){
                str = 'Phone number must be formattrd in XXX-XXX-XXXX or Vietnamese phone number with 9 to 12 digits';
            }
            if(!regPhoneVN.test(phoneCompany.value)){
                str = 'Phone number must be formattrd in XXX-XXX-XXXX or Vietnamese phone number with 9 to 12 digits';
            }
            alert(str);
            phoneCompany.focus();
            return false;
        }else{
            return true;
        }
    }
}