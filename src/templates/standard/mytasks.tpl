{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce"}
{include file="tabsmenue-desk.tpl" taskstab = "active"}

<div id="content-left">
<div id="content-left-in">
<div class="tasks">

<div class="infowin_left" style="display:none;" id="systemmsg">
  {if $mode == "added"}
    <span class="info_in_green"><img src="templates/standard/images/symbols/task.png" alt=""/>{#taskwasadded#}</span>
  {elseif $mode == "edited"}
    <span class="info_in_yellow"><img src="templates/standard/images/symbols/task.png" alt=""/>{#taskwasedited#}</span>
  {elseif $mode == "deleted"}
    <span class="info_in_red"><img src="templates/standard/images/symbols/task.png" alt=""/>{#taskwasdeleted#}</span>
  {elseif $mode == "opened"}
    <span class="info_in_green"><img src="templates/standard/images/symbols/task.png" alt=""/>{#taskwasopened#}</span>
  {elseif $mode == "closed"}
    <span class="info_in_red"><img src="templates/standard/images/symbols/task.png" alt=""/>{#taskwasclosed#}</span>
  {elseif $mode == "assigned"}
    <span class="info_in_yellow"><img src="templates/standard/images/symbols/task.png"
                                      alt=""/>{#taskwasassigned#}</span>
  {elseif $mode == "deassigned"}
    <span class="info_in_yellow"><img src="templates/standard/images/symbols/task.png"
                                      alt=""/>{#taskwasdeassigned#}</span>
  {elseif $mode == "listclosed"}
    <span class="info_in_red"><img src="templates/standard/images/symbols/tasklist.png"
                                   alt=""/>{#tasklistwasclosed#}</span>
  {elseif $mode == "listdeleted"}
    <span class="info_in_red"><img src="templates/standard/images/symbols/tasklist.png"
                                   alt=""/>{#tasklistwasdeleted#}</span>
  {/if}
</div>
{literal}
  <script type="text/javascript">
    apperar = new Effect.Appear('systemmsg', { duration: 2.0 })
  </script>
{/literal}


<h1>{#mytasks#}</h1>

{* Search *}
<div class="headline">
  <a href="javascript:void(0);" id="block-{$myprojects[project].ID}_toggle" class="win_block"
     onclick="toggleBlock('myTasksFilter);"></a>

  <h2>
    <a href="managetask.php?action=showproject&amp;id={$myprojects[project].ID}" title="Filter"><img
        src="./templates/standard/images/symbols/projects.png" alt=""/>{#filter#}</a>
  </h2>
</div>
<div id="myTasksFilter" class="block">
  <div id="criteria" class="block_in_wrapper">
    <form class="main">
      <div class="row">
        <label for="customer">{#customer#}:</label>
        <select name="criteriaCustomer" id="criteriaCustomer"
                onchange='onNormalSelCustomerChange(this,"mytasks.php?action=filterMyTask","tasksContainer")';
        required = "1">
        <option value="-1" selected="selected">{#chooseone#}</option>
        {section name=customer loop=$customers}
          <option value="{$customers[customer][0]}">{$customers[customer][0]}</option>
        {/section}
        </select>
      </div>
      {if $smarty.session.userRole <=3}
        <div class="row">
          <label for="customer">{#projectLeader#}:</label>
          <select name="criteriaProjectLeader" id="criteriaProjectLeader"
                  onchange='onNormalSelProjectLeaderChange(this,"mytasks.php?action=filterMyTask","tasksContainer")';
          required = "1">
          <option value="-1" selected="selected">{#chooseone#}</option>
          {section name=leader loop=$projectLeaders}
            <option value="{$projectLeaders[leader].ID}">{$projectLeaders[leader].name}</option>
          {/section}
          </select>
        </div>
      {/if}
      <div class="row"></div>
    </form>
  </div>
</div>
{* End Search *}

{* my tasks block*}
  <div id="tasksContainer" style="margin:12px 0px">
{include file="mytasks_sections.tpl"}
  </div>
{* End of my tasks block*}

{if $tasknum < 1}
  <b>{#notasks#}</b>
  <div class="content-spacer"></div>
{/if}


</div> {*tasks END*}
</div> {*content-left-in END*}
</div> {*content-left END*}


{include file="sidebar-a.tpl"}
{include file="footer.tpl"}