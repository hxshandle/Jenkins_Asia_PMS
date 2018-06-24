{config_load file=lng.conf section = "strings" scope="global" }  
<table style="width: 100%" cellspadding=0 cellspacing=0>
  {section name = phase loop = $phaseTab}
    {if $smarty.section.phase.index % 2 == 0}
      <tr class="color-a">
    {else}
      <tr class="color-b">
    {/if}
    
      <td  class="bold center">{$phaseTab[phase].name}</td>
      <td>
        <table style="width:100%">
          <tr class="bold">
            <td>{#deliverableItems#}</td>
             <td>{#status#}</td>
            <td>{#startDate#}</td>
            <td>{#ended#}</td>
          </tr>
      {section name =deliverable loop=$phaseTab[phase].deliverableItems}
        <tr {if $phaseTab[phase].deliverableItems[deliverable].delay}style="color:#BE4C43"{/if}>
          <td>{$phaseTab[phase].deliverableItems[deliverable].name}</td>

          
          <td>{dispstatus statusId =$phaseTab[phase].deliverableItems[deliverable].status}</td>
          <td>{$phaseTab[phase].deliverableItems[deliverable].start_date|truncate:"10":""}</td>
          <td>{$phaseTab[phase].deliverableItems[deliverable].end_date|truncate:"10":""}</td>
        </tr>
      {/section}
      </table>
      </td>
      <td>
        {if $editPhase}
        <a class="tool_edit" title="{#edit#}" href="javascript:void(0);" onclick="showEditPhaseDlg({$phaseTab[phase].ID});"></a>
        {/if}
        {if $project.status ==9 and $smarty.session.userRole < 5 }
        <a class="tool_del" href="javascript:void(0);"onclick="delPhase({$phaseTab[phase].ID});"></a>
        {/if}
      </td>
    </tr>
  {/section}
  </table>