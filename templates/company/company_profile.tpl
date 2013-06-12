<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>[干啥好] 公司信息</title>
    <link rel="stylesheet" href="/static/css/common.css" type="text/css" />
</head>
<body id="company-profile" lang="en">
	{include file="common/header_company.tpl"}
    <div class="container content">
		<div class="row">
            <div class="columns twelve">
                <h3>{$company.name}</h3>
                {foreach $job_applications as $job_application}
                    <h5>
						<input type="hidden" class="job_application_id" value="{$job_application.id}" />
						<a href="/user/info.php?user_id={$job_application.user_id}">{$job_application.user_name}</a>申请了<a href="/job/job_detail.php?job_id={$job_application.job_id}">{$job_application.job_name}</a>
						<select class="status_selected">
							<option value="0" {if $job_application.status == 0}selected{/if}>请选择</option>
							<option value="1" {if $job_application.status == 1}selected{/if}>接受</option>
							<option value="2" {if $job_application.status == 2}selected{/if}>拒绝</option>
						</select>
					</h5>
                {/foreach}
            </div>
        </div>
    </div>
    {include file="common/footer.tpl"}
    <script>
        $(function() {
            console.log("in");
            $(".status_selected").change(function() {
                console.log($(this).val());
                console.log($(this).siblings(".job_application_id").val());
                $.ajax({
                    type:"POST",
                    url :"/company/change_status.php",
                    data:   {
                        'status_selected'  : $(this).val(),
                        'job_application_id' : $(this).siblings(".job_application_id").val(),
                    },
                    dataType: "json",
                    timeout:120000, // 2min
                    success: function (obj) {
                        if(obj.errCode == 0 ){
                            toast("更新成功");
                        }else{
                            toast_err("出错["+ obj.errCode +"]: " + obj.errMsg);
                        }
                    },
                    error: function () {
                        toast_err("提交失败");
                    },
                });
            });
        });
    </script>
</body>
</html>
