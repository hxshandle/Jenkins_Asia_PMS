<div class="headline">
    <a href="javascript:void(0);" id="projectbaseinfo_toggle" class="win_block" onclick = "toggleBlock('projectbaseinfo');"></a>

    <div class="wintools">
        <div class = "progress" id = "progress" style = "display:none;">
            <img src = "templates/standard/images/symbols/loader-cal.gif" />
        </div>
    </div>
    <h2>
        <img src="./templates/standard/images/symbols/projects.png" alt="" />{#supplier#}
    </h2>
</div>


{* Search *}
<div id="documenthead" class="block">
  <div id="form_addSupplier" style="display:none">
    {include file="addSupplier.tpl"}
  </div>

  <div id="criteria" class="">



    <div class="row">
          <label for="project-filter" class="critler-filter-label">Supplier Filter:</label>
          <input id="porject-filter" class="critler-filter" placeholder="Filter by Supplier name" data-type="project" data-data-source="_getProjects4HomePage()" autocomplete="off">
    </div>




  </div>
  {* End Search *}

  {*Supplier table*}
  <div id="documentTableContainer">
    {include file="_supplierTable.tpl"}
    
  </div>

  {*Add Menu*}
  <div class="tablemenue">
    <div class="tablemenue-in">
      <a onclick="toggleClass(this,'add-active','add');toggleClass(this,'butn_link_active','butn_link');"
         id="add_butn_myprojects" href="javascript:blindtoggle('form_addSupplier');"
         class="butn_link">{#addSupplier#}</a>
    </div>
  </div>
  <div class="content-spacer"></div>
</div>