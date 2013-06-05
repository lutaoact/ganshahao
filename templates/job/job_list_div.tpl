{foreach $company_list as $company}
    <li>
        <div class="row">
            company_id : {$company.company_id}</br>
            company_name : {$company.company_name}</br>
        </div>
        <div class="row">
            <ul>
                {foreach $company.job_list as $job}
                    <li>
                        <div>
                            <a alt="$job.job_name" href="/job/job_detail.php?job_id={$job.job_id}">
                                {$job.job_name}
                            </a>
                        </div>
                    </li>
                {/foreach}
            </ul>
        </div>
    </li>
{/foreach}
