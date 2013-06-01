<!DOCTYPE html>
<html lang='zh'>
<head>
    <meta charset="UTF-8">
    <title>test templates</title>
    <link href="//d3h58ti7lx89tg.cloudfront.net/assets/application-9759d17d035d1a59f2f116191c6c7da3.css" media="screen" rel="stylesheet" type="text/css">
</head>
<body>
    <ul class="block-grid three-up mobile employer-list">
        {foreach $company_list as $company}
            <li style="opacity:1;">
                <div class="employer clearfix" style="height: 188.25px;">
                <div class="employer-info clearfix">
                    <div class="user-ic on round">
                        <a href="/users/bananarepublic" title="See What Banana Republic Wants You To Learn."><img alt="Banana Republic" src="http://s3.amazonaws.com/production-user-avatar/user/avatars/5151f5b211486c0002000003/small/Banana-Republic-Logo.jpg"></a>
                    </div>
                    <div class="user-name">
                        <a href="/users/bananarepublic" title="See What Banana Republic Wants You To Learn.">{$company.company_name}</a>
                    </div>
                </div>
                <nav class="job-titles">
                    <ul>
                        {foreach $company.job_list as $job}
                            <li>
                                <div class="row">
                                    <div class="columns three">
                                    
                                        <a href="/bananarepublic/jobs/sales-associate" class="hiring label right">
                                            {if $job.job_status == 2}
                                                正在招聘            
                                            {elseif $job.job_status == 1}
                                                即将招聘
                                            {else}
                                                状态不明
                                            {/if}
                                        </a>
                                    </div>
                                    <div class="columns eight">
                                        <a href="/bananarepublic/jobs/sales-associate" class="job-title-link">{$job.job_name}</a>
                                    </div>
                                 </div>
                            </li>
                        {/foreach}
                    </ul>
                </nav>   
                </div>
            </li>
        {/foreach}
    </ul>
    
</body>