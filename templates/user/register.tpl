<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 注册页面</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../static/css/common.css" type="text/css" />
</head>

<body>
    {include file="common/header.tpl"}
    <div class="container content">
        <div class="row">
            <div class="columns seven centered">
                <div class="no-botton-padding" id="login-page">
                    <div class="login">
                        <h1>用户注册</h1>
                        <div class="email-login clearfix">
                            <fieldset>
                                <form accept-charset="UTF-8" class="new_user" method="post">
                                    <div class="field">
                                        <label for="user_email">注册邮箱 <span>*</span></label>
                                        <input type="text" id="user_email" name="user_email" placeholder="example@example.com" />
                                    </div>
                                    <div class="field">
                                        <label for="user_password">登录密码 <span>*</span></label>
                                        <input type="password" id="user_password" name="user_password" />
                                    </div>
                                    <div class="field">
                                        <label for="user_password2">确认密码 <span>*</span></label>
                                        <input type="password" id="user_password2" name="user_password2" />
                                    </div>
                                    <div class="field action">
                                        <input class="button radius large green" id="register_btn" name="register_btn" type="button" value="注册">
                                    </div>
                                </form>
                                <ul class="additional-links">
                                    <li><a href="#">(<span>*</span>)标记为必填项</a></li>
                                </ul>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
                            window.location.href="../home.php";
                        }else{
                            toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
                            $("#user_email").val(obj.user_email);
                            $("#user_password").val("");
                            $("#user_password2").val("");
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
