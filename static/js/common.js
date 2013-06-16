//---------------------//
//	 common function   //
//---------------------//
function toast( msg, callback ){
	alert(msg, callback);
}

function toast_err( msg, callback ){
	alert(msg, callback);
}

function toast_info( msg, callback ){
    alert(msg, callback);
}

function toast_confirm(msg, callback){
	alert(msg, callback);
}

$(document).ready(function(){
    $.ajax({
        type:	"POST",
        url :	"/user/check_login.php",
        dataType: "json",
        timeout:120000, // 2min
        success: function (obj) {
            console.log(obj.user_id);
            if (obj.user_id == null) {
                $("#signin_navi").hide();
                $("#unsignin_navi").show();
            } else {
                $("#signin_navi").show();
                $("#unsignin_navi").hide();
            }
        }
    });
});