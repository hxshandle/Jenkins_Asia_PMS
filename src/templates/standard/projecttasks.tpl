{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" }
{include file="tabsmenue-project.tpl" taskstab = "active"}

<!-- projecttaks.tpl -->
<div id="content-left">
<div id="content-left-in">
<div class="tasks">

{*System Message*}
<div class="infowin_left" style="display:none;" id="systemmsg">
    {if $mode == "added"}
        <span class="info_in_green"><img src="templates/standard/images/symbols/task.png"
                                         alt=""/>{#taskwasadded#}</span>
    {elseif $mode == "edited"}
        <span class="info_in_yellow"><img src="templates/standard/images/symbols/task.png"
                                          alt=""/>{#taskwasedited#}</span>
    {elseif $mode == "deleted"}
        <span class="info_in_red"><img src="templates/standard/images/symbols/task.png"
                                       alt=""/>{#taskwasdeleted#}</span>
    {elseif $mode == "opened"}
        <span class="info_in_green"><img src="templates/standard/images/symbols/task.png"
                                         alt=""/>{#taskwasopened#}</span>
    {elseif $mode == "closed"}
        <span class="info_in_red"><img src="templates/standard/images/symbols/task.png" alt=""/>{#taskwasclosed#}</span>
    {elseif $mode == "assigned"}
        <span class="info_in_yellow"><img src="templates/standard/images/symbols/task.png"
                                          alt=""/>{#taskwasassigned#}</span>
    {elseif $mode == "deassigned"}
        <span class="info_in_yellow"><img src="templates/standard/images/symbols/task.png" alt=""/>{#taskwasdeassigned#}</span>
    {elseif $mode == "listadded"}
        <span class="info_in_green"><img src="templates/standard/images/symbols/tasklist.png"
                                         alt=""/>{#tasklistwasadded#}</span>
    {elseif $mode == "listclosed"}
        <span class="info_in_red"><img src="templates/standard/images/symbols/tasklist-done.png"
                                       alt=""/>{#tasklistwasclosed#}</span>
    {elseif $mode == "listdeleted"}
        <span class="info_in_red"><img src="templates/standard/images/symbols/tasklist.png"
                                       alt=""/>{#tasklistwasdeleted#}</span>
    {elseif $mode == "listopened"}
        <span class="info_in_green"><img src="templates/standard/images/symbols/tasklist.png"
                                         alt=""/>{#tasklistwasopened#}</span>
    {/if}

    {*for async display*}
    <span id="added" style="display:none;" class="info_in_green"><img src="templates/standard/images/symbols/task.png"
                                                                      alt=""/>{#taskwasadded#}</span>
    <span id="edited" style="display:none;" class="info_in_yellow"><img src="templates/standard/images/symbols/task.png"
                                                                        alt=""/>{#taskwasedited#}</span>
    <span id="deleted" style="display:none;" class="info_in_red"><img src="templates/standard/images/symbols/task.png"
                                                                      alt=""/>{#taskwasdeleted#}</span>
    <span id="opened" style="display:none;" class="info_in_green"><img src="templates/standard/images/symbols/task.png"
                                                                       alt=""/>{#taskwasopened#}</span>
    <span id="closed" style="display:none;" class="info_in_green"><img src="templates/standard/images/symbols/task.png"
                                                                       alt=""/>{#taskwasclosed#}</span>
    <span id="assigned" style="display:none;" class="info_in_yellow"><img
                src="templates/standard/images/symbols/task.png" alt=""/>{#taskwasassigned#}</span>
    <span id="deassigned" style="display:none;" class="info_in_yellow"><img
                src="templates/standard/images/symbols/task.png" alt=""/>{#taskwasdeassigned#}</span>
    <span id="listadded" style="display:none;" class="info_in_green"><img
                src="templates/standard/images/symbols/tasklist.png" alt=""/>{#tasklistwasadded#}</span>
    <span id="listclosed" style="display:none;" class="info_in_red"><img
                src="templates/standard/images/symbols/tasklist-done.png" alt=""/>{#tasklistwasclosed#}</span>
    <span id="listdeleted" style="display:none;" class="info_in_red"><img
                src="templates/standard/images/symbols/tasklist.png" alt=""/>{#tasklistwasdeleted#}</span>
    <span id="listopened" style="display:none;" class="info_in_green"><img
                src="templates/standard/images/symbols/tasklist.png" alt=""/>{#tasklistwasopened#}</span>
</div>
<p id="mailErr" style="display:none">{if $mailErr=="true"}{#taskMailError#}{/if}</p>

{literal}
    <script type="text/javascript">
        systemMsg('systemmsg');
    </script>
{/literal}{*/System Message*}

<h1>{$projectname|truncate:45:"...":true}<span>/ {#tasklists#}</span></h1>


{if $userpermissions.tasks.add && $smarty.session.userRole < 8} {*Add Tasklist*}
    <div id="addlist" class="addmenue" style="display:none;">
       
    </div>
{/if} {*Add Tasklist END*}
    
    {*START phase groupe*}

    <div class="headline">
        <a href="javascript:void(0);" id="block-{$groupedTasks.ID}_toggle" class="win_block"
           onclick="toggleBlock('block-{$groupedTasks.ID}');"></a>
        <div class="wintools">
            {if $userpermissions.tasks.add && $smarty.session.userRole < 8}
                <a class="add" href="javascript:blindtoggle('form_{$groupedTasks.ID}');" id="add_{$groupedTasks.ID}"
                   onclick="toggleClass(this,'add-active','add');toggleClass('add_butn_{$groupedTasks.ID}','butn_link_active','butn_link');toggleClass('sm_{$groupedTasks.ID}','smooth','nosmooth');"><span>{#addtask#}</span></a>
            {/if}
        </div>
        <h2>
            <a href="managetasklist.php?action=showtasklist&amp;id={$project.ID}&amp;tlid={$groupedTasks.ID}"
               title="{#tasklist#} {$groupedTasks.tasksListName}"><img src="./templates/standard/images/symbols/tasklist.png" alt=""/>{$groupedTasks.tasksListName|truncate:70:"...":true}</a>
        </h2>
    </div>
    <div id="block-{$groupedTasks.ID}" class="block">
        {*Add Task*}
        {if $userpermissions.tasks.add && $smarty.session.userRole < 8}
            <div id="form_{$groupedTasks.ID}" class="addmenue" style="display:none;">
                {include file="addtask.tpl" deliverStartDate = $groupedTasksstart_date deliverEndDate=$groupedTasks.end_date tasklist = $groupedTasks}
            </div>
        {/if}
        <ul>
        {foreach from=$groupedTasks.tasks key=phaseName item=deliverableItems name=phase}
           <li>
           <div class="tasklist-phase-name">{$phaseName}</div>
           {*START Deliverable items*}
           {foreach from=$deliverableItems key=deliverableName item=tasks name=deliverableTasks}
                <div class="tasklist-deliverable-name">{$deliverableName}</div>
                {include file="_projectTaskListTable.tpl" taskListId=$groupedTasks.ID tasks=$tasks pseq=$smarty.foreach.phase.index dseq=$smarty.foreach.deliverableTasks.index}

           {/foreach}
           </li>
        {/foreach}
        </ul>
        <div id="doneblock_{$groupedTasks.ID}" class="doneblock" style="display: none;opacity: 0.6;">
            <div class="toggleblock">
                <ul>
                {foreach from=$groupedTasks.oldTasks key=phaseName item=deliverableItems name=phaseOld}
                   <li>
                   <div class="tasklist-phase-name">{$phaseName}</div>
                   {*START Deliverable items*}
                   {foreach from=$deliverableItems key=deliverableName item=tasks name=deliverableTasksOld}
                        <div class="tasklist-deliverable-name">{$deliverableName}</div>
                        {include file="_projectTaskListTable.tpl" taskListId=$groupedTasks.ID tasks=$tasks pseq=$smarty.foreach.phaseOld.index dseq=$smarty.foreach.deliverableTasksOld.index isDone=true}

                   {/foreach}
                   </li>
                {/foreach}
                </ul>
            </div>
        </div>
        <div class="tablemenue">
            <div class="tablemenue-in">
                {if $userpermissions.tasks.add && $smarty.session.userRole < 8}
                    <a class="butn_link" href="javascript:blindtoggle('form_{$groupedTasks.ID}');"
                       id="add_butn_{$groupedTasks.ID}"
                       onclick="toggleClass('add_{$groupedTasks.ID}','add-active','add');toggleClass(this,'butn_link_active','butn_link');toggleClass('sm_{$lists[list].ID}','smooth','nosmooth');">{#addtask#}</a>
                {/if}
                <a class="butn_link" href="javascript:blindtoggle('doneblock_{$groupedTasks.ID}');"
                   id="donebutn_{$groupedTasks.ID}"
                   onclick="toggleClass(this,'butn_link_active','butn_link');toggleClass('toggle-done-{$groupedTasks.ID}','acc-toggle','acc-toggle-active');">{#donetasks#}</a>
            </div>
        </div>
    </div>
    <!--END task list block-->
    <div class="content-spacer"></div>
    {literal}
        <script type="text/javascript">
            var accord_{/literal}{$groupedTasks.ID}{literal} = new accordion('block-{/literal}{$groupedTasks.ID}{literal}');
        </script>
    {/literal}


</div> {*Tasks END*}
</div> {*content-left-in END*}
</div> {*content-left END*}

{include file="sidebar-a.tpl"}
{include file="footer.tpl"}