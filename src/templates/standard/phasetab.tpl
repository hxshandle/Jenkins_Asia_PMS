<div class="phaseMenualBar">
  <button id="btnAddPhase">Add Phase</button>
</div>
<div id="addPhaseDlg" class="modalContainer">
  {include file="dlgmodal.tpl" templateName="addphase.tpl" title="add phase"}
</div>
<div class="phaseList">
</div>


<script type="text/javascript">
  var __contents= $("addPhaseDlg").innerHTML;
  new Control.Modal("btnAddPhase",{literal}{
                                "contents":__contents,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             }{/literal});
</script>