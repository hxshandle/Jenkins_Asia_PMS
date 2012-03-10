{config_load file=lng.conf section = "strings" scope="global" }
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#phasename#}</label>
  <input id="newPhaseName" value = "{$phase.name}"></input>
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
    <tr class="newDeliverableItem">
      <td><input value = "{$deliverableItem[p].name}"></input></td>
      <td><input value = "{$deliverableItem[p].start_date|truncate:"10":""}"></input></td>
      <td><input value = "{$deliverableItem[p].end_date|truncate:"10":""}"></input></td>
      <td><a class="tool_del" href="javascript:void(0)" onclick="delDeliverableItemViaAjax({$deliverableItem[p].ID});"></a></td>
    </tr>
  {/section}
  </tbody>
</table>
<div  style="margin:10px 0 0 0">
<button id="dlgBtnSavePhase" onclick="updatePhase();">{#save#}</button>
<button id="dlgBtnAddPhase" onclick="addDeliverableItem();">{#addDeliverableItem#}</button>
</div>