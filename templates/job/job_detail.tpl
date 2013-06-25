<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>[干啥好] 工作详情</title>
    <link rel="stylesheet" rev="stylesheet" href="/static/css/main.css" type="text/css" media="all" />
    <link rel="stylesheet" href="/static/css/jquery.mCustomScrollbar.css" type="text/css" />
	<link rel="icon" type="/image/ico" href="favicon.ico">
</head>
<body id="employer-profile" lang="en" onLoad="get_training_list()">
	{include file="common/headersec.tpl"}
	<section>
<div class="container" style="padding-top:40px;">
<div class="leftcol">
    <!-- jobinfo item -->
    <div class="jobinfoblock"><div class="jobinfocon">
    	<div class="joblistlogo"><!-- 公司图片 --><img src="/static/img/{$job.company_logo}" width="60" height="60"></div>
        <div class="joblistname"><!-- 公司名称 -->{$job.company_name}</div>
        <div class="jobinfoname"><!-- 职位名称 -->{$job.job_name}</div>
        <input id="job_id" type="hidden" value="{$job.job_id}">
        <input class="jobinfobut" id="apply_btn" name="apply_btn" type="button" value="现在申请" onclick="jobdetaildisp()" />
    </div></div>
    <!-- jobinfo item -->
    <div id="training_list"></div>
    
</div>
<div class="rightcol">
	<div class="jobinfo">
    	<div id="jobdescription" style="display:inline">{$job.job_description}</div>
        <div id="training_content"></div>
        <div id="no_training_div" class="notification" style="display:none">
        	该职位没有提供相关培训
        	<div style="margin-top:20px;">
        	<input class="buttonlarge" type="button" onclick="save_job_apply()" value="直接申请">
            </div>
        </div>
        <div id="training_result_div" class="notification" style="display:none; padding:0;">
        	<div class="notification">您的培训成绩为：</div>
        	<div id="training_result" style="width:50%; padding:30px 25% 30px 25%; font-size:16px; -moz-box-shadow: 2px 2px 22px #eee inset,0px 0px 5px #999; -webkit-box-shadow: 2px 2px 22px #eee inset, 0px 0px 5px #999; box-shadow:  2px 2px 22px #eee inset, 0px 0px 5px #999;"></div>
            <div style="height:30px;"></div>
        	<input class="buttonlarge" type="button" onclick="save_job_apply()" value="申请">
        	<input class="buttonlarge" type="button" onclick="redo_training()" value="重做">
        </div>
        <div id="apply_finish_div" class="notification" style="display:none">
        	<div class="notificationicon">√</div>
            <div class="notification">已经提交职位申请，请耐心等待企业的回复</div>
        	<div id="apply_success_div" style="display:none">
            </div>
        </div>
        <input class="trainingbutton" id="next_training_btn" name="next_training_btn" type="button" value="继续培训" style="display:none;">
    </div>
</div>
<div style="clear:both; height:40px;"></div>

</div>
</section>


    {include file="common/footer.tpl"}
    <script src="/static/js/HashMap.js"></script>
    <script src="/static/js/job_detail.js"></script>
    <script src="/static/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script>
    (function($){
			$(window).load(function(){
				$("#trainingcontent").mCustomScrollbar({
					scrollButtons:{
						enable:true
					}
				});
			});
		})(jQuery);
	</script>
    <script type="text/javascript" src="/static/js/loginexpand.js"></script>
    <script type="text/javascript" src="/static/js/jobdetaildisp.js"></script>
</body>
</html>
