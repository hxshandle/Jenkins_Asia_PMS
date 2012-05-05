{config_load file=lng.conf section = "strings" scope="global" }
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#phasename#}</label>
  <input id="newPhaseName"></input>
</div>
  <div class="dlgRow">
    <label style="margin:0 50px 0 0">{#parentPhase#}</label>
    <select name="parentPhase" id = "parentPhase">
		  <option value="-1" selected="selected">{#chooseone#}</option>
      {section name = "pPhase" loop = $phaseTab}
        <option value="{$phaseTab[pPhase].ID}">{$phaseTab[pPhase].name}</option>
      {/section}
    </select>
  </div>
  <div class="dlgRow">
    <label style="margin:0 50px 0 0">{#childPhase#}</label>
    <select name="childPhase" id = "childPhase">
		  <option value="-1" selected="selected">{#chooseone#}</option>
      {section name = "cPhase" loop = $phaseTab}
        <option value="{$phaseTab[cPhase].ID}">{$phaseTab[cPhase].name}</option>
      {/section}
    </select>
  </div>
<table cellpadding=0 cellspacing=0 id="deliverableItemTable" style="width:100%">
  <tbody id ="deliverableItemTbody">
  <tr>
    <th>{#name#}</th>
    <th>{#startDate#}</th>
    <th>{#ended#}</th>
    <th></th>
  </tr>
  </tbody>
</table>

<div  style="margin:10px 0 0 0">
<button id="dlgBtnSavePhase" onclick="savePhase();">{#save#}</button>
<button id="dlgBtnAddPhase" onclick="addDeliverableItem();">{#addDeliverableItem#}</button>
</div>


