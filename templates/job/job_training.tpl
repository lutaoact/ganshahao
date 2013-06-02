<div>
    <input type="text" id="training_number" name="training_number" readonly="readonly"
        {if isset($training_number)}
            value="{$training_number}"
        {else}
            value="0"
        {/if}
    />
    <p>training_name:{$training_name}</p>
    <p>training_type:{$training_type}</p>
    <p>training_description:{$training_description}</p>
    <p>training_link:{$training_link}</p>
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