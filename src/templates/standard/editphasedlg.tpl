{config_load file=lng.conf section = "strings" scope="global" }
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#phasename#}</label>
  <input id="newPhaseName" value = "{$phase.name}"></input>
 </div>
  <div class="dlgRow">
    <label style="margin:0 50px 0 0">{#parentPhase#}</label>
    <select name="parentPhase" id = "parentPhase">
      <option value="-1" {if $phase.parentPhase == "-1"}selected="selected"{/if}>{#chooseone#}</option>
      {section name = "pPhase" loop = $phaseTab}
        {if $phase.ID != $phaseTab[pPhase].ID}
          <option value="{$phaseTab[pPhase].ID}" {if $phase.parentPhase == $phaseTab[pPhase].ID}selected="selected"{/if}>{$phaseTab[pPhase].name}</option>
        {/if}
      {/section}
    </select>
  </div>
  <div class="dlgRow">
    <label style="margin:0 50px 0 0">{#childPhase#}</label>
    <select name="childPhase" id = "childPhase">
      <option value="-1" {if $phase.childPhase=="-1"}selected="selected"{/if}>{#chooseone#}</option>
      {section name = "cPhase" loop = $phaseTab}
        {if $phase.ID != $phaseTab[cPhase].ID}
          <option value="{$phaseTab[cPhase].ID}" {if $phase.childPhase == $phaseTab[cPhase].ID}selected="selected"{/if}>{$phaseTab[cPhase].name}</option>
        {/if}
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
  {section name=p loop=$deliverableItem}
    <tr class="deliverableItem">
      <td><input value = "{$deliverableItem[p].name}"></input><input type ="hidden" value = "{$deliverableItem[p].ID}"></input></td>
      <td><input id = "exist-deliverItemStartDate-{$smarty.section.p.index}" value = "{$deliverableItem[p].start_date|truncate:"10":""}"></input></td>
      <td><input id = "exist-deliverItemEndDate-{$smarty.section.p.index}" value = "{$deliverableItem[p].end_date|truncate:"10":""}"></input></td>
      <td><a class="tool_del" href="javascript:void(0)" onclick="delDeliverableItemViaAjax({$deliverableItem[p].ID},this);"></a></td>
    </tr>
  {/section}
  </tbody>
</table>
<div  style="margin:10px 0 0 0">
<button id="dlgBtnSavePhase" onclick="updatePhase({$phase.ID});">{#save#}</button>
<button id="dlgBtnAddPhase" onclick="addDeliverableItem();">{#addDeliverableItem#}</button>
</div>
<script>
(function(){literal}{{/literal}
  var __len = parseInt({$smarty.section.p.total});
  for (var i = 0 ; i < __len ; i++){literal}{{/literal}
    bindDatePicker(i,'exist-');
  {literal}}{/literal}

{literal}}{/literal})();
</script>