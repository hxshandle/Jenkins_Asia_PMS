<!-- edittasklist.tpl -->
<div class = "block_in_wrapper">
	<h2>{#addtasklist#}</h2>
	<form class="main" method="post" action="managetasklist.php?action=add&amp;id={$project.ID}" {literal} onsubmit="return validateCompleteForm(this);"{/literal} >
	<fieldset>
			<div class="row"><label for="name">{#name#}:</label><input type="text" class="text" name="name" id="name" required="1" realname="{#name#}" /></div>
			<div class="row"><label for="desc">{#description#}:</label><div class="editor"><textarea name="desc" id="desc"  rows="3" cols="1" ></textarea></div></div>
	
	
			<div class="row">
				<label for="deliverableItems">{#deliverableItems#}: </label>
				<select name="deliverableItems" id="deliverableItems" >
				<option value="0" selected="selected">{#chooseone#}</option>
				{section name=stone loop=$deliverableItems}
					<option value="{$deliverableItems[stone].ID}">{$deliverableItems[stone].name}</option>
				{/section}
				</select>
			</div>
	
			<div class="row-butn-bottom">
				<label>&nbsp;</label>
				<button type="submit" onfocus="this.blur();">{#addbutton#}</button>
				<button onclick="blindtoggle('addlist');toggleClass('addtasklists','add','add-active');return false;" onfocus="this.blur();">{#cancel#}</button>
			</div>

	</fieldset>
</form>
</div>
<div class="content-spacer"></div>
<!-- end of edittasklist.tpl -->