<!DOCTYPE html>
<html lang='zh'>
    <head>
    <meta charset="utf-8">
    <title>更新个人设置</title>
    </head>
    <body>
        <h1> 更新个人设置 </h1>
        <input type="hidden" id="user_id" name="user_id" value="{$user.id}" />
        <label for="user_nick_name">昵称:</label>
        <input type="text" id="user_nick_name" name="user_nick_name" value="{$user.nick_name}" /><br>
        <label for="user_real_name">真实姓名:</label>
        <input type="text" id="user_real_name" name="user_real_name" value="{$user.real_name}" /><br>
        <label for="user_mobile">真实姓名:</label>
        <input type="text" id="user_mobile" name="user_mobile" value="{$user.mobile}" /><br>
        <label for="user_email">邮箱:</label>
        <input type="text" id="user_email" name="user_email" value="{$user.email}" /><a href="#">修改密码</a><br>
        <label for="user_zipcode">邮政编码:</label>
        <input type="text" id="user_zipcode" name="user_zipcode" value="{$user.zipcode}" maxlength='6' /><br>
        <label for="user_description">个人简介:</label><br>
        <textarea cols="40" id="user_description" name="user_description" rows="5">{$user.description}</textarea><br>
    </body>
</html>
