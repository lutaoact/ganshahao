{if $training eq null}
    <div id="training-description">
        No Trainings
        <script>
            $('#next_training_btn').hide();
        </script>
    </div>
{else}
    <div id="training-description">
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
            <img src="/static/img/{$training.link}" />
        {elseif $training.type eq 3}
            <div>{$training.link nofilter}</div>
        {/if}
        <h2>{$training.description}</h2>
    </div>
    <div id="training-question" style="margin-top:20px;">
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
    </div>
{/if}
</div>
