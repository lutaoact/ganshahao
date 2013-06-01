<div>
    <input type="text" id="question_number" name="question_number" readonly="readonly"
        {if isset($question_number)}
            value="{$question_number}"
        {else}
            value="0"
        {/if}
    />
    <p>{$training_name}</p>
    <p>{$training_description}</p>
    <p>{$training_link}</p>
</div>
<div>
    <ul>
        {foreach $question_list as $question}
            <li>
                question_id : {$question.id}</br>
                question_content : {$question.content}</br>
                {foreach $question.choices as $choice}
                    <p><input type='radio' name='answer' value="{$choice}" />{$choice}</p>
                {/foreach}
                answer : $question.answer</br>
            </li>
        {/foreach}
    </ul>
</div>