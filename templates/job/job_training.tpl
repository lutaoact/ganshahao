<div>
    <input type="text" id="training_number" name="training_number" readonly="readonly"
        {if isset($training_number)}
            value="{$training_number}"
        {else}
            value="0"
        {/if}
    />
    <p>training_name:{$training_name}</p>
    {if $training_type eq 2}
        <img src="/static/img/{$training_link}" />
    {elseif $training_type eq 3}
        <div>{$training_link nofilter}</div>
    {/if}
    <p>training_description:{$training_description}</p>
</div>
<div>
    <ul>
        {foreach $question_list as $question}
            <li>
                question_id : {$question.id}</br>
                question_content : {$question.content}</br>
                {foreach $question.choices as $choice}
                    <p><input type='radio' name='{$question.content}' value="{$choice}" />{$choice}</p>
                {/foreach}
                answer : {$question.answer}</br>
            </li>
        {/foreach}
    </ul>
</div>