{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce"}
{include file="tabsmenue-desk.tpl" tasksumarytab = "active"}



<div id="content-left">
  <div id="content-left-in">
    <div class="document">
      <div class="projects">
        <div class="headline">
        <a id="delaytaskhead_toggle" class="win_block" onclick="toggleBlock('delaytaskhead');" href="javascript:void(0);"></a>
        <h2>
        <img alt="" src="./templates/standard/images/symbols/projects.png">
        {#tasksummary#}
        </h2>
        </div>

        {* Search *}
        <div id="delaytaskhead" class="block">
          <div id="criteria" class = "block_in_wrapper">
          <form class="main">
            <fieldset>

            <h1>{#filter#}</h1>
            <div class="row">
              <label for="customer">{#customer#}:</label>
              <select name="criteriaCustomer" id="criteriaCustomer" onchange='onNormalSelCustomerChange(this,"managetasksummary.php?action=filterTasks","delayTaskTableContainer")'; required = "1">
                <option value="-1" selected="selected">{#chooseone#}</option>
                {section name=customer loop=$customers}
                  <option value="{$customers[customer][0]}">{$customers[customer][0]}</option>
                {/section}
              </select>
            </div>
			{if $smarty.session.userRole <=3 || $smarty.session.userid == 6}
            <div class="row">
              <label for="customer">{#projectLeader#}:</label>
              <select name="criteriaProjectLeader" id="criteriaProjectLeader" onchange='onNormalSelProjectLeaderChange(this,"managetasksummary.php?action=filterTasks","delayTaskTableContainer")'; required = "1">
                <option value="-1" selected="selected">{#chooseone#}</option>
                {section name=leader loop=$projectLeaders}
                  <option value="{$projectLeaders[leader].ID}">{$projectLeaders[leader].name}</option>
                {/section}
              </select>
            </div>
			{/if}
            <div class="row">
              <a class="butn_link" onclick="sendTaskDelayReminder()">{#sendreminder#}</a>
            </div>
            </fieldset>
            </form>
          </div>
            {* End Search *}

          {*delaytask table*}
          <div id="delayTaskTableContainer">
          {include file="_tasksGroupedByProject.tpl"}
          </div>

          <div class="content-spacer"></div>
        </div>
      </div>
    </div>
  </div> {*content-left-in END*}
</div> {*content-left END*}

{include file="sidebar-a.tpl"}
{include file="footer.tpl"}
