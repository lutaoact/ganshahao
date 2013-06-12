<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>[干啥好] 工作详情</title>
    <script src="/static/js/common.js"></script>
    <link rel="stylesheet" rev="stylesheet" href="/static/CSS/main.css" type="text/css" media="all" />
	<script type="text/javascript" src="/static/js/loginexpand.js"></script>
	<script src="/static/js/jquery.js"></script>
	<script type="text/javascript" src="/static/js/jquery.alsEN-1.0.min.js"></script>

	<link rel="icon" type="/image/ico" href="favicon.ico">
</head>
<body id="employer-profile" lang="en">
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
        <input class="jobinfobut" id="apply_btn" name="apply_btn" type="button" value="现在申请" />
    </div></div>
    <!-- jobinfo item -->
</div>
<div class="rightcol">
	<div class="jobinfo">
    	{$job.job_description}
        <div id="training_content"></div>
        <div id="no_training_div" style="display:none">
        	该职位没有提供相关培训
        	<div style="margin-top:20px;">
        	<input class="button radius large green" type="button" onclick="save_job_apply()" value="直接申请">
            </div>
        </div>
        <div id="training_result_div" style="display:none">
        	<h3>您的培训成绩为：</h3>
        	<div id="training_result"></div>
        	<input class="button radius large green" type="button" onclick="save_job_apply()" value="申请">
        	<input class="button radius large green" type="button" onclick="redo_training()" value="重做">
        </div>
        <div id="apply_finish_div" style="display:none">
        	<h5>已经提交职位申请，请耐心等待企业的回复</h5>
        	<div id="apply_success_div" style="display:none">
            </div>
        </div>
    </div>
</div>
<div style="clear:both; height:40px;"></div>
</div>
</section>
    {include file="common/footer.tpl"}
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/common.js"></script>
    <script src="/static/js/HashMap.js"></script>
    <script src="/static/js/job_detail.js"></script>
</body>
</html>
