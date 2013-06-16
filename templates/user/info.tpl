<!DOCTYPE html>
<html lang='zh'>
    <head>
    <meta charset="utf-8">
    <title>个人信息</title>
    <link rel="stylesheet" rev="stylesheet" href="/static/CSS/main.css" type="text/css" media="all" />
	<link rel="icon" type="/image/ico" href="favicon.ico">    
    </head>
    <body id="user-profile">
        {include file="common/header_company.tpl"}
        <div class="container" style="padding-top:40px;">
                    {if isset($user.id)}
                    <fieldset style="margin:0px; padding:0px; border:none;">
                        <div class="leftcol">
    					<div class="memberblock"><div class="membercon">
    						<div class="memberavatar"><!-- 头像 --><img src="/uploads/{$user.picture}" width="150" height="150"></div>
        					<div class="memberinfo">
        					<!-- 个人信息 -->
        						<span style="font-size:20px; line-height:32px">{$user.nick_name}</span><br><br>
            						在这个页面查看{$user.nick_name}的个人信息。
        					</div>
        					<a href="/job/job_list.php"><div class="updateinfo">返回工作列表</div></a>
    					</div></div><div style="height:10px;"></div>
					</div>
                    <div class="rightcol"><div class="settings">
                        <li class="field">
                            <label class="settingstitle">头像</label>
                            <div class="row">
                                <img alt="Default-user-icon" src="/uploads/{$user.picture}">
                            </div>
                        </li>
                        <li class="field">
                            <label class="settingstitle">昵称</label>
                            <p>{$user.nick_name}</p>
                        </li>
                        <li class="field">
                            <label class="settingstitle">真实姓名</label>
                            <p>{$user.real_name}</p>
                        </li>
                        <li class="field">
                            <label class="settingstitle">手机</label>
                            <p>{$user.mobile}</p>
                        </li>
                        <li class="field">
                            <label class="settingstitle">邮箱</label>
                            <p>{$user.email}</p>
                        </li>
                        <li class="field">
                            <label class="settingstitle">邮政编码</label>
                            <p>{$user.zipcode}</p>
                        </li>
                        <li class="field">
                            <label class="settingstitle">简历</label>
                            <p><a href="uploads/{$user.resume nofilter}">下载简历</a></p>
                        </li>
                        <li class="field">
                            <label class="settingstitle">个人简介</label>
                            <p>{$user.description}</p>
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
                        </li>
                    </fieldset>
                {else}
                    <p>没有相关用户信息</p>
                {/if}
        </div></div>
        
        {include file="common/footer.tpl"}
    </body>
</html>
