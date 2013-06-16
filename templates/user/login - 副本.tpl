<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 登录页面</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" rev="stylesheet" href="/static/CSS/main.css" type="text/css" media="all" />
	<link rel="icon" type="/image/ico" href="favicon.ico">    
</head>

<body>
    {include file="common/header.tpl"}
    <div class="container" style="padding-top:40px;">
        <div class="loginbox" style="z-index:2; top:50px;">
                    <div style="width:90%; padding:00px 5% 50px 5%;">
                        <div class="title24" style="font-size:28px; line-height:100px; height:100px; color:#999; text-align:center;">企业用户登录</div>
                            <fieldset style="border:none; padding:0; margin:0;">
                                <form accept-charset="UTF-8" class="new_user" method="post">
                                    <div class="field">
                                        <label for="user_email">邮箱</label>
                                        <input type="email" class="login" id="user_email" name="user_email" style="width:295.59px" placeholder="example@example.com" />
                                        
                                    </div><div style="height:5px"></div>
                                    <div class="field">
                                        
                                        <input type="password" class="login" id="user_password" name="user_password" style="width:295.59px;" placeholder="密码" />
                                    </div><div style="height:20px"></div>
                                    <div class="field">
                                        <a href="forget_password.php">忘记密码？</a>
                                    </div>
                                    <div class="field action">
                                        <input id="login_btn" name="login_btn" type="button" class="buttonmedium" style="width:100%;" value="登陆" >
                                    </div>
                                </form>
                                <ul class="additional-links">
                                    <!-- <li><a href="">Forgot your password?</a></li> -->
                                </ul>
                            </fieldset>
                        </div>
            </div>
            <div style="clear:both"></div>
        </div>
        
    </div>
	<div style="position:relative; height:95px;"></div>
    
    
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
                                    <div class="field">
                                        <a href="forget_password.php">忘记密码？</a>
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
    {include file="common/footer.tpl"}
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
                    function(obj) {
                        if(obj["errCode"] > 0) {
                            toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
                            $("#user_email").val(obj["user_email"]);
                            $("#user_password").val("");
                        } else if(obj["errCode"] == 0) {
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
