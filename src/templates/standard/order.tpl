{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce"}
{include file="tabsmenue-desk.tpl" ordertab = "active"}
<script type = "text/javascript" src = "include/js/order.js" ></script>
<div id = "priceOrderDlg"></div>

<div id="content-left">
  <div id="content-left-in">
    <div class="document">
      <div class="projects">
        <div class="headline">
        <a id="orderhead_toggle" class="win_block" onclick="toggleBlock('orderhead');" href="javascript:void(0);"></a>
        <h2>
        <img alt="" src="./templates/standard/images/symbols/projects.png">
        {#order#}
        </h2>
        </div>

        {* Search *}
        <div id="orderhead" class="block">
          <div id="form_addorder" style="display:none">
            {include file="addorder2.tpl"}
          </div>

          <div id="criteria" class = "block_in_wrapper">
          <form class="main">
            <fieldset>

            <h1>{#filter#}</h1>
            <div class="row">
              <label for="project">{#project#}:</label>
              <select name="criteriaProject" id="criteriaProject" onchange="onOrderCriteriaProjectChange(this)"; required = "1">
                <option value="-1" selected="selected">{#chooseone#}</option>
                {section name=project loop=$projects}
                  <option value="{$projects[project].ID}">{$projects[project].name}</option>
                {/section}
              </select>
            </div>
            {if $smarty.session.userRole < 6 }
            <div class="row">
              <label for="customer">{#customer#}:</label>
              <select name="criteriaCustomer" id="criteriaCustomer" onchange="onOrderCriteriaCustomerChange(this)"; required = "1">
                <option value="-1" selected="selected">{#chooseone#}</option>
                {section name=customer loop=$customers}
                  <option value="{$customers[customer][0]}">{$customers[customer][0]}</option>
                {/section}
              </select>
            </div>
            {/if}
            <div class="row">
              <label for="order">{#order#}:</label>
              <select name="criteriaOrder" id="criteriaOrder" onchange="onOrderCriteriaOrderChange(this)"; required = "1">
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

          {*order table*}
          <div id="orderTableContainer">
          {include file="orderTable.tpl"}
          </div>

          {*Add Menu*}
          <div class="tablemenue">
            <div class="tablemenue-in">
              <a onclick="toggleClass(this,'add-active','add');toggleClass(this,'butn_link_active','butn_link');disableUploadBtn();" id="add_butn_myprojects" href="javascript:blindtoggle('form_addorder');" class="butn_link">{#addOrder#}</a>
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
