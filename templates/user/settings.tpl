<!DOCTYPE html>
<html lang='zh'>
    <head>
    <meta charset="utf-8">
    <title>更新个人设置</title>
    </head>
    <body>
        <h1> 更新个人设置 </h1>
        <form accept-charset="UTF-8" action="settings.php" enctype="multipart/form-data" id="edit_user" method="post">
            <fieldset>
            <input type="hidden" id="user_id" name="user_id" value="{$user.id}" />
            <img src="/static/img/logo.png" /><br>
            <label for="user_picture">头像:</label>
            <input type="file" id="user_picture" name="user_picture" accept="image/*" /><br>
            <label for="user_nick_name">昵称:</label>
            <input type="text" id="user_nick_name" name="user_nick_name" value="{$user.nick_name}" /><br>
            <label for="user_real_name">真实姓名:</label>
            <input type="text" id="user_real_name" name="user_real_name" value="{$user.real_name}" /><br>
            <label for="user_mobile">手机:</label>
            <input type="text" id="user_mobile" name="user_mobile" value="{$user.mobile}" /><br>
            <label for="user_email">邮箱:{$user.email}</label>
            <input type="hidden" id="user_email" name="user_email" value="{$user.email}" /><a href="#">修改密码</a><br>
            <label for="user_zipcode">邮政编码:</label>
            <input type="text" id="user_zipcode" name="user_zipcode" value="{$user.zipcode}" maxlength='6' /><br>
            <label for="user_resume">简历:</label>
            <input type="file" id="user_resume" name="user_resume" value="" /><br>
            <input type="checkbox" name="user_is_veteran"
                {if $user.is_veteran == 1}
                    checked value="1"
                {else}
                    value="0"
                {/if}
            />我是有经验的老手<br>
            <label for="user_description">个人简介:</label><br>
            <textarea cols="40" rows="5" id="user_description" name="user_description">{$user.description}</textarea><br>
            <input type="submit" id="update_button" value="更新" /><br>
            <label>空闲时间</label>
            <table id='availability'>
                <thead>
                    <tr>
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
                        <td>
                        <input type="checkbox" id="user_morning_sun" name="user[morning][sun]" />
                        </td>
                        <td>
                        <input type="checkbox" id="user_morning_mon" name="user[morning][mon]" />
                        </td>
                        <td>
                        <input type="checkbox" id="user_morning_tue" name="user[morning][tue]" />
                        </td>
                        <td>
                        <input type="checkbox" id="user_morning_wed" name="user[morning][wed]" />
                        </td>
                        <td>
                        <input type="checkbox" id="user_morning_thu" name="user[morning][thu]" />
                        </td>
                        <td>
                        <input type="checkbox" id="user_morning_fri" name="user[morning][fri]" />
                        </td>
                        <td>
                        <input type="checkbox" id="user_morning_sat" name="user[morning][sat]" />
                        </td>
                    </tr>
                </tbody>
            </table>
            </fieldset>
        </form>
    </body>
</html>
