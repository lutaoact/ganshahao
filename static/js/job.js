var score;

$(function() {
    $("#job_apply_btn").click(function(e) {
        save_job_apply();
    });
    $("#apply_btn").click(function(e) {
        console.log("apply this job");
        check_real_info_setted();
    });

    $('#next_training_btn').click(function(e) {
        count_score();
    });
});

function check_real_info_setted() {
    $.ajax({
        type:	"POST",
        url :	"/user/check_real_info.php",
        dataType: "json",
        timeout:120000, // 2min
        success: function (obj) {
            if (obj.errCode == 0) {
            console.log('----' + obj.result);
                if (obj.result) {
                    $(this).attr('disabled', true);
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
            }
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
    save_score();
}

function save_score() {
    toast('您获得了: '+score+" 分");
    var training_id = $("#training_id").val();
    $.ajax({
        type:	"POST",
        url :	"/job/save_score.php",
        data:   {
            training_id  : training_id,
            score        : score,
        },
        dataType: "json",
        timeout:120000, // 2min
        success: function (obj) {
            if (obj.errCode == 0) {
                get_training();
            } else {
                toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
            }
        },
    });
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
                $('#training_complete_div').show();
                setTimeout(function(){ location.href = "/job/job_list.php"; }, 5000);
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
            document.getElementById(question_id+correct_answer).style.color = "red";
        }
        elements[i].disabled=true;
    }
}