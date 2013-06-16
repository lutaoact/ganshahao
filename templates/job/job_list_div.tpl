{foreach $company_list as $company}
    <!-- joblist item -->
    <div class="joblistblock"><div class="joblistcon">
    	<div class="joblistlogo"><!-- 公司图片 --><img src="/static/img/{$company.company_logo}" width="60" height="60"></div>
        <div class="joblistname"><!-- 公司名称 -->{$company.company_name}</div>
        <div class="joblist">
        {foreach $company.job_list as $job}
        	<a href="/job/job_detail.php?job_id={$job.job_id}"><li><div class="jobstatus1"><!-- 职位状态 -->Hiring Now</div><div class="jobname"><!-- 职位名称 -->{$job.job_name}</div></li></a>
        {/foreach}
        </div>
    </div></div>
    <!-- joblist item -->
{/foreach}
