<!DOCTYPE html>
<html lang='zh'>
    <head>
    <meta charset="utf-8">
    <title>个人信息</title>
    <link rel="stylesheet" href="/static/css/common.css" type="text/css" />
    </head>
    <body id="user-profile">
        {include file="common/header_company.tpl"}
        <div class="container content">
            <div class="row">
                <div class="columns nine">
                    {if isset($user.id)}
                    <fieldset class="content-container clearfix">
                        <div class="field">
                            <label>头像</label>
                            <div class="row">
                                <img alt="Default-user-icon" src="/uploads/{$user.picture}">
                            </div>
                        </div>
                        <div class="field">
                            <label>昵称</label>
                            <p>{$user.nick_name}</p>
                        </div>
                        <div class="field">
                            <label>真实姓名</label>
                            <p>{$user.real_name}</p>
                        </div>
                        <div class="field">
                            <label>手机</label>
                            <p>{$user.mobile}</p>
                        </div>
                        <div class="field">
                            <label>邮箱</label>
                            <p>{$user.email}</p>
                        </div>
                        <div class="field">
                            <label>邮政编码</label>
                            <p>{$user.zipcode}</p>
                        </div>
                        <div class="field">
                            <label>简历</label>
                            <p><a href="uploads/{$user.resume nofilter}">下载简历</a></p>
                        </div>
                        <div class="field">
                            <label>个人简介</label>
                            <p>{$user.description}</p>
                        </div>
                        <div class="field">
                            <label>空闲时间</label>
                            <table>
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
                                    <input type="checkbox" disabled
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
                                    <input type="checkbox" disabled
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
                                    <input type="checkbox" disabled
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
                                    <input type="checkbox" disabled
                                        {if $user.available_time[$i] == 1}
                                            checked
                                        {/if}
                                    />
                                    </td>
                                    {/for}
                                </tr>
                            </tbody>
                        </table>
                        </div>
                    </fieldset>
                {else}
                    <p>没有相关用户信息</p>
                {/if}
                </div>
            </div>
        </div>
        
        {include file="common/footer.tpl"}
    </body>
</html>
