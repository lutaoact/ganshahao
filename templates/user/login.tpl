<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 登录页面</title>
    <meta charset="UTF-8" />
    <script src="/ganshahao/static/js/jquery-2.0.0.min.js"></script>
    <script src="/ganshahao/static/js/common.js"></script>
    <script>
        $("#login_btn").click(function(e) {
                toast('---->>>>login click');
                var params = {
                    "login_email" : $("#login_user_email").val(),
                    "password"    : $("#login_user_pwd").val(),
                    "submit"      : 1
                };
                $.post('/user/login.php', params,
                    function(result) {
                        if(result["errCode"] > 0) {
                            toast_err(result["errMsg"]);
                        } else if(result["errCode"] == 0) {
                            toast(result["result"]["message"]);
                            setTimeout(function(){ location.href = "{$jumpto}"; }, 1000);
                        }
                    },
                    "json"
                )
                .error( function() { toast_err('请求失败'); } );
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
            <input type="submit" value="Submit" />
            <input type="reset" value="Reset" />
        </div>
        <div id="verify_user_part">
            <input type="hidden" id="inviter" value="{$inviter|default:''}">
            <p>申&nbsp;请&nbsp;注&nbsp;册</p>
            <div class="input_area">
                <label for="register_user_email">您的邮箱(<span>*</span>)：</label>
                <input type="email" id="register_user_email" name="register_user_email" placeholder="example@example.com" /><br /><br />
            </div>
            <span id="register_btn" name="register_btn" class="common_btn">提交申请</span>
            <span class="return_btn common_btn">返回</span>
        </div>
    </form>
</body>
</html>
