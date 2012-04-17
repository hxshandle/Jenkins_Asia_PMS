{config_load file=lng.conf section = "strings" scope="global" }
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#projectname#}</label>
  <label style="margin:0 50px 0 0">{$project.name}</label>
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#samplename#}</label>
  <label style="margin:0 50px 0 0">{$sample.name}</label>
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#totalcount#}</label>
  <input id="editSampleTotalcount" value = "{$sample.total_count}" regexp="{literal}\d+{/literal}"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 23px 0 0">{#availablecount#}</label>
  <input id="editSampleAvailablecount" value = "{$sample.available_count}" regexp="{literal}\d+{/literal}"></input>
</div>
<div  style="margin:10px 0 0 0">
<button id="dlgBtnEditSample" onclick="editSample({$sample.ID});">{#save#}</button>
</div>