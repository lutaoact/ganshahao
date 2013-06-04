<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 工作详情</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/static/css/common.css" type="text/css" />
</head>
<body>
    <div>
        <img src="/static/img/{$company.logo}" />
        <h2>{$company.name}</h2>
        <p>{$company.description}</p>
        {foreach $job_list as $job}
            <div>
                <a href="/job/job_detail.php?job_id={$job.id}"><h3>{$job.name}</h3></a>
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