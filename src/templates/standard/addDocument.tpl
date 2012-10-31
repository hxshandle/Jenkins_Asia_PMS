<script type = "text/javascript" src = "include/js/addDocument.js" ></script>
<div class="block_in_wrapper">
  <h2>{#addDocument#}</h2>
  <form onsubmit="return validateCompleteForm(this);" action="managedocument.php?action=addDocument" method="post" class="main">
    <fieldset>

		  <div class="row">
        <label for="project">{#project#}:</label>
				<select name="project" id="project" onchange="onSelProjectChange(this)"; required = "1">
				  <option value="-1" selected="selected">{#chooseone#}</option>
          {section name=project loop=$projects}
            <option value="{$projects[project].ID}">{$projects[project].name}</option>
          {/section}
        </select>
      </div>

		  <div class="row">
        <label for="name">{#name#}:</label>
        <input type="text" class="text" name="name" id="name" required="1" realname="{#name#}" />
      </div>

      <div class="row">
        <label for="name">{#documentNo#}:</label>
        <input type="text" class="text" name="documentNo" id="documentNo" required="1" realname="{#documentNo#}" />
      </div>


		  <div class="row">
        <label for="revision">{#revision#}:</label>
        <input type="text" class="text" name="revision" id="revision" required="1" realname="{#revision#}" />
      </div>

		  <div class="row">
        <label for="description">{#description#}:</label>
        <div class="editor"><textarea id="description" name="description" rows="3" cols="1" ></textarea></div>
      </div>


		  <div class="row" style="display:none">
        <label for="task">{#task#}:</label>
				<select name="task" id="task" onchange="void(0);">
				  <option value="-1" selected="selected">{#chooseone#}</option>
        </select>
      </div>
    
		  <div class="row" style="display:none">
        <label for="order">{#order#}:</label>
				<select name="order" id="order" onchange="void(0);">
				  <option value="-1" selected="selected">{#chooseone#}</option>
        </select>
      </div>

		  <div class="row" style="display:none">
        <label for="quality">{#quality#}:</label>
				<select name="quality" id="quality" onchange="void(0);">
				  <option value="-1" selected="selected">{#chooseone#}</option>
        </select>
      </div>
      <div class="row">
        <label for="visibility" >{#visibility#}:</label>
        <select name = "visibility[]" multiple="multiple" style = "height:80px;" id="visibility" required = "1" exclude = "-1" realname = "{#visibility#}">
            <option value = "1" >{#superAdmin#}</option>
            <option value = "2" >{#admin#}</option>
            <option value = "3" >{#manageLv1#}</option>
            <option value = "4" >{#manageLv2#}</option>
            <option value = "5" >{#staff#}</option>
            <option value = "6" >{#customerLv1#}</option>
            <option value = "7" >{#customerLv2#}</option>
            <option value = "8" >{#supplierLv1#}</option>
            <option value = "9" >{#supplierLv2#}</option>
        
         </select>
      </div>

	    <div class="row">
		    <label for="uploadfile" >{#upload#}:</label>
		    {include file = "uploadfile.tpl" callbackFunc="afterUploadFile"}
	    </div>

      <div class="row-butn-bottom">
        <label></label>
        <button onfocus="this.blur();" type="submit">{#add#}</button>
        <button onfocus="this.blur();" onclick="blindtoggle('form_adddocument');return false;" type="reset">{#cancel#}</button>
      </div>
      <input type="hidden" id="fileId" name="fileId"></input>
    </fieldset>
  </form>
</div>
<script type = "text/javascript" src = "include/js/addDocument.js" ></script>
