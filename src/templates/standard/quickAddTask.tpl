{include file="header.tpl" jsload = "ajax"  jsload1 = "tinymce" showheader="no"}
<body style="background: url(/templates/standard/images/tables-tasks-sechead.png) repeat scroll 0 0 transparent;">
  <div class="tasks block_in_wrapper" >

    <h2>{#addtask#}</h2>
    <form name = "addtaskform" id = "addtaskform" class="main" method="post" action="managetask.php?action=add"  onsubmit="return J.validationAddTask(this,'hiErrorField')">
        <fieldset>
        	<div class="row">
        		<label for="project">{#project#}:</label>
        		<select type="text" class="text" name="project" realname="{#project#}"  id="project" required = "1" onchange="onProjectChange(this)">
					{section name = p loop=$myProjects}
	              		<option value = "{$myProjects[p].ID}">{$myProjects[p].name}</option>
				    {/section}
				</select>
        	</div>
        	<div class="row"><label for="title">{#title#}:</label><input type="text" class="text" name="title" id="title"  realname = "{#title#}" required = "1"  /></div>
			<div class="row"><label for="text">{#text#}:</label><div class="editor"><textarea name="text" id="text" rows="3" cols="1" ></textarea></div></div>

			<div class="row"><label for="location">{#location#}:</label><input type="text" class="text" name="location" realname="{#location#}"  id="location" required = "1" /></div>

			<div class="row"><label for="status">{#status#}:</label>
				<select type="text" class="text" name="status" realname="{#location#}"  id="status" required = "1" >
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
			<div class="row"><label for="parent">{#parentTask#}:</label>
				<select type="text" class="text" name="parent" realname="{#parent#}"  id="parent" required = "1" >
					<option value = "-1">{#chooseone#}</option>
				</select>
			</div>



			<div class="row"><label for="start">{#startDate#}:</label><input type="text" class="text" name="start" realname="{#startDate#}"  id="start" required = "1" /> <span class="tipsMsg" id="tips_startDate">  {$deliverStartDate|truncate:"10":""}</span></div>
			<div class="row"><label for="end">{#due#}:</label><input type="text" class="text" name="end" realname="{#due#}"  id="end" required = "1" /><span class="tipsMsg" id="tips_endDate"> {$deliverEndDate|truncate:"10":""}</span></div>

			<div class="datepick">
				<div id = "datepicker_taskStart" class="picker" style = "display:none;"></div>
			</div>

			<div class="datepick">
				<div id = "datepicker_taskEnd" class="picker" style = "display:none;"></div>
			</div>

			<script type="text/javascript">
				theCalStart = new calendar({$theM},{$theY});
				theCalStart.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
				theCalStart.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
				theCalStart.relateTo = "start";
				theCalStart.dateFormat = "{$settings.dateformat}";
				theCalStart.getDatepicker("datepicker_taskStart");

				theCalEnd = new calendar({$theM},{$theY});
				theCalEnd.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
				theCalEnd.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
				theCalEnd.relateTo = "end";
				theCalEnd.dateFormat = "{$settings.dateformat}";
				theCalEnd.getDatepicker("datepicker_taskEnd");
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
				<button onclick="blindtoggle('form_');toggleClass('add_','add-active','add');toggleClass('add_butn_','butn_link_active','butn_link');toggleClass('sm_','smooth','nosmooth');return false;" onfocus="this.blur();">{#cancel#}</button>
			</div>

			</fieldset>
    </form>

</div>
{literal}
<script>
	function onProjectChange(el){
		alert(el.value);
		__projectId = el.value;
		window.__swfu = null;
		window.__swfu = J.initSwfUploader("uploadfileajax.php",{"PHPSESSID" : __sesionId,"userId":__userId,'type':__uploadType,"id":__projectId},"spanButtonPlaceHolder","btnCancel",__callbackFunc,null,"fsUploadProgress");
	}
</script>
{/literal}
</body>