<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>[干啥好] 工作详情</title>
    <link rel="stylesheet" href="/static/css/common.css" type="text/css" />
</head>
<body id="employer-profile" lang="en">
	{include file="common/header.tpl"}
	<div class="container content">
		<div class="row">
			<div class="content-container clearfix" id="main-content">
				<div class="columns twelve">
					<div class="clearfix" id="user-info">
						<div class="row">
							<div class="columns two>
								<div class="user-icon large round">
									<img src="">
								</div>
							</div>
							<div class="columns nine">
								<h1 class="page-title">
									<div class="job-title">Sales Associate</div>
									at
									<span class="employer">Banana Republic</span>
								</h1>
							</div>
							<div class="columns two apply-btn">
								<input id="job_id" type="hidden" value="{$job_id}">
                                <input class="button radius large green" id="apply_btn" name="apply_btn" type="button" value="申请">
                            </div>
						</div>
					</div>
					<div class="main-step clearfix" id="train_div" style="display:none;opacity:1;width:978px;">
						<div class="row">
							<div class="columns offset-by-one ten">
								<div class="content" style="display:block">
									<div class="clearfix training-info">
										<div id="training_content"></div>
										<div style="margin-top:20px;">
											<input class="button radius large green" id="next_training_btn" name="next_training_btn" type="button" value="下一题">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/common.js"></script>
    <script>
        var score;

        $(function() {
            $("#apply_btn").click(function(e) {
                console.log("apply this job");
				$(this).attr('disabled', true);
                $("#train_div").show();
                get_training();
            });

            $('#next_training_btn').click(function(e) {
                count_score();
            });
        });

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
                        $("#training_content").html('没有培训了');
                        $('#next_training_btn').hide();
                    } else {
                        $("#training_content").html(text);
                    }
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
    </script>
</body>
</html>
