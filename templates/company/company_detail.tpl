<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 工作详情</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" rev="stylesheet" href="/static/CSS/main.css" type="text/css" media="all" />
	<link rel="icon" type="/image/ico" href="favicon.ico">    
</head>
<body id="company">
    {include file="common/headersec.tpl"}
    <div class="container" style="padding-top:40px; min-height:300px;">
        <div class="joblistblock"><div class="joblistcon">
    	<div class="joblistlogo"><!-- 公司图片 --><img src="/static/img/{$company.logo}" width="60" height="60"></div>
        <div class="joblistname"><!-- 公司名称 -->{$company.name}</div>
        <div class="joblist">
        {foreach $job_list as $job}
        <a href="/job/job_detail.php?job_id={$job.id}"><li><div class="jobstatus1"><!-- 职位状态 -->Hiring Now</div><div class="jobname"><!-- 职位名称 -->{$job.name}</div></li></a>
        {/foreach}
        </div>
    	</div></div>
        <div class="jobinfo" style="width:60%; padding-left:370px; padding-top:10px;">
        	{$company.description}
        </div></div>
            
    {include file="common/footer.tpl"}
    <script src="/static/js/jquery.js"></script>
        <script src="/static/js/common.js"></script>
    <script>
        $(function() {

        });
    </script>
</body>