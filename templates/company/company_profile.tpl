<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>[干啥好] 公司信息</title>
    <link rel="stylesheet" href="/static/css/common.css" type="text/css" />
</head>
<body id="company-profile" lang="en">
	{include file="common/header_company.tpl"}
    <div class="container content">
		<div class="row">
            <div class="columns twelve">
                <h3>{$company.name}</h3>
                {foreach $job_applications as $job_application}
                    <h5>{$job_application.user_name}申请了{$job_application.job_name}</h5>
                {/foreach}
            </div>
        </div>
    <div>
    {include file="common/footer.tpl"}
</body>
</html>