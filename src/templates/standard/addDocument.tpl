<div class="block_in_wrapper">
  <h2>{#addDocument#}</h2>
  <form onsubmit="return validateCompleteForm(this);" action="manageDocument.php?action=addDocument" method="post" class="main">
    <fieldset>

		  <div class="row">
        <label for="name">{#name#}:</label>
        <input type="text" class="text" name="name" id="name" required="1" realname="{#name#}" />
      </div>


		  <div class="row">
        <label for="revision">{#revision#}:</label>
        <input type="text" class="text" name="revision" id="revision" required="1" realname="{#revision#}" />
      </div>

		  <div class="row">
        <label for="revision">{#description#}:</label>
        <div class="editor"><textarea name="text" id="text" rows="3" cols="1" ></textarea></div>
      </div>

		  <div class="row">
        <label for="task">{#task#}:</label>
				<select name="task" id="task" onchange="void(0);">
				  <option value="-1" selected="selected">{#chooseone#}</option>
        </select>
      </div>
    
		  <div class="row">
        <label for="order">{#order#}:</label>
				<select name="order" id="order" onchange="void(0);">
				  <option value="-1" selected="selected">{#chooseone#}</option>
        </select>
      </div>

		  <div class="row">
        <label for="quality">{#quality#}:</label>
				<select name="quality" id="quality" onchange="void(0);">
				  <option value="-1" selected="selected">{#chooseone#}</option>
        </select>
      </div>
      <div class="row-butn-bottom">
        <label></label>
        <button onfocus="this.blur();" type="submit">{#add#}</button>
        <button onfocus="this.blur();" onclick="blindtoggle('form_adddocument');return false;" type="reset">{#cancel#}</button>
      </div>


    </fieldset>
  </form>
</div>
