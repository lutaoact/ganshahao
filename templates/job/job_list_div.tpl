{foreach $company_list as $company}
    <li style="opacity:1;">
        <div class="employer clearfix" style="height:188.25px;">
            <div class="employer-info clearfix">
                <div class="user-name">
                    <a href="/company/company_detail.php?company_id={$company.company_id}" title="{$company.company_name}">
                        {$company.company_name}
                    </a>
                </div>
            </div>
            <div class="job-titles">
                <ul>
                {foreach $company.job_list as $job}
                <li>
                    <div class="columns eight">
                        <a href="/job/job_detail.php?job_id={$job.job_id}" class="job-title-link">
                            {$job.job_name}
                        </a>
                    </div>
                </li>
                {/foreach}
                </ul>
            </div>
        </div>
    </li>
{/foreach}