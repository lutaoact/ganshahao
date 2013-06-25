var score;
var scores_map = new HashMap();
(function($){
			$(window).load(function(){
				$("#trainingcontent").mCustomScrollbar({
					scrollButtons:{
						enable:true
					}
				});
			});
		})(jQuery);

$(function() {
/*     $("#job_apply_btn").click(function(e) {
        save_job_apply();
    }); */
    $("#apply_btn").click(function(e) {
        console.log("apply this job");
        check_real_info_setted();
    });

    $('#next_training_btn').click(function(e) {
        count_score();
        get_next_training();
    });
});

function check_real_info_setted() {
    $.ajax({
        type:	"POST",
        url :	"/user/check_real_info.php",
        dataType: "json",
        timeout:120000, // 2min
        success: function (obj) {
            switch (obj.errCode) {
                case 0:
                    $("#apply_btn").hide();
                    $("#train_div").show();
                    get_training();
                    break;
                case 151:
                    if (confirm("你还没有填写联系信息(姓名和电话)，现在就去设置？")) {
                        setTimeout(function(){ location.href = "/user/settings.php"; }, 500);
                    }
                    break;
                case 150:
                    if (confirm("你还没有登陆，先登陆？")) {
                        setTimeout(function(){ location.href = "/user/login.php?jumpto="+window.location.href; }, 500);
                    }
                    break;
                default:
                    toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
            }
            /* if (obj.errCode == 0) {
                if (obj.result) {
                    $("#apply_btn").hide();
                    $("#train_div").show();
                    get_training();
                } else {
                    if (confirm("你还没有填写联系信息(姓名和电话)，现在就去设置？")) {
                        setTimeout(function(){ location.href = "/user/settings.php"; }, 500);
                    } else {
                    }
                }
            } else {
                toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
            } */
        },
    });
}

function count_score() {
    var elements = $(":radio");
    for(var i=0; i<elements.length; i++) {
        if(elements[i].checked) {
            check(elements[i].name, elements[i].value);
        }
    }
    catch_score();
}

function catch_score() {
    var training_id = $("#training_id").val();
    var training_name = $("#training_name").val();
    var training_obj = new Object();
    training_obj.name = training_name;
    training_obj.score = score;
    scores_map.put(training_id, training_obj);
    console.log('---->>>>put: ' + training_id + training_obj + " :size " + scores_map.size());
}

function save_scores() {
    var keys = scores_map.keys();
    for (var index in keys) {
        var key = keys[index];
        var obj = scores_map.get(key);
        save_score(key, obj.score);
    }
}
function save_score(training_id, training_score) {
    /* toast('您获得了: '+score+" 分");
    var training_id = $("#training_id").val(); */
    console.log('---->>>>save score ' + training_id + " : " + training_score);
    $.ajax({
        type:	"POST",
        url :	"/job/save_score.php",
        data:   {
            training_id  : training_id,
            score        : training_score,
        },
        dataType: "json",
        timeout:120000, // 2min
        success: function (obj) {
            if (obj.errCode != 0) {
                toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
            }
        },
    });
}

function redo_training() {
    $("#training_number").val("0");
    $("#next_training_btn").show();
    $("#training_result_div").hide();
    scores_map.clear();
    get_training();
}

function get_next_training() {
    get_training();
}

function get_training() {
    score =0;
    var job_id = $("#job_id").val();
    var training_number = $("#training_number").val();
    $.ajax({
        type:	"POST",
        url :	"/job/job_detail.php",
        data:   {
            job_id            : job_id,
            training_number   : training_number,
            training          : 1,
        },
        dataType: "text",
        timeout:120000, // 2min
        success: function (text) {
            if (text == "") {
                $('#next_training_btn').hide();
                $("#training_content").hide();
            } else {
                $("#training_content").html(text);
            }
        },
    });
}

function save_job_apply() {
    save_scores();
    var job_id = $("#job_id").val();
    $.ajax({
        type :	"POST",
        async:  false,
        url  :	"/job/save_job_apply.php",
        data :   {
            job_id : job_id,
        },
        dataType: "json",
        timeout:120000, // 2min
        success: function (obj) {
            if (obj.errCode != 0) {
                toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
            } else {
                $('#job_apply_div').hide();
                $('#training_result_div').hide();
                $("#no_training_div").hide();
                $('#apply_finish_div').show();
                $('#apply_success_div').show();
                get_hot_jobs();
                //setTimeout(function(){ location.href = "/job/job_list.php"; }, 5000);
            }
        },
        error: function (obj) {
            toast_err("请求失败");
        },
    });
}

function check(question_id, current_answer) {
    console.log(question_id + ':' + current_answer);
    $.ajax({
        type :	"POST",
        async:  false,
        url  :	"/job/get_question_answer.php",
        data :   {
            question_id : question_id,
        },
        dataType: "json",
        timeout:120000, // 2min
        success: function (obj) {
            if (obj.errCode != 0) {
                toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
            }
            console.log('---->>>>answer: ' + question_id + ':' + obj.result.question_answer);
            handle_response(question_id, obj.result.question_answer);
        },
        error: function (obj) {
            toast_err("请求失败");
        },
    });
}

function handle_response(question_id, correct_answer) {
    var elements = document.getElementsByName(question_id);
    for(var i=0; i<elements.length; i++) {
        if(correct_answer == elements[i].value) {
            if(elements[i].checked) {
                score += 10;
            }
            //document.getElementById(question_id+correct_answer).style.color = "red";
        }
        elements[i].disabled=true;
    }
}

function adjust_result_page() {
    console.log('scores_map.size: ' + scores_map.keys().length);
    if (scores_map.size()>0) {
        $("#training_result_div").show();
        $("#training_result").html(draw_training_result_page());
    } else {
        $("#no_training_div").show();
    }
}

function draw_training_result_page() {
    var total_score = 0;
    var result = "<table style='width:100%;'>";
    var keys = scores_map.keys();
    for (var index in keys) {
        var obj = scores_map.get(keys[index]);
        total_score += obj.score;
        result += "<tr>" + "<td style='width:70%; text-align:left;'>" + obj.name + "</td><td style='width:30%; text-align:right;'>" + obj.score + "</tr>" 
    }
    result += "<tr>" + "<td style='font-size:22px; text-align:left;'>总分</td><td style='font-size:22px; text-align:right;'>" + total_score + "</tr></table>";
    console.log(result);
    return result;
}

function get_hot_jobs() {
    console.log("get hot jobs");
    $.ajax({
        type:	"POST",
        url :	"/job/hot_jobs.php",
        dataType: "text",
        timeout:120000, // 2min
        success: function (text) {
            $("#apply_success_div").html(text);
        },
    });
}

function get_training_list() {
    console.log("get training list");
    var job_id = $("#job_id").val();
	$.ajax({
        type:	"POST",
        url :	"/job/training_list.php",
		data :   {
            job_id : job_id,
        },
        dataType: "text",
        timeout:120000, // 2min
        success: function (text) {
            $("#training_list").html(text);
        },
    });
}