<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 工作详情</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/static/css/common.css" type="text/css" />
</head>
<body>
    <div>
        <h2>{$job_name}</h2>
        <p>at<i>{$company_name}</i></p><br>
        <p>{$job_description}</p><br>
        <p>location: {$job_address}</p>
        <span id="apply_btn" name="apply_btn" class="common_btn">申请</span></br>
    </div>


    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/common.js"></script>
    <script>
        $(function() {
            $("#apply_btn").click(function(e) {
                toast("apply this job");
            });
        });
    </script>
</body>