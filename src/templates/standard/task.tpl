{include file="header.tpl" jsload = "ajax" jsload1 = "tinymce"}

{include file="tabsmenue-project.tpl" taskstab = "active"}
<div id="content-left">
<div id="content-left-in">
<div class="tasks">





<div class="breadcrumb">
<a href="manageproject.php?action=showproject&amp;id={$project.ID}"><img src="./templates/standard/images/symbols/projects.png" alt="" />{$projectname|truncate:40:"...":true}</a>
<a href="managetask.php?action=showproject&amp;id={$project.ID}"><img src="./templates/standard/images/symbols/tasklist.png" alt="" />{#tasklists#}</a>
<a href="managetasklist.php?action=showtasklist&id={$project.ID}&tlid={$task.liste}" title="{#tasklist#} / {$task.list}"><img src="./templates/standard/images/symbols/tasklist.png" alt="" />{$task.list|truncate:50:"...":true}</a>
<span>&nbsp;/...</span>
</div>

<div class="second">
  <img style='float:left' src="./templates/standard/images/symbols/task.png" alt="" />
  <div style="float:left;width:600px;font-size:21px;font-weight:bold;line-height:34px;">
    {$task.title}
  </div>
</div>
  <div style='clear:both;padding-bottom:15px;'></div>

	<div class="statuswrapper">
			<ul>
				{if $userpermissions.tasks.close and $editable != 'false'}
				<li class="link" id = "closetoggle">
				{if $task.status == 1}
				<a class="close" href="javascript:closeElement('closetoggle','managetask.php?action=close&amp;tid={$task.ID}&amp;id={$project.ID}');" title="{#close#}"></a></li>
				{else}
				<a class="close" href="javascript:closeElement('closetoggle','managetask.php?action=open&amp;tid={$task.ID}&amp;id={$project.ID}');" title="{#open#}"></a></li>
				{/if}
				{/if}
				{if $userpermissions.tasks.edit}
				<li class="link"><a class="edit" href="javascript:void(0);"  id="edit_butn" onclick="blindtoggle('form_edit');toggleClass(this,'edit-active','edit');toggleClass('sm_task','smooth','nosmooth');" title="{#edit#}"></a></li>
				{/if}


				<li><a>{#user#}: {$task.user|truncate:25:"...":true}</a></li>
        <li><a>{#createby#}: {$task.assigned_by|truncate:25:"...":true}</a></li>
				<li><a>{#end#}: {$task.endstring}</a></li>
			</ul>
	</div>



			{*Edit Task*}
			{if $userpermissions.tasks.edit}
				<div id = "form_edit" class="addmenue" style = "display:none;clear:both;">
					<div class="content-spacer"></div>
					{include file="edittask.tpl" showhtml="no" }
				</div>
			{/if}
<script>
  var __taskId = {$task.ID};
</script>
{literal}
<script>
function refreshFileList(fileId){
	if(fileId){
  	var theUrl = "manageprojectajax.php?action=attachTaskFile&fileId="+fileId+"&taskId="+__taskId;
    new Ajax.Request(theUrl, {
	  method: 'get',
	  onSuccess:function(payload) {
			if(payload.responseText != "false"){
				window.location.reload();
			}
    }
		});
	}
}
</script>
{/literal}

<div class="content-spacer"></div>

	<div class="nosmooth" id="sm_task">
		<div id="descript" class="descript">
			<h2>{#task#}</h2>
			{$task.text}
			<div class="content-spacer"></div>
		</div>
	</div>
		<div id="status-update" class="descript">
			<h2>{#statusUpdate#}</h2>
			{*$task.status_update*}
            {include file="_task_comments.tpl" commentList = $taskComments}
			<div class="content-spacer"></div>
	  </div>
	<div class="nosmooth" id="attachment_task">
		<div id="descript" class="descript">
			<h2>{#files#}</h2>
			{if $editable != 'false'}
			<div style="background-color: rgb(134, 156, 173); padding: 0pt 15px;">
				{include file = "uploadfile.tpl" callbackFunc=refreshFileList}
				<div style="clear:both"></div>
			</div>
			{/if}
			<ul>
					{section name=file loop=$files}
				<li id = "fli_{$files[file].ID}">
					<div class="itemwrapper" id="iw_{$files[file].ID}">

						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td class="leftmen" valign="top">
									<div class="inmenue"></div>
								</td>
								<td class="thumb">
									<a href = "{$files[file].datei}" {if $files[file].imgfile == 1} rel="lytebox[]" {elseif $files[file].imgfile == 2} rel = "lyteframe[text]" rev="width: 650px; height: 500px;"{/if}>
										{if $files[file].imgfile == 1}
										<img src = "thumb.php?pic={$files[file].datei}&amp;width=32" alt="{$files[file].name}" />
										{else}
										<img src = "templates/standard/images/files/{$files[file].type|replace:"/":"-"}.png" alt="{$files[file].name}" />{$files[file].name}
										{/if}
									</a>
								</td>
								<td class="rightmen" valign="top">
									<div class="inmenue">
										{if $userpermissions.files.del}
										<a class="del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'fli_{$files[file].ID}\',\'managefile.php?action=delete&amp;id={$project.ID}&amp;file={$files[file].ID}\')');" title="{#delete#}"></a>
										{/if}
										{if $userpermissions.files.edit}
										<a class="edit" href="managefile.php?action=editform&amp;id={$project.ID}&amp;file={$files[file].ID}" title="{#editfile#}"></a>
										{/if}
									</div>
								</td>
							</tr>
						</table>

					</div> {*itemwrapper End*}
				</li>
				{literal}
					<script type = "text/javascript">
						new Draggable('{/literal}fli_{$files[file].ID}{literal}',{revert:true});
					</script>
				{/literal}
			{/section} {*files in fldes End*}
			</ul>
	</div>
	</div>
<div class="content-spacer"></div>

</div> {*Tasks END*}
</div> {*content-left-in END*}
</div> {*content-left END*}

{include file="sidebar-a.tpl"}
{include file="footer.tpl"}
