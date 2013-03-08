{*Keyboard shortcuts on the project level*}
{literal}
<script type = "text/javascript">

</script>
{/literal}
<div class="tabswrapper">
	<ul class="tabs">
		<li class="projects"><a {if $projecttab == "active" }class="active"{/if} href="manageproject.php?action=showproject&amp;id={$project.ID}"><span>{#project#}</span></a></li>

		<li class="miles"><a {if $milestab == "active" }class="active"{/if} href="managemilestone.php?action=showproject&amp;id={$project.ID}"><span>{#milestones#}</span></a></li>

		<li class="tasks"><a {if $taskstab == "active" }class="active"{/if} href="managetask.php?action=showproject&amp;id={$project.ID}"><span>{#tasklists#}</span></a></li>
		<li class="msgs"><a {if $msgstab == "active" }class="active"{/if} href="managemessage.php?action=showproject&amp;id={$project.ID}"><span>{#messages#}</span></a></li>
		<li class="files"><a {if $filestab == "active" }class="active"{/if} href="managefile.php?action=showproject&amp;id={$project.ID}"><span>{#files#}</span></a></li>
		{if $smarty.session.userRole == 1 || $smarty.session.userRole == 3 || $smarty.session.userRole == 5}
		<li class="user"><a {if $userstab == "active" }class="active"{/if} href="manageuser.php?action=showproject&amp;id={$project.ID}"><span>{#user#}</span></a></li>
		<li class="cal"><a {if $calendartab == "active" }class="active"{/if} href="resourcecalendar.php?action=showproject&amp;id={$project.ID}"><span>{#resourceCal#}</span></a></li>
		{/if}
		{if $smarty.session.userRole <= 6}
		<li class="msgs"><a {if $qualitystab == "active" }class="active"{/if} href="managequality.php?action=showproject&amp;id={$project.ID}"><span>{#quality#}</span></a></li>
		{/if}
		<!--
		<li class="timetrack"><a {if $timetab == "active" }class="active"{/if} href="managetimetracker.php?action=showproject&amp;id={$project.ID}"><span>{#timetracker#}</span></a></li>
		-->
	</ul>
</div>