<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 登录页面</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../static/css/common.css" type="text/css" />
    <script src="../../static/js/jquery.js"></script>
    <script src="../../static/js/common.js"></script>
    <script>
        $(function() {
            $("#login_btn").click(function(e) {
                var params = {
                    "login_email" : $("#login_user_email").val(),
                    "password"    : $("#login_user_pwd").val(),
                    "submit"      : 1
                };
                $.post('../../user/login.php', params,
                    function(result) {
                        if(result["errCode"] > 0) {
                            alert(result["errMsg"]);
                        } else if(result["errCode"] == 0) {
                            alert(result["result"]["message"]);
                            setTimeout(function(){ location.href = "{$jumpto}"; }, 1000);
                        }
                    },
                    "json"
                )
                .error( function() { alert('请求失败'); } );
            });

            $("#register_btn").click(function(e) {
                var email = $("#register_user_email").val();
                var inviter = $("#inviter").val();
                if(email.length < 1){
                        toast_info("请输入您的邮箱");
                        return;
                }

                show_loading_msg();
                $.ajax({
                    type:	"POST",
                    url :	"/api/send_register_email.php",
                    data:   { login_email:email, inviter:inviter },
                    dataType: "json",
                    timeout:120000, // 2min
                    success: function (obj) {
                            hide_loading_msg();
                            if(obj.errCode == 0 ){
                                toast(obj.result['message'], function(){ 
                                        $("#verify_user_part").slideUp();
                                        $("#login_part").slideDown(); 
                                    });
                                $("#register_user_email").val('');
                            }else{
                                toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
                            }
                        },
                    error: function(){
                        hide_loading_msg();
                        toast_err("提交失败");
                    }
                });
            });
        });
    </script>
</head>

<body>
    <form class="contact_content" method="post">
        <div id="login_part">
            <p>登&nbsp;&nbsp;&nbsp;录</p>
            <div class="input_area">
                <label for="login_user_email">您的邮箱(<span>*</span>)：</label>
                <input type="email" id="login_user_email" name="login_user_email" placeholder="example@example.com" /><br />
                <label for="login_user_pwd">您的密码(<span>*</span>)：</label>
                <input type="password" id="login_user_pwd" name="login_user_pwd" placeholder="******" /><br />
            </div>
            <p id="forget_pwd">忘记密码</p><div class="clr"></div>
            <span id="login_btn" name="login_btn" class="common_btn">登录</span>
            <span id="register_first_btn" name="register_first_btn" class="common_btn">注册</span>
        </div>
    </form>
</body>
</html>
