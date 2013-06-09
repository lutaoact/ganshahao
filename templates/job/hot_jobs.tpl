<div>
    <ul class="block-grid five-up">
        {foreach $job_list as $job}
            <li>
                <a href="/job/job_detail.php?job_id={$job.id}">{$job.name}</li>
            </li>
        {/foreach}
    </ul>
</div>

<div>
</div>