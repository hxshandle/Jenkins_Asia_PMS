{include file="header.tpl" jsload = "ajax" stage = "project" jsload1 = "tinymce"}

{include file="tabsmenue-project.tpl" projecttab = "active"}

<script type = "text/javascript">
  var __projectId= {$project.ID};
</script>

<div id="content-left">
<div id="content-left-in">
<div class="projects">


	<div class="infowin_left" style = "display:none;" id = "systemmsg">
		{if $mode == "edited"}
		<span class="info_in_yellow"><img src="templates/standard/images/symbols/projects.png" alt=""/>{#projectwasedited#}</span>
		{elseif $mode == "timeadded"}
		<span class="info_in_green"><img src="templates/standard/images/symbols/timetracker.png" alt=""/>{#timetrackeradded#}</span>
		{/if}
	</div>
	{literal}
	<script type = "text/javascript">
		systemMsg('systemmsg');
	 </script>
	{/literal}

<h1>{$project.name|truncate:45:"...":true}<span>/ {#overview#}</span></h1>

	<div class="statuswrapper">
			<ul>
				{if $project.daysleft != "" || $project.daysleft == "0"}
					<li {if $project.daysleft < 0}class="red"{elseif $project.daysleft == "0"}class="green"{/if}><a>{$project.daysleft} {#daysleft#}</a></li>
				{/if}
			</ul>

			<div class="status">
				{$done}%
				<div class="statusbar"><div class="complete" id = "completed" style="width:0%;"></div></div>
			</div>
	</div>

			{*Edit Task*}
			{if $userpermissions.projects.edit}
				<div id = "form_edit" class="addmenue" style = "display:none;clear:both;">
					<div class="content-spacer"></div>
					{include file="editform.tpl" showhtml="no" }
				</div>
			{/if}
        {* base info*}
				<div id = "project-base-form" class="addmenue" style = "clear:both;">
					<div class="content-spacer"></div>
					{include file="projectbaseinfo.tpl" showhtml="no" }
				</div>
        
        {* advance tabs info*}
        <div id = "project-details-tabs" class="addmenue" style="clear:both;">
          <div class="content-spacer"></div>
          {include file="projectdetailstabs.tpl"}
        </div>

<div class="nosmooth" id="sm_project_desc">
		<div id="descript" class="descript" style="display:none;">
		<div class="content-spacer"></div>
			{$project.desc}
		</div>
</div>

</div> {*Projects END*}
<div class="content-spacer"></div>

<div class="nosmooth" id="sm_project">


{if $smarty.session.userRole < 6}

{*Activity Log*}
<div class="neutral">
	{include file="log.tpl" }
</div>
{*Activity Log End*}
{/if}

</div> {*nosmooth End*}


{literal}
	<script type = "text/javascript">
	//changeshow('manageproject.php?action=cal&id={/literal}{$project.ID}{literal}','thecal','progress');
	</script>
{/literal}

</div> {*content-left-in END*}
</div> {*content-left END*}

{include file="sidebar-a.tpl" showcloud="1"}



{literal}
	<script type = "text/javascript">
    
		Event.observe(window,"load",function()
		{
			new Effect.Morph('completed', {
				style: 'width:{/literal}{$done}{literal}%',
				duration: 4.0
			});
		});
	</script>
{/literal}

{include file="footer.tpl"}
