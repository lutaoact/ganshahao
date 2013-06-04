<!DOCTYPE html>
<html lang='zh'>
    <head>
    <meta charset="utf-8">
    <title>更新个人设置</title>
    </head>
    <body>
        <h1> 更新个人设置 </h1>
        <form action="settings.php" enctype="multipart/form-data" id="edit_user" method="post">
            <fieldset>
            <input type="hidden" id="user_id" name="user_id" value="{$user.id}" />
            <img src="/static/img/logo.png" /><br>
            <label for="user_picture">头像:</label>
            <input type="file" id="user_picture" name="user_picture" accept="image/*" /><br>
            <label for="user_nick_name">昵称:</label>
            <input type="text" class="field" id="user_nick_name" name="user_nick_name" value="{$user.nick_name}" /><br>
            <label for="user_real_name">真实姓名:</label>
            <input type="text" class="field" id="user_real_name" name="user_real_name" value="{$user.real_name}" /><br>
            <label for="user_mobile">手机:</label>
            <input type="text" class="field" id="user_mobile" name="user_mobile" value="{$user.mobile}" /><br>
            <label for="user_email">邮箱:{$user.email}</label>
            <input type="hidden" id="user_email" name="user_email" value="{$user.email}" /><a href="#">修改密码</a><br>
            <label for="user_zipcode">邮政编码:</label>
            <input type="text" class="field" id="user_zipcode" name="user_zipcode" value="{$user.zipcode}" maxlength='6' /><br>
            <label for="user_resume">简历:</label>
            <input type="file" id="user_resume" name="user_resume" value="" /><br>
            <input type="checkbox" id="user_is_veteran" name="user_is_veteran" value="{$user.is_veteran}"
            {if $user.is_veteran}
                checked
            {/if}/>我是有经验的老手<br>
            <label for="user_description">个人简介:</label><br>
            <textarea cols="40" rows="5" class="field" id="user_description" name="user_description">{$user.description}</textarea><br>
            <!-- <input type="submit" id="update_button" value="更新" /><br> -->
            <label>空闲时间</label>
            <table id='user_available_time'>
                <thead>
                    <tr>
                        <th>时间</th>
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
                        <td>凌晨(00:00-06:00)</td>
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
                        <td>下午(12:00-18:00)</td>
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
                        <td>晚上(18:00-24:00)</td>
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
                        <td>上午(06:00-12:00)</td>
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
                <tfoot>
                    <tr>
                        <td><input type="button" id="update_available_time_button" value="更新空闲时间" /></td>
                    </tr>
                </tfoot>
            </table>
            </fieldset>
        </form>
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/common.js"></script>
    <script>
    $(function() {
        $(".field").change(function() {
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
            alert(JSON.stringify(available_time_array));
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
