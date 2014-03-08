<table id="acc_{$taskListId}_{$pseq}_{$dseq}_{$isDone}" cellpadding="0" cellspacing="0" border="0">
  <thead>
    <tr>
      <th class="a"></th>
      <th class="b">{#tasks#}</th>
      <th class="c">{#user#}</th>
      <th class="days" style="text-align:right">{#daysleft#}&nbsp;&nbsp;</th>
      <th class="tools"></th>
    </tr>
  </thead>
  <tbody>
    {foreach from=$tasks item=task name=foo}
      {if $smarty.foreach.foo.index % 2 == 0}
        <tr class="color-b" id="task_{$task.ID}">
      {else}
        <tr class="color-a" id="task_{$task.ID}">
      {/if}
        <td>
          {if $userpermissions.tasks.close}
              <a class={if $isDone}"butn_checked"{else}"butn_check"{/if}
                 style="height:20px;"
                 href="javascript:closeElement('task_{$task.ID}','managetask.php?action=close&amp;tid={$task.ID}&amp;id={$project.ID}');"
                 title="{#close#}"></a>
          {/if}
        </td>
        <td>
          <div class="toggle-in" style="display:inline-block;height:auto;">
            <span class="acc-toggle" style="height:20px;"
                  onclick="javascript:accord_{$taskListId}.activate($$('#acc_{$taskListId}_{$pseq}_{$dseq}_{$isDone} .accordion_toggle')[{$smarty.foreach.foo.index}]);toggleAccordeon('acc_{$taskListId}',this);"></span>
            <a href="managetask.php?action=showtask&tid={$task.ID}&amp;id={$task.project}"
               title="{$task.title}">
              {if $task.title != ""}
                  {$task.title|truncate:30:"...":true}
              {else}
                  {$task.text|truncate:30:"...":true}
              {/if}
            </a>
          </div>
        </td>
        <td>
          {section name=theusers loop=$task.users}
              <a href="manageuser.php?action=profile&amp;id={$task.users[theusers].ID}">{$task.users[theusers].name|truncate:30:"...":true}</a>
          {/section}
        </td>
        <td style="text-align:right">{$task.daysleft}</td>
        <td class="tools">
            {if $userpermissions.tasks.edit}
            <a class="tool_edit"
               href="managetask.php?action=editform&amp;tid={$task.ID}&amp;id={$project.ID}"
               title="{#edit#}"></a>{/if}
            {if $userpermissions.tasks.del}
                <a class="tool_del"
                   href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'task_{$task.ID}\',\'managetask.php?action=del&amp;tid={$task.ID}&amp;id={$project.ID}\')');"
                   title="{#delete#}"></a>
            {/if}
        </td>
      </tr>
      <tr class="acc">
        <td colspan="5">
            <div class="accordion_toggle"></div>
            <div class="accordion_content">
                <div class="acc-in">
                    <div class="message-in">
                        {$task.text|nl2br}
                    </div>
                </div>
            </div>
        </td>
      </tr>
    {/foreach}
  </tbody>
</table>