<div class="phaseMenualBar">
  <button id="btnAddPhase">{#addphase#}</button>
</div>
<div id="addPhaseDlg" class="modalContainer">
  {include file="dlgmodal.tpl" templateName="addphase.tpl" title="add phase"}
</div>
<div class="phaseList">
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
        </tr>
      {/section}
      </table>
      </td>
    </tr>
  {/section}
  </table>
</div>

{literal}
<script type="text/javascript">
  if(!window.__addPhaseDlgContent){
    window.__addPhaseDlgContent=$("addPhaseDlg").innerHTML;
    $("addPhaseDlg").remove(); 
  }
  new Control.Modal("btnAddPhase",{
                                "contents":window.__addPhaseDlgContent,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
          
</script>
{/literal}