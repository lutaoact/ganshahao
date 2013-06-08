{if $training eq null}
        没有相关培训了
        <div style="margin-top:20px;">
            <input class="button radius large green" style="padding:5px 20px;" type="button" id="job_apply_btn" name="job_apply_btn" value="提交职位申请">
        </div>
        <script>
            $('#next_training_btn').hide();
        </script>
{else}
    <div id="training-description" style="width:70%;float:left;">
        <input type="hidden" id="training_id" name="training_id" value="{$training.id}" />
        <input type="hidden" id="training_number" name="training_number"
            {if isset($training_number)}
                value="{$training_number}"
            {else}
                value="0"
            {/if}
        />
        <h1>{$training.name}</h1>
        {if $training.type eq 2}
            <div style="text-align:center"><img src="/static/img/{$training.link}" /></div>
        {elseif $training.type eq 3}
            <div style="text-align:center">{$training.link nofilter}</div>
        {/if}
        <h2>{$training.description}</h2>
        <div class="bottom1"></div>
    </div>
    <div id="training-question" style="width:24%;float:right;">
        <ul>
            {foreach $question_list as $question}
                <li>
                    {$question.content}
                    {foreach $question.choices as $choice}
                        <p>
                            <input type='radio' name='{$question.id}' value="{$choice@iteration}" />
                            <span id='{$question.id}{$choice@iteration}'>{$choice}</span>
                        </p>
                    {/foreach}
                </li>
            {/foreach}
        </ul>
        <div class="bottom2"></div>
    </div>
    
{/if}
</div>
