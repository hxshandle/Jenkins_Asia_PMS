<div class="block_in_wrapper">
<h2>{#addproject#}</h2>

	<form class="main" method="post" action="admin.php?action=addpro" {literal}onsubmit="return validateCompleteForm(this);"{/literal} >
	<fieldset>
		<div class="row"><label for="name">{#name#}:</label><input type="text" class="text" name="name" id="name" required="1" realname="{#name#}" /></div>
		<div class="row"><label for="desc">{#description#}:</label><div class="editor"><textarea name="desc" id="desc"  rows="3" cols="1" ></textarea></div></div>

	    <div class="clear_both_b"></div>

    <div class = "row">
      <label for="start">{#startDate#}:</label>
      <input type="text" class="text" name="start"  id="start"  realname="{#startDate#}" regexp="{literal}\d{4}-\d{2}-\d{2}{/literal}" />
    </div>
    <div class="datepick">
			<div id = "start_date_picker" class="picker" style = "display:none;"></div>
		</div>
    
		<div class="row">
		<label for="end">{#due#}:</label>
		<input type="text" class="text" name="end"  id="end"  realname="{#due#}" regexp="{literal}\d{4}-\d{2}-\d{2}{/literal}" />
		</div>

		<div class="datepick">
			<div id = "add_project" class="picker" style = "display:none;"></div>
		</div>


		<script type="text/javascript">
		  theCal = new calendar({$theM},{$theY});
			theCal.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
			theCal.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
			theCal.relateTo = "end";
			theCal.dateFormat = "{$settings.dateformat}";
			theCal.getDatepicker("add_project");
      
      startCal = new calendar({$theM},{$theY});
			startCal.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
			startCal.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
			startCal.relateTo = "start";
			startCal.dateFormat = "{$settings.dateformat}";
			startCal.getDatepicker("start_date_picker");
		</script>
    
    <div class="row">
      <label for="projectLevel">{#projectLevel#}:</label>
      <select id ="projectLevel" name = "projectLevel">
        <option selected value="A">{#projectLevelA#}</option>
        <option value="B">{#projectLevelB#}</option>
        <option value="C">{#projectLevelC#}</option>
      </select>
		</div>
    
    <div class="row">
      <label for="projectPriority">{#projectPriority#}:</label>
      <select id ="projectPriority" name = "projectPriority">
        <option selected value="1">1</option>
        <option value="1">2</option>
        <option value="1">3</option>
        <option value="1">4</option>
        <option value="1">5</option>
      </select>
		</div>
      
    <div class="row">
      <label for="customer">{#customer#}:</label>
      <input type="text" class="text" name="customer"  id="customer"  realname="{#customer#}" />
		</div>
    <div class="row">
      <label for="supplier">{#supplier#}:</label>
      <input type="text" class="text" name="supplier"  id="supplier"  realname="{#supplier#}" />
		</div>
      
		<div class = "row">
		  <label for = "targetFOB">{#targetFOB#}:</label>
      <input type = "text" class="text" style="width:237px;text-align: right" name = "targetFOB" id = "targetFOB" />
      <select id="targetFOBCurrentcy" name="targetFOBCurrentcy" style="margin:0 0 0 10px;width:60px">
        <option selected value="RMB">RMB</option>
        <option value="USD">USD</option>
        <option value="EUD">EUD</option>
      </select>
		</div>
      
 		<div class = "row">
		  <label for = "forecastedAnnualQuality">{#forecastedAnnualQuality#}:</label>
      <table cellpadding=0 cellspacing=0 class="forecastedAnnualQualityAddTable">
        <tr>
          <th>{#year1#}</th>
          <th>{#year2#}</th>
          <th>{#year3#}</th>
        </tr>
        <tr>
          <td><input type = "text" class="text" name = "forecastedAnnualQuality1" id = "forecastedAnnualQuality1" value = "0"></td>
          <td><input type = "text" class="text" name = "forecastedAnnualQuality2" id = "forecastedAnnualQuality2" value = "0"></td>
          <td><input type = "text" class="text" name = "forecastedAnnualQuality3" id = "forecastedAnnualQuality3" value = "0"></td>
        </tr>
      </table>
		</div>
		<div class = "row">
		  <label for = "projectLeader">{#projectLeader#}:</label>
      <input type = "text" class="text" name = "projectLeader" id = "projectLeader" /><a class="add" href="#">{#add#}</a>
		</div>
		<div class = "row">
		  <label for = "customerLeader">{#customerLeader#}:</label>
		  <input type = "text" class="text" name = "customerLeader" id = "customerLeader" /><a class="add" href="#">{#add#}</a>
		</div>
		<div class = "row">
		  <label for = "supplierLeader">{#supplierLeader#}:</label>
      <input type = "text" class="text" name = "supplierLeader" id = "supplierLeader" /><a class="add" href="#">{#add#}</a>
		</div>
		<div class="row"><label>{#members#}:</label>
		<div style="float:left;">
        {section name=user loop=$users}
	        <div class="row">
	        <input type="checkbox" class="checkbox" value="{$users[user].ID}" name="assignto[]" id="{$users[user].ID}"  {if $users[user].ID == $userid} checked="checked"{/if} /><label for="{$users[user].ID}">{$users[user].name}</label><br />
	      	</div>
	    {/section}
	    </div>
		</div>

		<input type="hidden" name="assignme" value="1" />

	    <div class="clear_both_b"></div>

		<div class="row-butn-bottom">
		<label>&nbsp;</label>
		<button type="submit" onfocus="this.blur();">{#addbutton#}</button>
		{if $myprojects == "1"}
		<button type = "reset" onclick="blindtoggle('form_addmyproject');toggleClass('add_myprojects','add-active','add');toggleClass('add_butn_myprojects','butn_link_active','butn_link');toggleClass('sm_myprojects','smooth','nosmooth');return false;" onfocus="this.blur();">{#cancel#}</button>
		{else}
		<button type = "reset" onclick="blindtoggle('form_{$myprojects[project].ID}');return false;">{#cancel#}</button>
		{/if}
		</div>


	</fieldset>
	</form>

</div> {*block_in_wrapper end*}