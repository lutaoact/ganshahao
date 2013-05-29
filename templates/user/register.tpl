<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 注册页面</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../static/css/common.css" type="text/css" />
</head>

<body>
    <form class="user_info" method="post">
        <ol>
            <li>
                <label for="user_email">注册邮箱 <span>*</span></label>
                <input type="text" id="user_email" name="user_email" placeholder="example@example.com" />
            </li>
            <li>
                <label for="user_password">登录密码 <span>*</span></label>
                <input type="password" id="user_password" name="user_password" />
            </li>
            <li>
                <label for="user_password2">确认密码 <span>*</span></label>
                <input type="password" id="user_password2" name="user_password2" />
            </li>
            <div id="divide_line">(<span>*</span>)标记为必填项</div>
        </ol>
        <span id="register_btn" name="register_btn" class="common_btn">注册</span>
    </form>

    <script src="../../static/js/jquery.js"></script>
    <script src="../../static/js/common.js"></script>
    <script>
        $(function() {
            $("#user_email").change(function(e){
                var user_email = $("#user_email").val();
                $.ajax({
                    type:	"POST",
                    url :	"/user/checkEmail.php",
                    data:   {
                        user_email     : user_email,
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

            $("#register_btn").click(function(e) {
                var user_email = $("#user_email").val();
                var user_password = $("#user_password").val();
                var user_password2 = $("#user_password2").val();
                if(user_email < 1){
                    toast_info("请输入您的邮箱");
                    return;
                }
                if(user_password < 1){
                    toast_info("请输入您的密码");
                    return;
                }
                if(user_password2 < 1){
                    toast_info("请输入您的确认密码");
                    return;
                }

                $.ajax({
                    type:	"POST",
                    url :	"/user/register.php",
                    data:   {
                        user_email     : user_email,
                        user_password  : user_password,
                        user_password2 : user_password2,
                        submit         : 1,
                    },
                    dataType: "json",
                    timeout:120000, // 2min
                    success: function (obj) {
                        if(obj.errCode == 0 ){
                            toast("注册成功");
                            window.location.href="../home.php";
                        }else{
                            toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
                        }
                    },
                    error: function(){
                        toast_err("提交失败");
                    }
                });
            });
        });
    </script>
</body>
</html>
