<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 密码找回</title>
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
                        <div class="title24" style="font-size:28px; line-height:60px; height:60px; color:#999; text-align:center;">密码找回</div>
                <fieldset style="border:none;">
                    <div>
                        <input type="email" class="login" id="user_email" name="user_email"  style="width:295.59px; margin:40px 0 50px 0;" placeholder="注册邮箱" />
                        <input type="button" id="find_btn" name="find_btn"  class="buttonmedium" value="确认并提交" style="width:100%;"/>
                    </div>
                </fieldset>
                        </div>
            </div>
            <div style="clear:both"></div>
        </div>
        
    </div>
	<div style="position:relative; height:95px;"></div>
    {include file="common/footer.tpl"}
    <script type="text/javascript" src="/static/js/loginexpand.js"></script>
	<script type="text/javascript" src="/static/js/jquery.alsEN-1.0.min.js"></script>
    <script src="/static/js/ieplaceholder.js"></script>
    <script>
        $(function() {
            $('#find_btn').click(function() {
                var user_email = $('#user_email').val();
                if (user_email == "") {
                    alert("请输入您的注册邮箱");
                } else {
                    $.ajax({
                        type:"POST",
                        url :"/user/forget_password.php",
                        data:   {
                            'user_email'  : $('#user_email').val(),
                        },
                        dataType: "json",
                        timeout:120000, // 2min
                        success: function (obj) {
                            if(obj.errCode == 0 ){
                                toast("请在邮件中查收！");
                            }else{
                                toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
                            }
                        },
                        error: function (data) {
                            console.log(data);
                            toast_err("邮件发送失败不成功");
                        },
                    });
                }
            });
        });
    </script>
</body>
</html>