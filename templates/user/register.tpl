<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 注册页面</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" rev="stylesheet" href="/static/CSS/main.css" type="text/css" media="all" />
	<link rel="icon" type="/image/ico" href="favicon.ico">    
</head>

<body>
	<div class="headerimg"></div>
    {include file="common/header.tpl"}
    	<div class="container" style="padding-top:40px;">
        	<div class="loginbox" style="z-index:2; top:50px;">
                    <div style="width:90%; padding:00px 5% 50px 5%;">
                        <div class="title24" style="font-size:28px; line-height:60px; height:60px; color:#999; text-align:center;">用户注册</div>
                            <fieldset style="border:none; padding:0; margin:0;">
                                <form accept-charset="UTF-8" class="new_user" method="post">
                                    <div class="field">
                                        <input type="text"  class="login" id="user_email" name="user_email" style="width:295.59px" placeholder="你的电子邮件地址" />
                                    </div><div style="height:5px"></div>
                                    <div class="field">
                                        <input type="password" class="login" id="user_password" name="user_password" style="width:295.59px" placeholder="注册密码"/>
                                    </div><div style="height:5px"></div>
                                    <div class="field">
                                        <input type="password" class="login" id="user_password2" name="user_password2" style="width:295.59px" placeholder="确认密码" />
                                    </div><div style="height:15px"></div>
                                    <div class="field action">
                                        <input class="buttonmedium" id="register_btn" name="register_btn" type="button" value="确认并提交" style="width:100%;">
                                    </div>
                                </form>
                            </fieldset>
                        </div>
            </div>
            <div style="clear:both"></div>
        </div>
        
    </div>
	<div style="position:relative; height:95px;"></div>
    {include file="common/footer.tpl"}
    <script src="../../static/js/jquery.js"></script>
    <script src="../../static/js/common.js"></script>
    <script src="/static/js/ieplaceholder.js"></script>
    <script>
        $(function() {
            $("#user_email").change(function(e){
                var user_email = $("#user_email").val();
                $.ajax({
                    type:	"POST",
                    url :	"/user/check_email.php",
                    data:   {
                        user_email     : user_email,
                    },
                    dataType: "json",
                    timeout:120000, // 2min
                    success: function (obj) {
                        if(obj.errCode != 0 ){
                            toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
                            $("#user_email").val("");
                            $("#user_email").focus();
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
