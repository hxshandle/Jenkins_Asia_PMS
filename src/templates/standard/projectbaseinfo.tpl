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
	<form class="main" id = "projectbaseinfoform" name="projectbaseinfoform" {literal}onsubmit="return validateCompleteForm(this,'input_error');"{/literal}>
    <fieldset {if !$editBaseInfo} disabled {/if}>
	    <div class="row4">
        <label for="projectName">{#name#}:</label>
        <input type="text" class="text" disabled name="projectName" id="projectName" required="1" realname="{#name#}" value = "{$project.name}" />
        <label for="status">{#status#}:</label>
        <select id = "projectStatus" name ="projectStatus">
          {section name = idx loop=$projectStatus}
            {if $projectStatus[idx].id == $project.status}
              <option selected value = "{$projectStatus[idx].id}">{dispstatus statusId=$projectStatus[idx].id}</option>
            {else}
              <option value = "{$projectStatus[idx].id}">{dispstatus statusId=$projectStatus[idx].id}</option>
            {/if}
          {/section}
        </select>
      </div>

	    <div class="row4">
        <label for="projectLevel">{#projectLevel#}:</label>
        <select id = "projectLevel" name ="projectLevel">
          {section name = idx loop=$projectLevels}
            {if $projectLevels[idx].id == $project.level}
              <option selected value = "{$projectLevels[idx].id}">{$projectLevels[idx].value}</option>
            {else}
              <option value = "{$projectLevels[idx].id}">{$projectLevels[idx].value}</option>
            {/if}
          {/section}
        </select>
        <label for="projectPriority">{#projectPriority#}:</label>
        <select id = "projectPriority" name ="projectPriority">
          {section name = idx loop=$projectPrioritys}
            {if $projectPrioritys[idx].id == $project.prioity}
              <option selected value = "{$projectPrioritys[idx].id}">{$projectPrioritys[idx].value}</option>
            {else}
              <option value = "{$projectPrioritys[idx].id}">{$projectPrioritys[idx].value}</option>
            {/if}
          {/section}
        </select>
      </div>

      <div class="row4">
        <label for="customer">{#customer#}</label>
        <input type="text" class="text" name="customer" id="customer" required="1" realname="{#customer#}" value = "{$project.customer_name}" />
        <label for="supplier">{#supplier#}</label>
        <input type="text" class="text" name="supplier" id="suppler" realname="{#supplier#}" value = "{$project.supplier}" />
      </div>


      <div class="row4">
        <label for="targetFOB">{#targetFOB#}</label>
        <input type="text" class="text number targetfob" name="targetFOB" id="targetFOB"  realname="{#targetFOB#}" value = "{$project.target_fob}" regexp="{literal}\d+{/literal}" />
        <select id = "targetFOBCurrency" name="targetFOBCurrency" class="currency">
          {section name=curr loop=$currency}
            {if $currency[curr] == $project.target_fob_currency}
              <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
            {else}
              <option value="{$currency[curr]}">{$currency[curr]}</option>
            {/if}
          {/section}
        </select>
        <label>{#forecastedAnnualQuality#}</label>
          <table cellpadding=0 cellspacing=0 class="forecastedAnnualQualityAddTable">
          <tr>
            <th>{#year1#}</th>
            <th>{#year2#}</th>
            <th>{#year3#}</th>
          </tr>
          <tr>
            <td><input type = "text" class="text forecastedAnnualQuality" name = "forecastedAnnualQuality1" id = "forecastedAnnualQuality1" value = "{$project.forecasted_annual_quantity_1}"></td>
            <td><input type = "text" class="text forecastedAnnualQuality" name = "forecastedAnnualQuality2" id = "forecastedAnnualQuality2" value = "{$project.forecasted_annual_quantity_2}"></td>
            <td><input type = "text" class="text forecastedAnnualQuality" name = "forecastedAnnualQuality3" id = "forecastedAnnualQuality3" value = "{$project.forecasted_annual_quantity_3}"></td>
          </tr>
        </table>
      </div>
   
      <div class="row4">
        <label for="start">{#startDate#}:</label>
        <input type="text" class="text" name="start"  id="start"  realname="{#startDate#}" regexp="{literal}\d{4}-\d{2}-\d{2}{/literal}" value="{$project.start_date|truncate:10:""}"/>
        <label for="end">{#due#}:</label>
        <input type="text" class="text" name="endDate"  id="endDate"  realname="{#due#}" regexp="{literal}\d{4}-\d{2}-\d{2}{/literal}" value="{$project.end_date|truncate:10:""}"/>
      </div>
      
      <div class="datepick">
        <div id = "start_date_picker" class="picker row4pickerLeft" style = "display:none;"></div>
      </div>
      <div class="datepick">
        <div id = "end_date_picker" class="picker row4pickerRight" style = "display:none;"></div>
      </div>
          
		<script type="text/javascript">
		  endCal = new calendar({$theM},{$theY});
			endCal.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
			endCal.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
			endCal.relateTo = "endDate";
			endCal.dateFormat = "{$settings.dateformat}";
			endCal.getDatepicker("end_date_picker");
      
      startCal = new calendar({$theM},{$theY});
			startCal.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
			startCal.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
			startCal.relateTo = "start";
			startCal.dateFormat = "{$settings.dateformat}";
			startCal.getDatepicker("start_date_picker");
		</script>      
      
      
          
      <div class="row4">
        <label for="customerLeader">{#customerLeader#}</label>
        <input type="text" class="text" name="customerLeader" id="customerLeader" required="1" realname="{#customerLeader#}" value = "{$project.customer_leader_name}" /><input id="customerLeaderId" name="customerLeaderId" value = "{$project.customer_leader}" type="hidden"/>
        
        <label for="projectLeader">{#projectLeader#}</label>
        <input type="text" class="text" name="projectLeader" id="projectLeader" realname="{#projectLeader#}" value = "{$project.project_leader_name}" /><input id="projectLeaderId" name="projectLeaderId" value = "{$project.project_leader}" type="hidden"/>
      </div>
      
      <div class="row4">
        <label for="supplierLeader">{#supplierLeader#}</label>
        <input type="text" class="text" name="supplierLeader" id="supplierLeader" realname="{#supplierLeader#}" value = "{$project.supplier_leader_name}" /><input id="supplierLeaderId" name = "supplierLeaderId" value = "{$project.supplier_leader}" type="hidden" />
      </div>      
       <div id="autoCompChoice" class="autoComp"></div>

    </fieldset>
    <div class="phaseMenualBar">
      {if $editBaseInfo}
      {*project in planning*}
      <a class= "butn_link" id="btnSaveProject" onclick="saveBaseInfo();" href="javascript:void(0)">{#save#}</a>
      {/if}
    </div>
  </form>
</div>
      
{literal}
  <script type="text/javascript">
    function setProjectLeaderId(text,li){
      $("projectLeaderId").value=li.id;
    }
    function setCustomerLeaderId(text,li){
      $("customerLeaderId").value=li.id;
    }
    function setSupplierLeaderId(text,li){
      $("supplierLeaderId").value=li.id;
    }
    new Ajax.Autocompleter('customerLeader', 'autoCompChoice', 'managepeoplesearch.php?action=findUser', {paramName:'query',minChars: 2,afterUpdateElement : setCustomerLeaderId});
    new Ajax.Autocompleter('projectLeader', 'autoCompChoice', 'managepeoplesearch.php?action=findUser', {paramName:'query',minChars: 2,afterUpdateElement : setProjectLeaderId});
    new Ajax.Autocompleter('supplierLeader', 'autoCompChoice', 'managepeoplesearch.php?action=findUser', {paramName:'query',minChars: 2,afterUpdateElement : setSupplierLeaderId});

    function saveBaseInfo(){
      var theUrl = "manageprojectajax.php";
      var projectName=$("projectName").value;
      var thePost ="action=updateProject&id=" + __projectId + "&name=" + projectName + "&" + $("projectbaseinfoform").serialize();
      new Ajax.Request(theUrl, {
        method: 'post',
        postBody:thePost,
        onSuccess:function(payload) {
          if (payload.responseText == "Ok"){
            alert("saved");
          }
        }
      });
    }
  </script>
{/literal}  
