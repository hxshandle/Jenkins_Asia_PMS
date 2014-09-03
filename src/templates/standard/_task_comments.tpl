<div class="task_comments">
    <ul>
    {foreach from=$commentList item=item name=foo}
        <li>
            <div class="comments-outer">
                <div class="comments-header">
                    <span class="comment-by">{$item.commnet_user_name}</span>
                    <span class="comment-ts">{$item.last_update}</span>
                </div>
                <div class="comments-content">{$item.comment}</div>
                <div class="comments-footer">{$item.last_update}</div>
            </div>
        </li>
    {/foreach}
    </ul>
</div>