<div class="tabswrapper">

<ul class="tabs">
    
		  <li class="desk"><a {if $desktab == "active" }class="active"{/if} href="index.php"><span>{#desktop#}</span></a></li>
    {if $smarty.session.userRole != "7" && $smarty.session.userRole != "8" && $smarty.session.userRole != "9"}  
		  <li class="projects"><a {if $projectstab == "active" }class="active"{/if} href="myprojects.php"><span>{#myprojects#}</span></a></li>
    {/if}		
		<li class="tasks"><a {if $taskstab == "active" }class="active"{/if} href="mytasks.php"><span>{#mytasks#}</span></a></li>	
		<li class="msgs"><a {if $msgstab == "active" }class="active"{/if} href="managemessage.php?action=mymsgs"><span>{#mymessages#}</span></a>
        {if $smarty.session.userRole != "9" && $smarty.session.userRole != "8" && $smarty.session.userRole != "7"}
		<li class="document"><a {if $documenttab == "active" }class="active"{/if} href="managedocument.php?action=mydocument"><span>{#mydocuments#}</span></a>
        {/if}
    {if $smarty.session.userRole != "5" && $smarty.session.userRole != "8" && $smarty.session.userRole != "9" && $smarty.session.userRole != "7"}  
		  <li class="msgs"><a {if $ordertab == "active" }class="active"{/if} href="manageorder.php?action=myorder"><span>{#order#}</span></a>
    {/if}
    {if $smarty.session.userRole != "7" && $smarty.session.userRole != "8" && $smarty.session.userRole != "9"}  
    <li class="msgs"><a {if $ecntab == "active" }class="active"{/if} href="manageecn.php?action=showecn"><span>{#ecnname#}</span></a>
    {/if}
    {if $smarty.session.userRole == 1 || $smarty.session.userRole == 3 || $smarty.session.userRole == 6 || $smarty.session.userRole == 5 }
    <li class="msgs"><a {if $qualitystab == "active" }class="active"{/if} href="managequality.php?action=showproject&amp;id={$project.ID}"><span>{#quality#}</span></a></li>
    {/if}

    {if $smarty.session.userRole < 6}
        <li class="msgs"><a {if $delaytasktab == "active" }class="active"{/if} href="managedelaytasks.php?action=showdelaytasks"><span>{#delaytasks#}</span></a></li>
    {/if}				
	</ul>
</div>
