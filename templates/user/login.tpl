<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 登录页面</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../static/css/common.css" type="text/css" />
</head>

<body>
    <form class="contact_content" method="post">
        <div id="login_part">
            <p>登录</p>
            <div class="input_area">
                <label for="user_email">您的邮箱(<span>*</span>)：</label>
                <input type="user_email" id="user_email" name="user_email" placeholder="example@example.com" /><br />
                <label for="user_password">您的密码(<span>*</span>)：</label>
                <input type="user_password" id="user_password" name="user_password" placeholder="******" /><br />
            </div>
            <span id="login_btn" name="login_btn" class="common_btn">登录</span>
            <span id="register_btn" name="register_btn" class="common_btn">注册</span>
        </div>
    </form>
    <script src="../../static/js/jquery.js"></script>
    <script src="../../static/js/common.js"></script>
    <script>
        $(function() {
            $("#login_btn").click(function(e) {
                var params = {
                    "user_email"       : $("#user_email").val(),
                    "user_password"    : $("#user_password").val(),
                    "submit"           : 1
                };
                $.post('../../user/login.php', params,
                    function(result) {
                        if(result["errCode"] > 0) {
                            toast(result["errMsg"]);
                        } else if(result["errCode"] == 0) {
                            toast(result["result"]["message"]);
                            setTimeout(function(){ location.href = "{$jumpto}"; }, 1000);
                        }
                    },
                    "json"
                )
                .error( function() { toast('请求失败'); } );
            });

            $("#register_btn").click(function(e) {
                location.href = "../../user/register.php";
            }
    </script>
</body>
</html>
