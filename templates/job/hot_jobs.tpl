<div>
    <div class="hotjobscon">
    <div class="hotjobstitle">&nbsp&nbsp&nbsp&nbsp 为你推荐以下热门职位</div>
        {foreach $job_list as $job}
        <div class="hotjobsobj">
            <a href="/job/job_detail.php?job_id={$job.id}" target="_blank">
                <div class="hotjobsobjtitle">{$job.name}</div>
            </a>
        </div>
        {/foreach}
    </div>
</div>

<div>
    <div class="hotjobscon">
    <div class="hotjobstitle">&nbsp&nbsp&nbsp&nbsp TOP 5 用户，去看看他们的主页</div>
        {foreach $user_list as $user}
        <div class="hotjobsobj">
            <a href="/user/profile.php?user_id={$user.id}" target="_blank">
                <div class="hotjobsobjtitle">{$user.name}</div>
            </a>
        </div>
        {/foreach} 
    </div>
</div>
