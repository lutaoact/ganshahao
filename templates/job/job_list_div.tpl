{foreach $jobArray as $job}
    <li>
        job_id : {$job.job_id}</br>
        company_id : {$job.company_id}</br>
        company_name : {$job.company_name}</br>
        job_name : {$job.job_name}
    </li>
{/foreach}
