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
        <input type="text" class="text" name="documentNo" id="documentNo" required="1" realname="{#documentNo#}"  ></input>
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
        <ul class="chk-list">
          <li><label>{#superAdmin#}<input type="checkbox" name="visibility[]" value="1"></label></li>
          <li><label>{#admin#}<input type="checkbox" name="visibility[]" value="2"></label></li>
          <li><label>{#manageLv1#}<input type="checkbox" name="visibility[]" value="3"></label></li>
          <li><label>{#manageLv2#}<input type="checkbox" name="visibility[]" value="4"></label></li>
          <li><label>{#staff#}<input type="checkbox" name="visibility[]" value="5"></label></li>
          <li><label>{#customerLv1#}<input type="checkbox" name="visibility[]" value="6"></label></li>
          <li><label>{#customerLv2#}<input type="checkbox" name="visibility[]" value="7"></label></li>
          <li><label>{#supplierLv1#}<input type="checkbox" name="visibility[]" value="8"></label></li>
          <li><label>{#supplierLv2#}<input type="checkbox" name="visibility[]" value="9"></label></li>
        </ul>
      </div>

      <div class="row">
        <label style="">{#notify#}</label>
        <div id="notify-outer"> </div>
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
