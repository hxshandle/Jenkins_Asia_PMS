{config_load file=lng.conf section = "strings" scope="global" }

{foreach from=$groupedTasks key=pname item=phase name=p}

<div class='document' style="margin-bottom:12px;">
	<div class="projects">
        {if not $isPDF}
            <div class="headline">
                <a id="delaytaskhead_toggle" class="win_block" onclick="toggleBlock('delaytaskhead-{$smarty.foreach.p.index}');" href="javascript:void(0);"></a>
                <h2><img alt="" src="./templates/standard/images/symbols/projects.png">{$pname}</h2>
            </div>
        {else}
                <h2>{$pname}</h2>
        {/if}

		<div id="delaytaskhead-{$smarty.foreach.p.index}" class="block" style="margin-top:0">
			 <!-- start tasks table-->
			{foreach from=$phase key=phaseName item=deliverable name=pp}
                {if not $isPDF}
				    <h1 style="padding:10px 0 0 10px;width:auto;color:#fff;background:#95A5A6;">Active Phase: {$phaseName}</h1>
                {else}
                    <h1 style="padding:0 0 0 10px;width:auto;">Active Phase: {$phaseName}</h1>
                {/if}
				{foreach from=$deliverable key=deliverableName item=tasks name=pd}
                    {if not $isPDF}
                        <h2 style="padding:10px 0px 10px 12px;color:#fff;background:#95A5A6;margin-bottom:0;">Deliverable: {$deliverableName}</h2>
                    {else}
                        <h2 style="padding:0 0px 10px 12px;">Deliverable: {$deliverableName}</h2>
                    {/if}
					<table id="delatyTaskTable" cellspacing="0" cellpadding="0" border="0" style="width:100%;margin-bottom:8px;border:1px solid #aaa;">
					   <thead>
					     <tr>
                           {if not $isPDF}
					       <th><input type="checkbox" name="selAll" onclick='normalSelAll(this,"selectedDelayTask")' ></th>
                           {/if}
					       <th class="b tx">{#task#}</th>
                 <th class="b tx">{#status#}</th>
					       <th class="b tx">{#latest_update#}</th>
					       <th class="b tx">{#end#}</th>
					       <th class="b tx" style="border-right:1px solid #aaa;">{#assignto#}</th>
					     </tr>
					   </thead>
					   <tbody id="tkumentTBody">
					     {section name=tk loop=$tasks}
					     		 {assign var='cStyle' value=''}
					     		 {if $tasks[tk].status == 47}
					     		 	{assign var='cStyle' value='color:red'}
					     		 {/if}
					         {if $smarty.section.tk.index % 2 == 0}
					           <tr class="color-a" style="{$cStyle}">
					         {else}
					           <tr class ="color-b" style="{$cStyle}">
					         {/if}
                             {if not $isPDF}
					             <td><input type="checkbox" name="selectedDelayTask" value = "{$tasks[tk].ID}"/></td>
                             {/if}
					             <td><a style="{$cStyle}" target="_blank" href="managetask.php?action=showtask&tid={$tasks[tk].ID}&id={$tasks[tk].project}">{$tasks[tk].title}</a></td>
                       <td>{dispstatus statusId =$tasks[tk].status}</td>
					             <td>{$tasks[tk].last_comment.comment}</td>
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


