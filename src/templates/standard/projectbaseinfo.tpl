			<div class="headline">
				<a href="javascript:void(0);" id="projectbaseinfo_toggle" class="win_block" onclick = "toggleBlock('projectbaseinfo');"></a>

				<div class="wintools">
					<div class = "progress" id = "progress" style = "display:none;">
						<img src = "templates/standard/images/symbols/loader-cal.gif" />
					</div>
				</div>
				<h2>
					<img src="./templates/standard/images/symbols/projects.png" alt="" />{#project#}
				</h2>
			</div>
<div  id ="projectbaseinfo" class="block_in_wrapper">
	<h2>{#editproject#}</h2>
	<form class="main" method="post" action="manageproject.php?action=edit&amp;id={$project.ID}" {literal}onsubmit="return validateCompleteForm(this,'input_error');"{/literal}>
    <fieldset>

	    <div class="row4">
        <label for="name">{#name#}:</label>
        <input type="text" class="text" disabled name="name" id="name" required="1" realname="{#name#}" value = "{$project.name}" />
        <label for="status">{#status#}:</label>
        <select id = "projectStatus" name ="projectStatus">
          <option value = "planning">planning</option>
        </select>
      </div>

	    <div class="row4">
        <label for="projectLevel">{#projectLevel#}:</label>
        <select id = "projectLevel" name ="projectLevel">
          <option value = "A">A-All New</option>
        </select>
        <label for="projectPriority">{#projectPriority#}:</label>
        <select id = "projectPriority" name ="projectPriority">
          <option value = "1">1</option>
        </select>
      </div>

    </fieldset>
  </form>
</div>
