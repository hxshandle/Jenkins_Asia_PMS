{config_load file=lng.conf section = "strings" scope="global" }

{foreach from=$groupedTasks key=pname item=phase name=p}
<div class='document' style="margin-bottom:12px;">
	<div class="projects">
		<div class="headline">
			<a id="delaytaskhead_toggle" class="win_block" onclick="toggleBlock('delaytaskhead-{$smarty.foreach.p.index}');" href="javascript:void(0);"></a>
			<h2><img alt="" src="./templates/standard/images/symbols/projects.png">{$pname}</h2>
		</div>
		<div id="delaytaskhead-{$smarty.foreach.p.index}" class="block" style="margin-top:0">
			 <!-- start tasks table-->
			{foreach from=$phase key=phaseName item=deliverable name=pp}
				<h1 style="padding:10px 0 0 10px;width:auto;color:#fff;background:#95A5A6;">{$phaseName}</h1>
				{foreach from=$deliverable key=deliverableName item=tasks name=pd}
					<h2 style="padding:10px 0px 10px 12px;color:#fff;background:#95A5A6;margin-bottom:0;">{$deliverableName}</h2>
					<table id="delatyTaskTable" cellspacing="0" cellpadding="0" border="0" style="width:100%;margin-bottom:8px;border:1px solid #aaa;">
					   <thead>
					     <tr>
					       <th><input type="checkbox" name="selAll" onclick='normalSelAll(this,"selectedDelayTask")' ></th>
					       <th class="b tx">{#task#}</th>
					       <th class="b tx">{#status#}</th>
					       <th class="b tx">{#end#}</th>
					       <th class="b tx" style="border-right:1px solid #aaa;">{#assignto#}</th>
					     </tr>
					   </thead>
					   <tbody id="tkumentTBody">
					     {section name=tk loop=$tasks}
					         {if $smarty.section.tk.index % 2 == 0}
					           <tr class="color-a">
					         {else}
					           <tr class ="color-b">
					         {/if}
					             <td><input type="checkbox" name="selectedDelayTask" value = "{$tasks[tk].ID}"/></td>
					             <td><a target="_blank" href="managetask.php?action=showtask&tid={$tasks[tk].ID}&id={$tasks[tk].project}">{$tasks[tk].title|truncate:30:"..."}</a></td>
					             <td>{dispstatus statusId =$tasks[tk].status}</td>
					             <td>{$tasks[tk].endstring}</td>
					             <td style="border-right:1px solid #aaa;">{$tasks[tk].user}</td>

					           </tr>
					     {/section}
					   </tbody>
					 </table>
					 <!-- end tasks table-->
				{/foreach}
			{/foreach}


			 {*assign var=tasks value=$data.tasks*}
			 {*$tasks|@print_r*}
			 
		</div>
	</div>
</div>
  

{/foreach}



{*tkument table*}


