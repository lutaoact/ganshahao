<!DOCTYPE html>
<html lang='zh'>
    <head>
    <meta charset="utf-8">
    <title>更新个人设置</title>
    <link rel="stylesheet" rev="stylesheet" href="/static/CSS/main.css" type="text/css" media="all" />
	<link rel="icon" type="/image/ico" href="favicon.ico">    
    </head>
    <body id="user-settings">
        {include file="common/headersec.tpl"}
		<div class="container">
			<div class="joblisttitle"> 更新个人设置 </div>
				<fieldset style="margin:0px; padding:0px; border:none;">
                	<div class="leftcol">
    					<div class="memberblock"><div class="membercon">
    						<div class="memberavatar"><!-- 头像 --><img src="/uploads/{$user.picture}" width="150" height="150"></div>
        					<div class="memberinfo">
        					<!-- 个人信息 -->
        						<span style="font-size:20px; line-height:32px">{$user.nick_name}</span><br><br>
            						你好{$user.nick_name}，在这个页面中更新您的个人信息。
        					</div>
        					<a href="/user/profile.php"><div class="updateinfo">返回个人中心</div></a>
    					</div></div><div style="height:10px;"></div>
					</div>
                    <div class="rightcol"><div class="settings">
                        <div>
                            <input type="hidden" id="user_id" name="user_id" value="{$user.id}" />
                        <div>
                        <li class="field profile-pic">
                            <label for="user_picture" class="settingstitle">头像</label>
                            <div class="row">
                                <div class="columns two">
                                    <div class="user-icon large">
                                    <img alt="Default-user-icon" src="/uploads/{$user.picture}" width="150" height="150">
                                    </div>
                                </div>
                                <div class="columns six">
                                    <div class="clearfix profile-pic-file-field">
                                    <form action="settings.php" enctype="multipart/form-data" method="post" class="clearfix">
                                        <input type="hidden" name="MAX_FILE_SIZE" value="1000000">
                                        
                                        <br><input type="text" id="pic-path" name="pic-path" class="clearfix" style="display:none;">
                                        <input type="file" id="user_picture" name="user_picture" class="clearfix">
                                        <br><input type="submit" class="buttonsmall" value="上传" style="float:none;"/>
                                        <input type="button" class="buttonsmall" value="选择头像">
                                        <br><label style="font-size:12px;">{$user_picture_error}</label><br>
                                    </form>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="field nick">
                            <label for="user_nick_name" class="settingstitle">昵称</label>
                            <br><input class="field_change" id="user_nick_name" name="user_nick_name" value="{$user.nick_name}" size="30" type="text">
                        </li>
                        <li class="field name">
                            <label for="user_real_name" class="settingstitle">真实姓名</label>
                            <br><input class="field_change" id="user_real_name" name="user_real_name" value="{$user.real_name}" size="30" type="text">
                        </li>
                        <li class="field mobile">
                            <label for="user_mobile" class="settingstitle">手机</label>
                            <br><input class="field_change" id="user_mobile" name="user_mobile" value="{$user.mobile}" size="30" type="text">
                        </li>
                        <li class="field email">
                            <label for="user_email" class="settingstitle">邮箱</label>
                            <br>{$user.email}
                            <input class="field_change" id="user_email" name="user_email" value="{$user.email}" size="30" type="hidden">
						</li>
                        <li class="field email">    
                            <a href="/user/change_password.php" style="font-size:16px; font-weight:bold;">修改密码</a>
                        </li>
                        <li class="field zipcode">
                            <label for="user_zipcode" class="settingstitle">邮政编码</label>
                            <br><input class="field_change" id="user_zipcode" name="user_zipcode" value="{$user.zipcode}" size="30" type="text">
                        </li>
                        <li class="field profile-resume">
                            <label for="user_resume" class="settingstitle">简历</label><br>
                            <div class="profile-resume-file-field" style="float:left;">
                                <form action="settings.php" enctype="multipart/form-data" method="post">
                                    <input type="hidden" name="MAX_FILE_SIZE" value="4000000">
                                    <br><input id="user_resume" style="border:0; padding-left:10px;" id="resume" name="user_resume" type="file" accept="application/msword"><br>最大4M，只支持pdf和doc格式<br/>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp </label>
                                    <label>{$user_resume_error}</label>
                                    <br><input type="submit" class="buttonsmall" value="上传" />
                                </form>
                                <a href="/uploads/{$user.resume nofilter}">下载简历</a>
                                <br><br>
                                <input id="user_is_veteran" name="user_is_veteran" type="checkbox" value="{$user.is_veteran}"
                                {if $user.is_veteran}
                                    checked
                                {/if} style="width:2em;float:none"/><span style="left:45px; -moz-box-shadow: 2px 2px 22px #eee inset; -webkit-box-shadow: 2px 2px 22px #eee inset; box-shadow:  2px 2px 22px #eee inset;"></span>
                                <label for="user_is_veteran" style="left:80px; font-size:18px;">我是有经验的老手</label>
                            </div>
                            <div style="clear:both;"></div>
                        </li>
                        <li class="field">
                            <label for="user_description" class="settingstitle">个人简介</label>
                            <div class="field-container">
                                <textarea class="field_change" cols="40" rows="5" id="user_description" name="user_description">{$user.description}</textarea>
                            </div>
                        </li>
                        <li class="field">
                            <label class="settingstitle">空闲时间</label>
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
                                        <td class="time" style="padding-right:50px; height:30px;"><em>凌晨(00:00-06:00)</em></td>
                                        {for $i = 0 to 6}
                                        <td>
                                        <input type="checkbox" class="available_time_check_box" id="{$i}" value="{$user.available_time[$i]}"
                                            {if $user.available_time[$i] == 1}
                                                checked
                                            {/if}
                                        /><span style="margin-left:-20px; -moz-box-shadow: 2px 2px 22px #eee inset; -webkit-box-shadow: 2px 2px 22px #eee inset; box-shadow:  2px 2px 22px #eee inset;"></span><label for="{$i}" style="width:24px; height:24px; left:auto; margin-left:-20px;">&nbsp&nbsp </label>
                                        </td>
                                        {/for}
                                    </tr>
                                    <tr>
                                        <td class="time" style="padding-right:50px; height:30px;"><em>下午(12:00-18:00)</em></td>
                                        {for $i = 7 to 13}
                                        <td>
                                        <input type="checkbox" class="available_time_check_box" id="{$i}" value="{$user.available_time[$i]}"
                                            {if $user.available_time[$i] == 1}
                                                checked
                                            {/if}
                                        /><span style="margin-left:-20px; -moz-box-shadow: 2px 2px 22px #eee inset; -webkit-box-shadow: 2px 2px 22px #eee inset; box-shadow:  2px 2px 22px #eee inset;"></span><label for="{$i}" style="width:24px; height:24px; left:auto; margin-left:-20px;">&nbsp&nbsp </label>
                                        </td>
                                        {/for}
                                    </tr>
                                    <tr>
                                        <td class="time" style="padding-right:50px; height:30px;"><em>晚上(18:00-24:00)</em></td>
                                        {for $i = 14 to 20}
                                        <td>
                                        <input type="checkbox" class="available_time_check_box" id="{$i}" value="{$user.available_time[$i]}"
                                            {if $user.available_time[$i] == 1}
                                                checked
                                            {/if}
                                        /><span style="margin-left:-20px; -moz-box-shadow: 2px 2px 22px #eee inset; -webkit-box-shadow: 2px 2px 22px #eee inset; box-shadow:  2px 2px 22px #eee inset;"></span><label for="{$i}" style="width:24px; height:24px; left:auto; margin-left:-20px;">&nbsp&nbsp </label>
                                        </td>
                                        {/for}
                                    </tr>
                                    <tr>
                                        <td class="time" style="padding-right:50px; height:30px;"><em>上午(06:00-12:00)</em></td>
                                        {for $i = 21 to 27}
                                        <td>
                                        <input type="checkbox" class="available_time_check_box" id="{$i}" value="{$user.available_time[$i]}"
                                            {if $user.available_time[$i] == 1}
                                                checked
                                            {/if}
                                        /><span style="margin-left:-20px; -moz-box-shadow: 2px 2px 22px #eee inset; -webkit-box-shadow: 2px 2px 22px #eee inset; box-shadow:  2px 2px 22px #eee inset;"></span><label for="{$i}" style="width:24px; height:24px; left:auto; margin-left:-20px;">&nbsp&nbsp </label>
                                        </td>
                                        {/for}
                                    </tr>
                                </tbody>
                            </table>
                            <div class="row">
                                    <br><div class="action">
                                        <input class="buttonsmall" id="update_available_time_button" type="button" value="更新空闲时间" />
                                    </div>
                            </div>
                        </div>
                </div></div>
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
