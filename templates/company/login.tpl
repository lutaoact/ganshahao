<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 企业登录页面</title>
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
                                        <label for="company_account">账号</label>
                                        <input type="email" id="company_account" name="company_account" placeholder="为你分配的账号" />
                                    </div>
                                    <div class="field">
                                        <label for="company_password">密码</label>
                                        <input type="password" id="company_password" name="company_password" />
                                    </div>
                                    <div class="field action">
                                        <input class="button radius large green" id="login_btn" name="login_btn" type="button" value="登陆" >
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
                    "company_account"       : $("#company_account").val(),
                    "company_password"    : $("#company_password").val(),
                    "submit"           : 1
                };
                console.log($("#company_account").val());
                console.log($("#company_password").val());
                $.post('login.php', params,
                    function(obj) {
                        if(obj["errCode"] > 0) {
                            toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
                            $("#company_account").val(obj["company_account"]);
                            $("#company_password").val("");
                        } else if(obj["errCode"] == 0) {
                            location.href = "/company/company_profile.php";
                        }
                    },
                    "json"
                )
                .error( function() { toast('请求失败'); } );
            });
        });
    </script>
</body>
</html>
