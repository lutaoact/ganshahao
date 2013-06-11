<!DOCTYPE html>
<html lang='zh'>
    <head>
    <meta charset="utf-8">
    <title>个人信息</title>
    </head>
    <body>
        {if isset($user.id)}
            头像：<img alt="Default-user-icon" src="/uploads/{$user.picture}"><br>
            <p>昵称：{$user.nick_name}</p>
            <p>真实姓名：{$user.real_name}</p>
            <p>手机：{$user.mobile}</p>
            <p>邮箱：{$user.email}</p>
            <p>邮政编码：{$user.zipcode}</p>
            <p>简历：<a href="/uploads/{$user.resume nofilter}">下载简历</a></p>
            {if $user.is_veteran}<input type="checkbox" disabled checked />我是有经验的老手{/if}
            <p>个人简介：{$user.description}</p>
            <label>空闲时间：</label>
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
        {else}
            <p>没有相关用户信息</p>
        {/if}
        {include file="common/footer.tpl"}
    </body>
</html>
