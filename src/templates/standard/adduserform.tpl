<div class="block_in_wrapper">
	<form class="main" method="post" action="admin.php?action=adduser" {literal}onsubmit="return validateCompleteForm(this);"{/literal}>
		<fieldset>

			<div class="row">
				<label for="name">{#userName#}:</label>
				<input type="text" name="name" id="name" required="1" realname="{#userName#}" />
			</div>
      <div class="row">
				<label for="fullName">{#fullName#}:</label>
				<input type="text" name="fullName" id="fullName" required="1" realname="{#fullName#}" />
			</div>
			<div class="row">
				<label for="title">{#title#}:</label>
				<input type="text" name="title" id="title" realname="{#title#}" />
			</div>
			<div class="row">
				<label for="email">{#email#}:</label>
				<input type="text" name="email" id="email" realname="{#email#}" />
			</div>
			<div class="row">
				<label for="pass">{#password#}:</label>
				<input type="text" name="pass" id="pass" required="1" realname="{#password#}" />
			</div>

			{if $projects} {*only show this block if there are any projects to choose*}
				<div class="clear_both_b"></div>
				
				<div class="row">
					<label>{#projects#}:</label>
					<div style="float:left;">
						{section name=project loop=$projects}
							<div class="row">
								<input type="checkbox" class="checkbox" value="{$projects[project].ID}" name="assignto[]" id="{$projects[project].ID}" /><label for="{$projects[project].ID}" style="width:210px;">{$projects[project].name}</label>
							</div>
						{/section}
					</div>
				</div>
				
				<div class="clear_both_b"></div>
			{/if}
			

			<div class="row">
				<label>{#role#}:</label>
				<select name = "roletype" realname = "{#role#}" required="1" exclude = "-1" id = "roletypeselect">
					<option value="-1" selected="selected">{#chooseone#}</option>
					
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
			<div class="clear_both_b"></div>
			
			<div class="row">
				<label>&nbsp;</label>
				<div class="butn">
					<button type="submit">{#addbutton#}</button>
				</div>
				<a href = "javascript:blindtoggle('form_member');" class="butn_link"><span>{#cancel#}</span></a>
			</div>

		</fieldset>
	</form>
</div> {*block_in_wrapper end*}