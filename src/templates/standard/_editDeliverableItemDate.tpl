{config_load file=lng.conf section = "strings" scope="global" }
<h3>{$name}</h3>
<input type="hidden" id="updateDeliverableItemId" value="{$id}">
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#startDate#}</label>
  <input id="newStartDate" value="{$start_date|truncate:"10":""}">
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#endDate#}</label>
  <input id="newEndDate" value="{$end_date|truncate:"10":""}">
</div>
<div>
  <button id="dlgBtnSavePhase" onclick="J.updateDeliverableItemDate()">Save</button>
</div>