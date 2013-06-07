<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 工作列表</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../static/css/common.css" type="text/css" />
</head>
<body id="explore" lang="en">
	{include file="common/header.tpl"}
	<div class="container content">
		<div class="row">
			<div class="columns twelve">
				<h1 class="page-title search-job">黄浦区 上海
					<div class="columns seven right">
					<input style="margin-left:20px;" type="text" name="zipcode" id="zipcode" maxlength="6" placeholder="您工作目标地点的邮编" />
					<input class="button radius large green" id="search_btn" name="search_btn" type="button" value="搜索">
					</div>
				</h1>
			</div>
		</div>
		<div class="row">
			<div class="columns twelve">
				<div id="job_list">
                    <ul class="block-grid three-up">
                        {include file='job/job_list_div.tpl'}
                    </ul>
                </div>
			</div>
		</div>
	</div>

    <script src="../../static/js/jquery.js"></script>
    <script src="../../static/js/common.js"></script>
    <script>
        function validate_zipcode(zipcode) {
            reg = /^\d{6}$/;
            return reg.test(zipcode);
        }

        $(function() {
            $("#search_btn").click(function(e) {
                var zipcode = $("#zipcode").val();
                if(zipcode == "") {
                    toast("请先输入邮编");
                    return;
                }

                $.ajax({
                    type:	"GET",
                    url :	"/job/job_list.php",
                    data:   {
                        zipcode     : zipcode,
                        search      : 1,
                    },
                    dataType: "text",
                    timeout:120000, // 2min
                    success: function (text) {

                        // try check error
                        try{
                            var obj = eval( "(" + text + ")" );
                            if (obj.errCode != 0) {
                                toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
                                $("#zipcode").focus();
                                $("#zipcode").val("");
                                return;
                            }
                        } catch(err) {
                            //TO DO
                        }

                        if (text == "") {
                            $("#job_list").html('没有相关职位');
                        } else {
                            $("#job_list").html('<ul class="block-grid three-up">'+text+'</ul>');
                        }
                    },
                });
            });
        });
    </script>
</body>
