{include file="header.tpl" jsload = "ajax" jsload3 = "lightbox" }

{include file="tabsmenue-desk.tpl" }
<div id="content-left">
<div id="content-left-in">
<div class="neutral">

<h1>{#search#}</h1>


			<div class="headline">
				<a href="javascript:void(0);" id="block_tags_toggle" class="win_block" onclick = "toggleBlock('block_tags');"></a>
				
				<h2>
					<img src="./templates/standard/images/symbols/search.png" alt="" />{#results#} ({$num})
				</h2>
			</div>

			<div id="block_tags" class="blockwrapper">
			
				<div class="contenttitle">
					<div class="contenttitle_menue">
						{*place for tool under ne title-icon*}
					</div>
					<div class="contenttitle_in">
						{*place for header-informations*}
					</div>
				</div>
				<div class="content_in_wrapper">
					<div class="content_in_wrapper_in">
						<div class="inwrapper">		
							<ul>
							{section name=obj loop=$result}
								<li>
									{if $members[member].avatar != ""}
										<a class="more" href="javascript:fadeToggle('info_{$members[member].ID}');"></a>
									{/if}
										<img src = "templates/standard/images/symbols/{$result[obj].icon}" alt="" />
									{if $result[obj].type == "file"}
										<a href = "{$result[obj].download_url}" {if $result[obj].imgfile == 1} rel="lytebox[]" {elseif $result[obj].imgfile == 2} rel = "lyteframe[text]" rev="width: 650px; height: 500px;" {/if} title="{$result[obj].name}">{$result[obj].name}</a>
									{elseif $result[obj].name != ""}
										<a href = "{$result[obj].url}" title="{$result[obj].name}">{$result[obj].name}</a>
									{else}
										<a href = "{$result[obj].url}" title="{$result[obj].title}">{$result[obj].title}</a>
									{/if}
								</li>
							{/section} {*lop folder End*}

							</ul>
						</div> {*inwrapper End*}			


										
			</div> {*content_in_wrapper_in End*}

			</div> {*content_in_wrapper End*}
			
			<div class="staterow">
				<div class="staterowin">
					{*place for whatever*}
				</div>
			</div>
				
					
			<div class="tablemenue"></div>
			</div> {*block_tags End*}			
			

<div class="content-spacer"></div>


</div> {*Neutral END*}
</div> {*content-left-in END*}
</div> {*content-left END*}

{include file="sidebar-a.tpl"}
{include file="footer.tpl"}