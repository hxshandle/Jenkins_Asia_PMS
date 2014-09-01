<!-- addtask.tpl -->
<div id="mode-dialog"></div>
<div class="block_in_wrapper">

	<h2>{#addtask#}</h2>
	<form name = "addtaskform{$lists[list].ID}" id = "addtaskform{$lists[list].ID}" class="main" method="post" action="managetask.php?action=add&amp;id={$project.ID}"  onsubmit="return J.validationAddTask(this,'hiErrorField')">
	<fieldset>
	<div class="row"><label for="title">{#title#}:</label><input type="text" class="text" name="title" id="title"  realname = "{#title#}" required = "1"  /></div>
	<div class="row"><label for="text">{#text#}:</label><div class="editor"><textarea name="text" id="text" rows="3" cols="1" ></textarea></div></div>

	<div class="row"><label for="location{$lists[list].ID}">{#location#}:</label><input type="text" class="text" name="location" realname="{#location#}"  id="location{$lists[list].ID}" required = "1" /></div>

	<div class="row"><label for="status{$lists[list].ID}">{#status#}:</label>
		<select type="text" class="text" name="status" realname="{#location#}"  id="status{$lists[list].ID}" required = "1" >
		{section name = idx loop=$taskStatus}
            {if $taskStatus[idx].id == $project.status}
              <option selected value = "{$taskStatus[idx].id}">{$taskStatus[idx].value}</option>
            {else}
              <option value = "{$taskStatus[idx].id}">{$taskStatus[idx].value}</option>
            {/if}
    {/section}
		</select>
	</div>

	<div class="row">
				<label for="deliverableItems">{#deliverableItems#}: </label>
				<select name="deliverableItems" id="deliverableItems" onchange="deliverItemChanged(this)">
				<option value="-1" >{#chooseone#}</option>
				{section name=stone loop=$deliverableItems}
					<option value="{$deliverableItems[stone].ID}">{$deliverableItems[stone].name}</option>
				{/section}
				</select>
				{if $canEditDeilverableItem}
					<a class="butn_link" onclick="J.addNewDeliverableItem()">{#add#}</a>
					<a class="butn_link" onclick="J.editDeliverableItemDate()">{#edit#}</a>
				{/if}
	</div>	
	<div class="row"><label for="parent{$lists[list].ID}">{#parentTask#}:</label>
		<select type="text" class="text" name="parent" realname="{#parent#}"  id="parent" required = "1" >
			<option value = "-1">{#chooseone#}</option>
		</select>
	</div>



	<div class="row"><label for="start{$lists[list].ID}">{#startDate#}:</label><input type="text" class="text" name="start" realname="{#startDate#}"  id="start{$lists[list].ID}" required = "1" /> <span class="tipsMsg" id="tips_startDate">  {$deliverStartDate|truncate:"10":""}</span></div>
	<div class="row"><label for="end{$lists[list].ID}">{#due#}:</label><input type="text" class="text" name="end" realname="{#due#}"  id="end{$lists[list].ID}" required = "1" /><span class="tipsMsg" id="tips_endDate"> {$deliverEndDate|truncate:"10":""}</span></div>

	<div class="datepick">
		<div id = "datepicker_taskStart{$lists[list].ID}" class="picker" style = "display:none;"></div>
	</div>

	<div class="datepick">
		<div id = "datepicker_taskEnd{$lists[list].ID}" class="picker" style = "display:none;"></div>
	</div>

	<script type="text/javascript">
		theCalStart{$lists[list].ID} = new calendar({$theM},{$theY});
		theCalStart{$lists[list].ID}.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
		theCalStart{$lists[list].ID}.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
		theCalStart{$lists[list].ID}.relateTo = "start{$lists[list].ID}";
		theCalStart{$lists[list].ID}.dateFormat = "{$settings.dateformat}";
		theCalStart{$lists[list].ID}.getDatepicker("datepicker_taskStart{$lists[list].ID}");

		theCalEnd{$lists[list].ID} = new calendar({$theM},{$theY});
		theCalEnd{$lists[list].ID}.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
		theCalEnd{$lists[list].ID}.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
		theCalEnd{$lists[list].ID}.relateTo = "end{$lists[list].ID}";
		theCalEnd{$lists[list].ID}.dateFormat = "{$settings.dateformat}";
		theCalEnd{$lists[list].ID}.getDatepicker("datepicker_taskEnd{$lists[list].ID}");
	</script>

	<div class="row">
		<label for="assigned" >{#assignto#}:</label>
		<div>
			{include file="seluserlist.tpl" groupedUser=$grouped_assignable_users chkName="assigned"}
		</div>
	</div>
	<div class="row">
		<label for="distribution" >{#distribution#}:</label>
		<div>
			{include file="seluserlist.tpl" groupedUser=$grouped_assignable_users chkName="distribution"}
		</div>
	</div>
	<div class="row">
		<label for="uploadfile" >{#upload#}:</label>
		{include file = "uploadfile.tpl"}
	</div>
	<input type = "hidden" id = "fileId" name = "fileId"></input>
	{if $lists[list].ID != ""}
	<input type="hidden" value="{$lists[list].ID }" name="tasklist" />
	{else}
	<input type="hidden" value="{$tasklist.ID }" name="tasklist" />
	{/if}

	<div class="row-butn-bottom">
		<label>&nbsp;</label>
		<button type = "submit" onfocus="this.blur();">{#addbutton#}</button>
		<button onclick="blindtoggle('form_{$lists[list].ID}');toggleClass('add_{$lists[list].ID}','add-active','add');toggleClass('add_butn_{$lists[list].ID}','butn_link_active','butn_link');toggleClass('sm_{$lists[list].ID}','smooth','nosmooth');return false;" onfocus="this.blur();">{#cancel#}</button>
	</div>

	</fieldset>
	</form>

</div> {*block_in_wrapper end*}
{literal}
<script>
  function deliverItemChanged(arg){
  	J.showLoading();
  	var deliverableId = arg.value;
  	J.editDeliverableItemDateId = deliverableId;
  	J.canEditDeliverableItemDate = deliverableId == "-1" ? false:true;

  	var theUrl = "manageprojectajax.php?action=getTasksBydeliverableId&deliverableId="+deliverableId;
    new Ajax.Request(theUrl, {
	  method: 'get',
	  onSuccess:function(payload) {
			var jsonObj = eval("("+payload.responseText+")");
	  	$("tips_startDate").innerHTML = " > "+jsonObj['startDate'];
	  	$("tips_endDate").innerHTML = " < "+jsonObj['endDate'];
	  	var tasks = jsonObj['tasks'];
	  	var parentTaskEl = $("parent");
	  	parentTaskEl.innerHTML = "";
	  	parentTaskEl.value = "-1";
	  	var optionEl = document.createElement("option");
	  	optionEl.value = "-1";
	  	optionEl.innerHTML = unescape(MSGS.chooseone);
	  	parentTaskEl.appendChild(optionEl);
	  	for (var i = 0; i < tasks.length; i++) {
	  		var tk = tasks[i];
	  		var optionEl = document.createElement("option");
		  	optionEl.value = ""+tk['id'];
		  	optionEl.innerHTML = ""+tk['name'];
		  	parentTaskEl.appendChild(optionEl);
	  	};
	  	J.hideLoading();
    }
    });
    return true;
  }
</script>
{/literal}

<!-- end of addtask.tpl -->
