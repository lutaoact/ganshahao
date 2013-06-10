<div>
    <h5>为你推荐以下热门职位</h5>
    <ul class="block-grid five-up">
        {foreach $job_list as $job}
            <li>
                <a href="/job/job_detail.php?job_id={$job.id}" target="_blank">{$job.name}</a>
            </li>
        {/foreach}
    </ul>
</div>

<div>
    <h5>TOP 5 用户，去看看他们的主页</h5>
    <ul class="block-grid five-up">
        {foreach $user_list as $user}
            <li>
                <a href="/user/profile.php?user_id={$user.id}" target="_blank">{$user.name}</a>
            </li>
        {/foreach}
    </ul>
</div>
