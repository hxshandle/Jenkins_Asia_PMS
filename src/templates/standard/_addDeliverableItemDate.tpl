{config_load file=lng.conf section = "strings" scope="global" }
<h3>{#addDeliverableItem#}</h3>
<input type="hidden" id="projectId" value="{$id}">

<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#phase#}</label>
  <select id="phaseId">
    {foreach from=$phases item=phase name=foo}
      <option value="{$phase.ID}">{$phase.name}</option>
    {/foreach}
  </select>
</div>

<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#deliverable#}</label>
  <input id="deliverableName" value="">
</div>

<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#startDate#}</label>
  <input id="newStartDate" placeholder="YYYY-MM-DD">
</div>

<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#endDate#}</label>
  <input id="newEndDate" placeholder="YYYY-MM-DD">
</div>

<div>
  <button id="dlgBtnSavePhase" onclick="J.addNewDeliverableItem()">Save</button>
</div>