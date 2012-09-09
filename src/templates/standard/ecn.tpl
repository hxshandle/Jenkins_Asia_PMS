{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce"}
{include file="tabsmenue-desk.tpl" documenttab = "active"}


<div style="display:none">
<form id="f1" name = "f1" method="post" action="/manageecn.php?action=approveOrReject">
  <input type='hidden' id="operation" name = "operation"></input>
  <input type = 'hidden' id = "ecnId" name = "ecnId"></input>
</form>
</div>

<div id="content-left">
  <div id="content-left-in">
    <div class="document">z
      <div class="projects">
        <div class="headline">
        <a id="documenthead_toggle" class="win_block" onclick="toggleBlock('documenthead');" href="javascript:void(0);"></a>
        <h2>
        <img alt="" src="./templates/standard/images/symbols/projects.png">
        {#ecnname#}
        </h2>
        </div>

        {* Search *}
        <div id="documenthead" class="block">
          <div id="form_adddecn" style="display:none">
            {include file="addEcnForm.tpl"}
          </div>

          <div id="criteria" class = "block_in_wrapper">
          <form class="main">
            <fieldset>

            <h1>{#filter#}</h1>
            <div class="row">
              <label for="project">{#project#}:</label>
              <select name="criteriaProject" id="criteriaProject" onchange="onCriteriaProjectChange(this)"; required = "1">
                <option value="-1" selected="selected">{#chooseone#}</option>
                {section name=project loop=$projects}
                  <option value="{$projects[project].ID}">{$projects[project].name}</option>
                {/section}
              </select>
            </div>

            <div class="row">
              <label for="customer">{#customer#}:</label>
              <select name="criteriaCustomer" id="criteriaCustomer" onchange="onCriteriaCustomerChange(this)"; required = "1">
                <option value="-1" selected="selected">{#chooseone#}</option>
                {section name=customer loop=$customers}
                  <option value="{$customers[customer][0]}">{$customers[customer][0]}</option>
                {/section}
              </select>
            </div>

            <div class="row">
              <label for="order">{#order#}:</label>
              <select name="criteriaOrder" id="criteriaOrder" onchange="onCriteriaOrderChange(this)"; required = "1">
                <option value="-1" selected="selected">{#chooseone#}</option>
                {section name=cOrder loop=$orders}
                  <option value="{$orders[cOrder].ID}">{$orders[cOrder].name}</option>
                {/section}
              </select>
            </div>

            </fieldset>
            </form>
          </div>
            {* End Search *}

          {*Document table*}
          <div id="ecnTableContainer">
          {include file="ecnTable.tpl"}
          </div>

          {*Add Menu*}
          <div class="tablemenue">
            <div class="tablemenue-in">
              <a onclick="toggleClass(this,'add-active','add');toggleClass(this,'butn_link_active','butn_link');disableUploadBtn();" id="add_butn_myprojects" href="javascript:blindtoggle('form_adddecn');" class="butn_link">{#addECN#}</a>
            </div>
          </div>
          <div class="content-spacer"></div>
        </div>
      </div>
    </div>
  </div> {*content-left-in END*}
</div> {*content-left END*}


{include file="sidebar-a.tpl"}
{include file="footer.tpl"}