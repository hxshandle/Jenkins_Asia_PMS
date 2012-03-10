  <table style="width: 100%" cellspadding=0 cellspacing=0>
  {section name = phase loop = $phaseTab}
    <tr>
      <td>{$phaseTab[phase].name}</td>
      <td>
        <table style="width:100%">
      {section name =deliverable loop=$phaseTab[phase].deliverableItems}
        <tr>
          <td>{$phaseTab[phase].deliverableItems[deliverable].name}</td>
          {capture name=st assign=stname}
            {dispstatus statusId =$phaseTab[phase].deliverableItems[deliverable].status}
          {/capture}
          
          <td>{eval var=$stname}</td>
          <td>{$phaseTab[phase].deliverableItems[deliverable].start_date|truncate:"10":""}</td>
          <td>{$phaseTab[phase].deliverableItems[deliverable].end_date|truncate:"10":""}</td>
          <td>{$phaseTab[phase].deliverableItems[deliverable].end_date|truncate:"10":""}</td>
        </tr>
      {/section}
      </table>
      </td>
      <td>
        <a class="tool_edit" title="{#edit#}" href=javascript:void(0);" onclick="showEditPhaseDlg({$phaseTab[phase].ID});"></a>
        <a class="tool_del" href="javascript:void(0);"onclick="delPhase({$phaseTab[phase].ID});"></a>
      </td>
    </tr>
  {/section}
  </table>