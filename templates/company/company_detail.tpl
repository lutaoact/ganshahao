<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 工作详情</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/static/css/common.css" type="text/css" />
</head>
<body id="company">
    {include file="common/header.tpl"}
    <div class="container content">
        <div class="row">
            <div class="clearfix" id="user-info">
                <div class="row">
                    <div class="columns nine">
                        <h2>
                            {$company.name}
                        </h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="description">
                <h5>
                    {$company.description}
                </h5>
            </div>
        </div>
        <div class="row">
            <div class="job-titles">
                <ul>
                    {foreach $job_list as $job}
                        <li>
                            <div class="columns eight">
                                <a href="/job/job_detail.php?job_id={$job.id}" class="job-title-link">{$job.name}</a>
                            </div>
                        </li>
                    {/foreach}
                </ul>
            </div>
        </div>
    </div>
    
    {include file="common/footer.tpl"}
    <script src="/static/js/jquery.js"></script>
        <script src="/static/js/common.js"></script>
    <script>
        $(function() {

        });
    </script>
</body>