<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 工作详情</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/static/css/common.css" type="text/css" />
</head>
<body>
    <div>
        <input type="text" readonly="readonly" name="job_id" id="job_id" value='{$job_id}' />
        <h2>{$job_name}</h2>
        <p>at<i>{$company_name}</i></p><br>
        <p>{$job_description}</p><br>
        <p>location: {$job_address}</p>
        <span id="apply_btn" name="apply_btn" class="common_btn">申请</span></br>
    </div>

    <div id="train_div" name="train_div" style="display:none">
        <div id="training_content"></div>
        <span id="next_training_btn" name="next_training_btn" class="common_btn">下一题</span></br>
    </div>


    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/common.js"></script>
    <script>
        $(function() {
            $("#apply_btn").click(function(e) {
                console.log("apply this job");
                $("#train_div").show();
                get_training();
            });

            $('#next_training_btn').click(function(e) {
                get_training();
            });
        });

        function get_training() {
            console.log("---->>>>get training");
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
                        $("#training_content").html('没有相关问题');
                    } else {
                        $("#training_content").html(text);
                    }
                },
            });
        }

        function check(question_id, current_answer) {
            var job_id = $("#job_id").val();
            $.ajax({
                type:	"POST",
                url :	"/job/get_question_answer.php",
                data:   {
                    question_id : question_id,
                },
                dataType: "json",
                timeout:120000, // 2min
                success: function (obj) {
                    if (obj.errCode != 0) {
                        toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
                    }
                    console.log(obj.result.question_answer);
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
                    document.getElementById(question_id+correct_answer).style.color = "red";
                }
                elements[i].disabled=true;
            }
        }
    </script>
</body>