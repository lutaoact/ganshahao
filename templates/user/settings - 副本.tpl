<!DOCTYPE html>
<html lang='zh'>
    <head>
    <meta charset="utf-8">
    <title>更新个人设置</title>
    <link rel="stylesheet" rev="stylesheet" href="/static/CSS/main.css" type="text/css" media="all" />
	<link rel="icon" type="/image/ico" href="favicon.ico">    </head>
    <body id="user-settings">
        {include file="common/headersec.tpl"}
		<div class="container">
			<div class="joblisttitle"> 更新个人设置 </div>
				<fieldset class="content-container clearfix">
                        <div>
                            <input type="hidden" id="user_id" name="user_id" value="{$user.id}" />
                        <div>
                        <div class="field profile-pic">
                            <label for="user_picture">头像</label>
                            <div class="row">
                                <div class="columns two">
                                    <div class="user-icon large">
                                    <img alt="Default-user-icon" src="/uploads/{$user.picture}">
                                    </div>
                                </div>
                                <div class="columns six">
                                    <div class="clearfix profile-pic-file-field">
                                    <form action="settings.php" enctype="multipart/form-data" method="post" class="clearfix">
                                        <input type="hidden" name="MAX_FILE_SIZE" value="1000000">
                                        <input type="button" class="clearfix pic-chose-btn" value="选择头像">
                                        <input type="text" id="pic-path" name="pic-path" class="clearfix">
                                        <input type="file" id="user_picture" name="user_picture" class="clearfix">
                                        <input type="submit" class="clearfix pic-chose-btn" value="上传" style="float:none;"/>
                                        <label style="font-size:12px;">{$user_picture_error}</label>
                                    </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="field nick">
                            <label for="user_nick_name">昵称</label>
                            <input class="field_change" id="user_nick_name" name="user_nick_name" value="{$user.nick_name}" size="30" type="text">
                        </div>
                        <div class="field name">
                            <label for="user_real_name">真实姓名</label>
                            <input class="field_change" id="user_real_name" name="user_real_name" value="{$user.real_name}" size="30" type="text">
                        </div>
                        <div class="field mobile">
                            <label for="user_mobile">手机</label>
                            <input class="field_change" id="user_mobile" name="user_mobile" value="{$user.mobile}" size="30" type="text">
                        </div>
                        <div class="field email">
                            <label for="user_email">邮箱</label>
                            {$user.email}
                            <input class="field_change" id="user_email" name="user_email" value="{$user.email}" size="30" type="hidden">
                            <a href="/user/change_password.php">修改密码</a>
                        </div>
                        <div class="field zipcode">
                            <label for="user_zipcode">邮政编码</label>
                            <input class="field_change" id="user_zipcode" name="user_zipcode" value="{$user.zipcode}" size="30" type="text">
                        </div>
                        <div class="field profile-resume">
                            <label for="user_resume">简历</label>
                            <div class="profile-resume-file-field" style="float:left;">
                                <form action="settings.php" enctype="multipart/form-data" method="post">
                                    <input type="hidden" name="MAX_FILE_SIZE" value="4000000">
                                    <input id="user_resume" style="border:0;" name="user_resume" type="file" accept="application/msword">最大4M，只支持pdf和doc格式<br/>
                                    <label>{$user_resume_error}</label>
                                    <input type="submit" value="上传" />
                                </form>
                                <a href="/uploads/{$user.resume nofilter}">下载简历</a>
                                <div style="color:#666;">
                                <input id="user_is_veteran" name="user_is_veteran" type="checkbox" value="{$user.is_veteran}"
                                {if $user.is_veteran}
                                    checked
                                {/if} style="width:2em;float:none"/>
                                <span style="font-size:1.4em;padding:5px;">我是有经验的老手</span>
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <label for="user_description">个人简介</label>
                            <div class="field-container">
                                <textarea class="field_change" cols="40" rows="5" id="user_description" name="user_description">{$user.description}</textarea>
                            </div>
                        </div>
                        <div class="field">
                            <label>空闲时间</label>
                            <table id="user_available_time">
                                <thead>
                                    <tr>
                                        <th class="time">时间</th>
                                        <th>周日</th>
                                        <th>周一</th>
                                        <th>周二</th>
                                        <th>周三</th>
                                        <th>周四</th>
                                        <th>周五</th>
                                        <th>周六</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="time"><em>凌晨(00:00-06:00)</em></td>
                                        {for $i = 0 to 6}
                                        <td>
                                        <input type="checkbox" class="available_time_check_box" value="{$user.available_time[$i]}"
                                            {if $user.available_time[$i] == 1}
                                                checked
                                            {/if}
                                        />
                                        </td>
                                        {/for}
                                    </tr>
                                    <tr>
                                        <td class="time"><em>下午(12:00-18:00)</em></td>
                                        {for $i = 7 to 13}
                                        <td>
                                        <input type="checkbox" class="available_time_check_box" value="{$user.available_time[$i]}"
                                            {if $user.available_time[$i] == 1}
                                                checked
                                            {/if}
                                        />
                                        </td>
                                        {/for}
                                    </tr>
                                    <tr>
                                        <td class="time"><em>晚上(18:00-24:00)</em></td>
                                        {for $i = 14 to 20}
                                        <td>
                                        <input type="checkbox" class="available_time_check_box" value="{$user.available_time[$i]}"
                                            {if $user.available_time[$i] == 1}
                                                checked
                                            {/if}
                                        />
                                        </td>
                                        {/for}
                                    </tr>
                                    <tr>
                                        <td class="time"><em>上午(06:00-12:00)</em></td>
                                        {for $i = 21 to 27}
                                        <td>
                                        <input type="checkbox" class="available_time_check_box" value="{$user.available_time[$i]}"
                                            {if $user.available_time[$i] == 1}
                                                checked
                                            {/if}
                                        />
                                        </td>
                                        {/for}
                                    </tr>
                                </tbody>
                            </table>
                            <div class="row">
                                <div class="columns nine settings">
                                    <div class="action">
                                        <input class="button radius large" id="update_available_time_button" type="button" value="更新空闲时间" />
                                    </div>
                                </div>
                            </div>
                        </div>
        	</fieldset>
                
		</div>
		{include file="common/footer.tpl"}
        <script src="/static/js/jquery.js"></script>
        <script src="/static/js/common.js"></script>
        <script>
        $(function() {
            $("#user_picture").change(function() {
                $("#pic-path").attr('value', $(this).val());
            });
            $(".field_change").change(function() {
                var field_name = $(this).attr('name');
                var field_value = $(this).val();
                $.ajax({
                    type:"POST",
                    url :"/user/settings.php",
                    data:   {
                        'field_name'  : field_name,
                        'field_value' : field_value,
                        'user_email'  : $('#user_email').val(),
                    },
                    dataType: "json",
                    timeout:120000, // 2min
                    success: function (obj) {
                        if(obj.errCode == 0 ){
                            toast("更新成功");
                        }else{
                            toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
                        }
                    },
                    error: function () {
                        toast_err("提交失败");
                    },
                });
            });
            $("#user_is_veteran").change(function() {
                if ($(this).val() == 1) {
                    $(this).val("0");
                } else {
                    $(this).val("1");
                }
                $.ajax({
                    type:"POST",
                    url :"/user/settings.php",
                    data:   {
                        'field_name'  : "user_is_veteran",
                        'field_value' : $("#user_is_veteran").val(),
                        'user_email'  : $('#user_email').val(),
                    },
                    dataType: "json",
                    timeout:120000, // 2min
                    success: function (obj) {
                        if(obj.errCode == 0 ){
                            toast("更新成功");
                        }else{
                            toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
                        }
                    },
                    error: function () {
                        toast_err("提交失败");
                    },
                });
            });
			$(".available_time_check_box").change(function() {
				if ($(this).val() == 1) {
					$(this).val("0");
				} else {
					$(this).val("1");
				}
			});
			$("#update_available_time_button").click(function() {
				var available_time_array = [];
				$(".available_time_check_box").each(function(index, element) {
					available_time_array.push($(this).val());
				});
				console.log(JSON.stringify(available_time_array));
				var available_time_json = JSON.stringify(available_time_array);
				$.ajax({
					type:"POST",
					url :"/user/settings.php",
					data:   {
						'field_name'  : "user_available_time",
						'field_value' : available_time_json,
						'user_email'  : $('#user_email').val(),
					},
					dataType: "json",
					timeout:120000, // 2min
					success: function (obj) {
						if(obj.errCode == 0 ){
							toast("更新成功");
						}else{
							toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
						}
					},
					error: function () {
						toast_err("提交失败");
					},
				});
			});
        });
        </script>
    </body>
</html>
