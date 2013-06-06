{if $training eq null}
    <div>no training</div>
    <script>
        $('#next_training_btn').hide();
    </script>
{else}
    <div>
        <input type="hidden" id="training_id" name="training_id" value="{$training.id}" />
        <input type="text" id="training_number" name="training_number" readonly="readonly"
            {if isset($training_number)}
                value="{$training_number}"
            {else}
                value="0"
            {/if}
        />
        <p>training_name:{$training.name}</p>
        {if $training.type eq 2}
            <img src="/static/img/{$training.link}" />
        {elseif $training.type eq 3}
            <div>{$training.link nofilter}</div>
        {/if}
        <p>training_description:{$training.description}</p>
    </div>
    <div>
        <ul>
            {foreach $question_list as $question}
                <li>
                    question_content : {$question.content}</br>
                    {foreach $question.choices as $choice}
                        <p>
                            <input type='radio' name='{$question.id}' value="{$choice@iteration}" />
                            <span id='{$question.id}{$choice@iteration}'>{$choice}</span>
                        </p>
                    {/foreach}
                    answer : {$question.answer}</br>
                </li>
            {/foreach}
        </ul>
    </div>
{/if}