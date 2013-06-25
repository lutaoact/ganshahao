{if $training eq null}
    <script>
        adjust_result_page();
        $('#next_training_btn').hide();
    </script>
{else}
    <div class="jobtraining" id="trainingcontent" style="max-height:500px; overflow:auto; width:100%; padding:0 0 0 0;">
    <div id="training-description">
        <input type="hidden" id="training_id" name="training_id" value="{$training.id}" />
        <input type="hidden" id="training_name" name="training_name" value="{$training.name}" />
        <input type="hidden" id="training_number" name="training_number"
            {if isset($training_number)}
                value="{$training_number}"
            {else}
                value="0"
            {/if}
        />
        <div class="title24">{$training.name}</div>
        {if $training.type eq 2}
            <div style="text-align:center"><img src="/static/img/{$training.link}" /></div>
        {elseif $training.type eq 3}
            <div style="text-align:center">{$training.link nofilter}</div>
        {/if}
        <div class="trainingdescription">{$training.description}</div>
        <div class="bottom1"></div>
    </div>
    </div>
    <div id="training-question">
    	{foreach $question_list as $question}
        <div class="trainingcon">
            <div class="objnum">{$question.id}</div>
            <div class="objtext">{$question.content}</div>
        	<div class="trainingobj">
            	
                {foreach $question.choices as $choice}
            	<li>
                	<span class="input"></span><input type="checkbox" name="{$question.id}" id="{$question.id}{$choice@iteration}" value="{$choice@iteration}"/><span class="input"></span><label for="{$question.id}{$choice@iteration}" id="{$question.id}{$choice@iteration}">{$choice}</label>
                </li>
                {/foreach}
            </div>
        </div>
        {/foreach}
       <div class="bottom2"></div>
    </div>
    
{/if}
</div>
    <script src="/static/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script>
    (function($){
			$(window).load(function(){
				$("#trainingcontent").mCustomScrollbar({
					scrollButtons:{
						enable:true
					}
				});
			});
		})(jQuery);
	</script>
