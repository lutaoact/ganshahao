<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>[干啥好] 工作详情</title>
    <link rel="stylesheet" href="/static/css/common.css" type="text/css" />
</head>
<body id="employer-profile" lang="en">
	{include file="common/header.tpl"}
	<div class="container content">
		<div class="row">
			<div class="content-container clearfix" id="main-content">
				<div class="columns twelve">
					<div class="clearfix" id="user-info">
						<div class="row">
							<div class="columns nine">
								<h1 class="page-title">
									<div class="job-title">{$job.job_name}</div>
									<a href="/company/company_detail.php?company_id={$job.company_id}" target="_blank">
                                        <span class="employer">{$job.company_name}</span>
                                    </a>
								</h1>
							</div>
                        </div>
                        <div class="row">
							<div class="description">
                                <h5>{$job.job_description}</h5>
                            </div>
						</div>
                        <div class="row">
                            <div class="apply-btn">
								<input id="job_id" type="hidden" value="{$job.job_id}">
                                <input class="button radius large green" id="apply_btn" name="apply_btn" type="button" value="申请">
                            </div>
                        </div>
					</div>
					<div class="main-step clearfix" id="train_div" style="display:none;opacity:1;width:978px;">
						<div class="row clearfix">
								<div class="content" style="display:block">
									<div class="clearfix training-info">
										<div id="training_content"></div>
                                        <div id="training_complete_div" style="display:none">
                                            已经提交职位申请，请耐心等待<br>
                                            您可以查看更多<a href="job/job_list.php">职位</a>5秒后为你跳转
                                        </div>
										<div style="margin-top:20px;margin-left:74%;">
											<input class="button radius large green" id="next_training_btn" name="next_training_btn" type="button" value="下一题">
                                        </div>
									</div>
								</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/common.js"></script>
    <script src="/static/js/job.js"></script>
</body>
</html>
