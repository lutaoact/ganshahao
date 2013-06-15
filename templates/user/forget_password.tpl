<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 密码找回</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/static/css/common.css" type="text/css" />
    <link rel="stylesheet" rev="stylesheet" href="/static/CSS/main.css" type="text/css" media="all" />
	<link rel="icon" type="/image/ico" href="favicon.ico">
</head>

<body>
    {include file="common/header.tpl"}
    <div class="container content" style="height:300px;">
        <div class="row">
            <div class="columns five centered">
                <fieldset>
                    <h3>密码找回</h3>
                    <div>
                        <em>注册邮箱</em>
                        <input type="email" id="user_email" name="user_email" placeholder="example@example.com" />
                        <input type="button" id="find_btn" name="find_btn" value="提交"/>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    {include file="common/footer.tpl"}
    <script type="text/javascript" src="/static/js/loginexpand.js"></script>
	<script type="text/javascript" src="/static/js/jquery.alsEN-1.0.min.js"></script>
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