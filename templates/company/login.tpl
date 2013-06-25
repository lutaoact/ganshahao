<!DOCTYPE html>
<html>
<head>
    <title>[干啥好] 企业登录页面</title>
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
                        <div class="title24" style="font-size:28px; line-height:100px; height:100px; color:#999; text-align:center;">企业用户登录</div>
                            <fieldset style="border:none; padding:0; margin:0;">
                                <form accept-charset="UTF-8" class="new_user" method="post">
                                    <div class="field">
                                        
                                        <input type="email" class="login" id="company_account" style="width:295.59px" name="company_account" placeholder="为你分配的账号" />
                                    </div><div style="height:5px"></div>
                                    <div class="field">
                                        
                                        <input type="password" class="login" id="company_password" style="width:295.59px;" placeholder="密码" name="company_password" />
                                    </div><div style="height:20px"></div>
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
    {include file="common/footer.tpl"}
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/common.js"></script>
    <script src="/static/js/ieplaceholder.js"></script>
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
