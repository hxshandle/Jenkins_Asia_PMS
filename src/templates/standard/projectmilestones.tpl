{include file="header.tpl" jsload="ajax"  jsload1="tinymce"}
{include file="tabsmenue-project.tpl" milestab = "active"}
<link type="text/css" rel="stylesheet" href="include/js/gantt/dhtmlxgantt3.2.css">
<!--script type="text/javascript" language="JavaScript" src="include/js/gantt/dhtmlxcommon.js"></script-->
<script type="text/javascript" language="JavaScript" src="include/js/gantt/dhtmlxgantt3.2.js"></script>
<script type="text/javascript" language="JavaScript" src="include/js/gantt/dhtmlxgantt_tooltip.js"></script>
{literal}
<style type="text/css">
	#contentwrapper{
		width:100%;
	}
	#content-left{
		width:100%;
	}
	#content-right{
		display: none;
	}
</style>
{/literal}

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
			<div id ="gantt" style="height:500px;"></div>


		</div> {*Miles END*}
		<div class="content-spacer"></div>
	</div> {*content-left-in END*}
</div> {*content-left END*}

<script type="text/javascript">
	/*
	  var gantt = new GanttChart();
        gantt.setImagePath("include/js/gantt/imgs/");
        gantt.create("gantt");
        gantt.showDescTask(true,'n,s-f');
        gantt.showDescProject(true,'n,d');
        gantt.loadData("ganttservice.php?action=load&&id={$project.ID}",true,true);
        */
    gantt.config.xml_date = "%Y,%m,%d";
    gantt.config.scale_unit = "week"; 
		//gantt.config.date_scale = "#%Y,%W";
		{literal}
		gantt.templates.tooltip_text = function(start,end,task){
    	return "<b>Task:</b> "+task.text+"<br/><b>Start date:</b> " + 
    				gantt.templates.tooltip_date_format(start)+ 
    			"<br/><b>End date:</b> "+gantt.templates.tooltip_date_format(end)+"<br/><b>Completed:</b>"+(task.progress*100)+"%";
		};
		{/literal}
		gantt.config.tooltip_hide_timeout = 5000;
		gantt.config.show_quick_info = true;
		gantt.config.show_progress = true;
		gantt.config.readonly = true;
    gantt.init("gantt");
		gantt.load("ganttservice.php?action=load&&id={$project.ID}", "oldxml");
</script>


{include file="sidebar-a.tpl"}
{include file="footer.tpl"}
