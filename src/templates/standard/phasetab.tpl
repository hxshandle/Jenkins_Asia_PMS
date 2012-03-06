<div class="phaseMenualBar">
  <button id="btnAddPhase">{#addphase#}</button>
</div>
<div id="addPhaseDlg" class="modalContainer">
  {include file="dlgmodal.tpl" templateName="addphase.tpl" title="add phase"}
</div>
<div class="phaseList">
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