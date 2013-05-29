<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 工作列表</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../static/css/common.css" type="text/css" />
</head>
<body>
    <label for="zipcode">您工作目标地点的邮编:</label>
    <input type="number" name="zipcode" id="zipcode"/>
    <span id="search_btn" name="search_btn" class="common_btn">登录</span></br>
    <ul>
        {foreach from=$jobArray item=job}
            <li>
                job_id : {$job.job_id}</br>
                company_id : {$job.company_id}</br>
                company_name : {$job.company_name}</br>
                job_name : {$job.job_name}
            </li>
        {/foreach}
    </ul>

    <script src="../../static/js/jquery.js"></script>
    <script src="../../static/js/common.js"></script>
    <script>
        $(function() {
            $("#search_btn").click(function(e) {
                var zipcode = $("#zipcode").val;
                $.ajax({
                    type:	"POST",
                    url :	"/job/job_list.php",
                    data:   {
                        zipcode     : zipcode,
                    },
                    dataType: "json",
                    timeout:120000, // 2min
                    success: function (obj) {
                        if(obj.errCode != 0 ){
                            toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
                        }
                    },
                });
            });
    </script>
</body>