<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 登录页面</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/static/css/common.css" type="text/css" />
</head>

<body>
    {include file="common/header.tpl"}
    <div class="container content">
        <div class="row">
            <div class="columns seven centered">
                <div class="no-botton-padding" id="login-page">
                    <div class="login">
                        <h1>登录</h1>
                        <div class="email-login clearfix">
                            <fieldset>
                                <form accept-charset="UTF-8" class="new_user" method="post">
                                    <div class="field">
                                        <label for="user_email">邮箱</label>
                                        <input type="email" id="user_email" name="user_email" placeholder="example@example.com" />
                                    </div>
                                    <div class="field">
                                        <label for="user_password">密码</label>
                                        <input type="password" id="user_password" name="user_password" />
                                    </div>
                                    <div class="field action">
                                        <input class="button radius large green" id="login_btn" name="login_btn" type="button" value="登陆" >
                                        <input class="button radius large green" id="register_btn" name="login_btn" type="button" value="注册" style="margin-left:195px">
                                    </div>
                                </form>
                                <ul class="additional-links">
                                    <!-- <li><a href="">Forgot your password?</a></li> -->
                                </ul>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/common.js"></script>
    <script>
        $(function() {
            $("#login_btn").click(function(e) {
                var params = {
                    "user_email"       : $("#user_email").val(),
                    "user_password"    : $("#user_password").val(),
                    "submit"           : 1
                };
                $.post('login.php', params,
                    function(result) {
                        if(result["errCode"] > 0) {
                            toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
                            $("#user_email").val(result["user_email"]);
                            $("#user_password").val("");
                        } else if(result["errCode"] == 0) {
                            location.href = "{$jumpto}";
                        }
                    },
                    "json"
                )
                .error( function() { toast('请求失败'); } );
            });

            $("#register_btn").click(function(e) {
                location.href = "register.php";
            });
        });
    </script>
</body>
</html>
