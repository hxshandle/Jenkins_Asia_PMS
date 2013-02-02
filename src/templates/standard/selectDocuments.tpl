{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<script type = "text/javascript" src = "include/js/selectDocuments.js" ></script>
{*Document table*}

<body style="background: url(/templates/standard/images/tables-projects-sechead.png) repeat scroll 0 0 transparent;">
<div class="projects">
{* Search *}
<div id="documenthead" class="block">
  <div id="form_adddocument" style="display:block">
    {include file="addDocumentAjax.tpl"}
  </div>
  <div id="criteria" class = "block_in_wrapper">
  <form class="main">
    <fieldset>

    <h1>{#filter#}</h1>
    <div class="row">
      <label for="project">{#project#}:</label>
      <select name="criteriaProject" id="criteriaProject" onchange="onSelCriteriaProjectChange(this)"; required = "1">
        <option value="-1" selected="selected">{#chooseone#}</option>
        {section name=project loop=$projects}
          <option value="{$projects[project].ID}">{$projects[project].name}</option>
        {/section}
      </select>
    </div>

    <div class="row">
      <label for="customer">{#customer#}:</label>
      <select name="criteriaCustomer" id="criteriaCustomer" onchange="onSelCriteriaCustomerChange(this)"; required = "1">
        <option value="-1" selected="selected">{#chooseone#}</option>
        {section name=customer loop=$customers}
          <option value="{$customers[customer][0]}">{$customers[customer][0]}</option>
        {/section}
      </select>
    </div>

    <div class="row">
      <label for="order">{#order#}:</label>
      <select name="criteriaOrder" id="criteriaOrder" onchange="onSelCriteriaOrderChange(this)"; required = "1">
        <option value="-1" selected="selected">{#chooseone#}</option>
        {section name=cOrder loop=$orders}
          <option value="{$orders[cOrder].ID}">{$orders[cOrder].name}</option>
        {/section}
      </select>
    </div>

    </fieldset>
    </form>
  </div>
</div>
    {* End Search *}
    <input type="hidden" id="callBack" value = "{$callBack}"></input>
    <input type="hidden" id="refElement" value = "{$refElement}"></input>
    <input type="hidden" id="dispElement" value = "{$dispElement}"></input>
  <div class="documentTableWrapper block" id="documentTableContainer">
    {include file="selectDocumentsTable.tpl"}
  </div>

  <div style="float:right;margin-top:8px;padding-right:8px;">
    <a class="butn_link" onclick="blindtoggle('form_adddocument');return false;">{#addDocument#}</a>
    <a class="butn_link" onclick="getSelectedDocuments();">{#confirm#}</a>
    <a class="butn_link" onclick="window.close();">{#cancel#}</a>
  </div>
</div>
<script>
  window.focus();
</script>
</body>
