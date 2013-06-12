<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 工作列表</title>
    <meta charset="UTF-8" />
    <script src="/static/js/common.js"></script>
    <link rel="stylesheet" rev="stylesheet" href="/static/CSS/main.css" type="text/css" media="all" />
	<script type="text/javascript" src="/static/js/loginexpand.js"></script>
	<script src="/static/js/jquery.js"></script>
	<script type="text/javascript" src="/static/js/jquery.alsEN-1.0.min.js"></script>

	<link rel="icon" type="/image/ico" href="favicon.ico">
</head>
<body id="explore" lang="en">
	{include file="common/headersec.tpl"}
    <section>
<div class="container">
	<div class="joblisttitle">
    黄浦区 上海
					
					<input style="margin-left:20px;" type="text" name="zipcode" id="zipcode" maxlength="6" placeholder="您工作目标地点的邮编" />
					<input class="button radius large green" id="search_btn" name="search_btn" type="button" value="搜索">
					
				
    </div>
    {include file='job/job_list_div.tpl'}
    <div style="clear:both; height:30px;"></div>
	</div>
	</section>
    
	
    
    {include file="common/footer.tpl"}
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
