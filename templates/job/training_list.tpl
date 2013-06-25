<div style="height:10px;"></div>
<div class="trainingprogblock">
    		<div class="trainingprogcon0" style="background:#aaa; color:#fff;">
    			本职位的培训列表
    		</div>
</div>
{foreach $training_list as $training}
        <div class="trainingprogblock">
    		<div class="trainingprogcon0">
    			{$training.name}
    		</div>
    	</div>
{/foreach}