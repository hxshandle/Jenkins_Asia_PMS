{config_load file=lng.conf section = "strings" scope="global" }
<form id="editQuality" name="editQuality" class="projects" method="post" action="managequality.php?action=saveQuality">
  <input type = "hidden" id="orderId" name = "orderId" value = "{$orderId}"></input>
  <input type = "hidden" id="projectId" name = "projectId" value = "{$projectId}"></input>
  
<div class="dlgRow">
  <label for="project">{#project#}:</label>
  <select name="project" id="project" onchange="onAddQualitySelProjectChange(this)"; required = "1">
    <option value="-1" selected="selected">{#chooseone#}</option>
    {section name=project loop=$projects}
      <option value="{$projects[project].ID}">{$projects[project].name}</option>
    {/section}
  </select>
</div>
<div class="dlgRow">
  <label style="">{#actionNo#}<span style="color:red">*</span></label>
  <input id="actionNo" name="actionNo" value = "{$quality.action_no}"></input>
 </div>
<div class="dlgRow">
  <label style="">{#customerComplianceNo#}</label>
  <input id="qualityNo" name="qualityNo" value = "{$quality.qualityNo}"></input>
 </div>



<div class="dlgRow">
  <label style="">{#issueDate#}<span style="color:red">*</span></label>
  <input id="issueDate" name="issueDate" value = "{$quality.issue_date}"></input>
  <div class="datepick">
    <div id = "issueDatePicker" class="picker" style = "display:none;"></div>
  </div>
 </div>

 <div class="dlgRow">
  <label style="">{#productNo#}<span style="color:red">*</span></label>
  <input id="productNo" name="productNo" value = "{$quality.product_no}"></input>
 </div>

 <div class="dlgRow">
  <label style="">{#productDesc#}<span style="color:red">*</span></label>
  <input id="productDesc" name="productDesc" value = "{$quality.product_desc}"></input>
 </div>
 <div class="dlgRow">
  <label style="">{#shipNo#}<span style="color:red">*</span></label>
  <input id="shipNo" name="shipNo" value = "{$quality.ship_no}"></input>
 </div>
<!--
  <div class="dlgRow">
    <label style="float:left">{#statusUpdate#}<span style="color:red">*</span></label>
    <div style='width:400px'>
      <textarea id="statusUpdate" name="statusUpdate" value = "">{$quality.status_update}</textarea>
    </div>
  </div>
-->
  <div class="dlgRow">
  <label style="">{#lotQuantity#}<span style="color:red">*</span></label>
  <input id="lotQuantity" name="lotQuantity" value = "{$quality.lot_quantity}"></input>
 </div>
  <div class="dlgRow">
  <label style="">{#sampleSize#}</label>
  <input id="sampleSize" name="sampleSize" value = "{$quality.Sample_size}"></input>
 </div>
  <div class="dlgRow">
  <label style="">{#defects#}</label>
  <input id="defects" name="defects" value = "{$quality.defects}"></input>
 </div>
  <div class="dlgRow">
  <label style="">{#rejectRate#}</label>
  <input id="rejectRate" name="rejectRate" value = "{$quality.reject_rate}"></input>%
 </div>

 <div class="dlgRow">
  <label style="">{#quantityInInventory#}</label>
  <input id="quantityInInventory" name="quantityInInventory" value = "{$quality.quantity_in_inventory}"></input>
 </div>

 <div class="dlgRow">
  <label style="">{#quantityInProcess#}</label>
  <input id="quantityInProcess" name="quantityInProcess" value = "{$quality.quantity_in_process}"></input>
 </div>

<div class="dlgRow">
  <label style="">{#containmentDesc#}</label>
  <select id="containmentDesc" name="containmentDesc">
    <option value="sort" {if $quality.containment_desc == 'sort'} selected {/if}>{#sort#}</option>
    <option value="rework" {if $quality.containment_desc == 'rework'} selected {/if}>{#rework#}</option>
    <option value="waier" {if $quality.containment_desc == 'waier'} selected {/if}>{#waier#}</option>
    <option value="scope" {if $quality.containment_desc == 'scope'} selected {/if}>{#scope#}</option>
  </select>
</div>
 
<div class="dlgRow">
  <label style="">{#acknowledgeBy#}</label>
  <input id="acknowledgeBy" name="acknowledgeBy" value = "{$quality.acknowledge_by}"></input>
</div>
 
<div class="dlgRow">
  <label style="">{#acknowledgeDate#}</label>
  <input id="acknowledgeDate" name="acknowledgeDate" value = "{$quality.acknowledge_date}"></input>
  <div class="datepick">
    <div id = "acknowledgeDatePicker" class="picker" style = "display:none;"></div>
  </div>
</div>

<div class="dlgRow">
  <label style="">{#verifiedForClosureBy#}</label>
  <input id="verifiedForClosureBy" name="verifiedForClosureBy" value = "{$quality.verified_for_closure_by}"></input>
</div>

<div class="dlgRow">
  <label style="">{#verificationDate#}</label>
  <input id="verificationDate" name="verificationDate" value = "{$quality.verification_date}"></input>
  <div class="datepick">
    <div id = "verificationDatePicker" class="picker" style = "display:none;"></div>
  </div>
</div>

<div class="dlgRow">
  <label style="">{#notify#}</label>
  <div id="notify-outer"> </div>
</div>

  <input type="hidden" id ="qMode" name="qMode" value = "{$mode}"></input>
  <input type = "hidden" id ="qId" name="qId" value = "{$qId}"></input>
<div  style="margin:10px 0 0 0">
  <button id="dlgBtnSaveQuality" type="submit">{#save#}</button>
</div>
</form>

<script>
  var _acknowledgeDate = "{$quality.verification_date}";
  var _verificationDate = "{$quality.verification_date}";
{literal}
  function bindDateOPicker(relateTo,target){
{/literal}
    
    theCal = new calendar({$theM},{$theY});
    theCal.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
    theCal.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
    theCal.relateTo = relateTo;
    theCal.dateFormat = "{$settings.dateformat}";
    theCal.getDatepicker(target);

{literal}
  }
  (function(){
    bindDateOPicker('issueDate','issueDatePicker');
    bindDateOPicker('acknowledgeDate','acknowledgeDatePicker');
    bindDateOPicker('verificationDate','verificationDatePicker');
    if(_acknowledgeDate =="") $("acknowledgeDate").value="";
    if(_verificationDate =="") $("verificationDate").value="";
  })();
{/literal}
</script>


