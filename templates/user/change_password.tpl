<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 修改密码</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/static/css/common.css" type="text/css" />
</head>

<body>
    <form class="user_info" method="post">
        <ol>
            <li>
                <label for="current_password">当前密码<span>*</span></label>
                <input type="password" id="current_password" name="current_password" />
            </li>
            <li>
                <label for="new_password">新密码<span>*</span></label>
                <input type="password" id="new_password" name="new_password" />
            </li>
            <li>
                <label for="new_password2">确认新密码<span>*</span></label>
                <input type="password" id="new_password2" name="new_password2" />
            </li>
            <div id="divide_line">(<span>*</span>)标记为必填项</div>
        </ol>
        <input type="button" id="change_password_button" value="确认" />
    </form>

    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/common.js"></script>
    <script>
        $(function() {
            $("#change_password_button").click(function(e) {
                var current_password    = $("#current_password").val().trim();
                var new_password        = $("#new_password").val().trim();
                var new_password2       = $("#new_password2").val().trim();
                if (current_password.length < 1
                    || new_password.length < 1
                    || new_password2.length < 1
                ) {
                    alert("密码都不得为空");
                    return;
                }

                if (new_password != new_password2) {
                    alert("两次输入的密码不相符");
                    return;
                }

                $.ajax({
                    type:   "POST",
                    url :   "/user/change_password.php",
                    data:   {
                        current_password    : current_password,
                        new_password        : new_password,
                        new_password2       : new_password2,
                    },
                    dataType: "json",
                    timeout:120000, // 2min
                    success: function (obj) {
                        if(obj.errCode == 0 ){
                            toast("密码修改成功");
                            window.location.href="/user/settings.php";
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
    {include file="common/footer.tpl"}
</body>
</html>
