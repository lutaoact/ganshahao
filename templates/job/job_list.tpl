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
				<h1 class="page-title search-job">Jobs In Schenectady, NY
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
        $(function() {
            $("#search_btn").click(function(e) {
                var zipcode = $("#zipcode").val();
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
