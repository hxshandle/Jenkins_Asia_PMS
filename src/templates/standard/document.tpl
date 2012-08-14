{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce"}
{include file="tabsmenue-desk.tpl" documenttab = "active"}



<div id="content-left">
  <div id="content-left-in">
    <div class="document">
      <h1>{#mydocument#}</h1>
      <div class="projects">
        <div class="headline">
        <a id="documenthead_toggle" class="win_block" onclick="toggleBlock('documenthead');" href="javascript:void(0);"></a>
        <h2>
        <img alt="" src="./templates/standard/images/symbols/projects.png">
        {#mydocument#}
        </h2>
        </div>

        <div id="documenthead" class="block">
          <div id="form_adddocument" style="display:block">
					  {include file="addDocument.tpl"}
          </div>

          {*Document table*}
          <table id="documentsTable" cellspacing="0" cellpadding="0" border="0">
            <thead>
              <tr>
                <th class="b tx">{#documentName#}</th>
                <th class="b tx">{#project#}</th>
                <th class="b tx">{#revision#}</th>
                <th class="b tx">{#customer#}</th>
                <th class="b tx">{#task#}</th>
                <th class="b tx">{#order#}</th>
                <th class="b tx">{#quality#}</th>
              </tr>
            </thead>
          </table>

          {*Add Menu*}
          <div class="tablemenue">
					  <div class="tablemenue-in">
				  	  <a onclick="toggleClass(this,'add-active','add');toggleClass(this,'butn_link_active','butn_link');" id="add_butn_myprojects" href="javascript:blindtoggle('form_adddocument');" class="butn_link">{#addDocument#}</a>
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
