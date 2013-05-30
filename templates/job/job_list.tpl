<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 工作列表</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../static/css/common.css" type="text/css" />
</head>
<body>
    <label for="zipcode">您工作目标地点的邮编:</label>
    <input type="text" name="zipcode" maxlength="6" id="zipcode" placeholder="200001" />
    <span id="search_btn" name="search_btn" class="common_btn">搜索</span></br>
    <div id="job_list">
        <ul>{include file='job/job_list_div.tpl'}</ul>
    </div>

    <script src="../../static/js/jquery.js"></script>
    <script src="../../static/js/common.js"></script>
    <script>
        $(function() {
            $("#search_btn").click(function(e) {
                var zipcode = $("#zipcode").val();
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
                        if (text == "") {
                            $("#job_list").html('没有相关职位');
                        } else {
                            $("#job_list").html(text);
                        }
                    },
                });
            });
        });
    </script>
</body>
