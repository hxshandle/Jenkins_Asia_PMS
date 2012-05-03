{include file="header.tpl" jsload="ajax"  jsload1="tinymce"}
{include file="tabsmenue-project.tpl" milestab = "active"}
<link type="text/css" rel="stylesheet" href="include/js/gantt/dhtmlxgantt.css">
<script type="text/javascript" language="JavaScript" src="include/js/gantt/dhtmlxcommon.js"></script>
<script type="text/javascript" language="JavaScript" src="include/js/gantt/dhtmlxgantt.js"></script>

<div id="content-left">
	<div id="content-left-in">
		<div class="miles">
			<div class="infowin_left" style = "display:none;" id = "systemmsg">
				{if $mode == "added"}
					<span class="info_in_green"><img src="templates/standard/images/symbols/miles.png" alt=""/>{#milestonewasadded#}</span>
				{elseif $mode == "edited"}
					<span class="info_in_yellow"><img src="templates/standard/images/symbols/miles.png" alt=""/>{#milestonewasedited#}</span>
				{elseif $mode == "deleted"}
					<span class="info_in_red"><img src="templates/standard/images/symbols/miles.png" alt=""/>{#milestonewasdeleted#}</span>
				{elseif $mode == "opened"}
					<span class="info_in_green"><img src="templates/standard/images/symbols/miles.png" alt=""/>{#milestonewasopened#}</span>
				{elseif $mode == "closed"}
					<span class="info_in_red"><img src="templates/standard/images/symbols/miles.png" alt=""/>{#milestonewasclosed#}</span>
				{/if}
			</div>

			{literal}
				<script type = "text/javascript">
					systemMsg('systemmsg');
				</script>
			{/literal}

			<h1>{$projectname|truncate:45:"...":true}<span>/ {#gantt#}</span></h1>



			{*Gantt chart*}
			<div class="content-spacer"></div>
			<div class="headline">
				<a href="javascript:void(0);" id="gantt_toggle" class="win_block" onclick = "toggleBlock('gantt');"></a>
				<h2><img src="./templates/standard/images/symbols/miles.png" alt="" />{#gantt#}</h2>
			</div>
			<div id ="gantt" style="height:500px;">

			</div>


		</div> {*Miles END*}
		<div class="content-spacer"></div>
	</div> {*content-left-in END*}
</div> {*content-left END*}

<script type="text/javascript">
	  var gantt = new GanttChart();
        gantt.setImagePath("include/js/gantt/imgs/");
        gantt.create("gantt");
        gantt.showDescTask(true,'n,s-f');
        gantt.showDescProject(true,'n,d');
        gantt.loadData("ganttservice.php?action=load&&id={$project.ID}",true,true);
</script>


{include file="sidebar-a.tpl"}
{include file="footer.tpl"}
