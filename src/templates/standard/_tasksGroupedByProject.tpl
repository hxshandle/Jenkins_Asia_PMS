{config_load file=lng.conf section = "strings" scope="global" }

{foreach from=$groupedTasks key=pname item=data name=p}
<div class='document' style="margin-bottom:12px;">
	<div class="projects">
		<div class="headline">
			<a id="delaytaskhead_toggle" class="win_block" onclick="toggleBlock('delaytaskhead-{$smarty.foreach.p.index}');" href="javascript:void(0);"></a>
			<h2><img alt="" src="./templates/standard/images/symbols/projects.png">{$pname}</h2>
		</div>
		<div id="delaytaskhead-{$smarty.foreach.p.index}" class="block">
			 <!-- start tasks table-->
			 {assign var=tasks value=$data.tasks}
			 {*$tasks|@print_r*}
			 <table id="delatyTaskTable" cellspacing="0" cellpadding="0" border="0" style="width:100%">
			   <thead>
			     <tr>
			       <th><input type="checkbox" name="selAll" onclick='normalSelAll(this,"selectedDelayTask")' ></th>
			       <th class="b tx">{#task#}</th>
			       <th class="b tx">{#status#}</th>
			       <th class="b tx">{#end#}</th>
			       <th class="b tx">{#assignto#}</th>
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
			             <td>{$tasks[tk].user}</td>

			           </tr>
			     {/section}
			   </tbody>
			 </table>
			 <!-- end tasks table-->
		</div>
	</div>
</div>
  

{/foreach}



{*tkument table*}


