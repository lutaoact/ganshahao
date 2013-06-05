<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 工作详情</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/static/css/common.css" type="text/css" />
</head>
<body>
    {include file="common/header.tpl"}
    <div class="container content">
        <div class="row">
            <div class="company-with-logo">
                <a href="/job/job_detail.php?job_id={$job.id}">
                    <img alt="{$company.name}" src="/static/img/{$company.logo}" />
                </a>
                <h1 class="company">
                    {$company.name}
                </h1>
            </div>
        </div>
        <div class="row">
            <div class="description">
                {$company.description}
            </div>
        </div>
        {foreach $job_list as $job}
            <div class="row">
                <div class="job-title">
                    <h2>
                        <a href="/job/job_detail.php?job_id={$job.id}"><h3>{$job.name}</h3></a>
                    </h2>
                </div>
            </div>
        {/foreach}
    </div>

    <script src="/static/js/jquery.js"></script>
        <script src="/static/js/common.js"></script>
    <script>
        $(function() {

        });
    </script>
</body>