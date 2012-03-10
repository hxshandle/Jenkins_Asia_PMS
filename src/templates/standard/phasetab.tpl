<div class="phaseMenualBar">
  <button id="btnAddPhase">{#addphase#}</button>
</div>
<div id="addPhaseDlg" class="modalContainer">
  {include file="dlgmodal.tpl" templateName="addphase.tpl" title="add phase"}
</div>
<div class="phaseList" id="phaseList">
  {include file = "phasedetails.tpl"}
</div>
<div id = "editPhaseDlg"></div>

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
                               
  function reloadPhase(){
    var theUrl = "manageprojectajax.php?action=reloadphase&id="+__projectId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
            $("phaseList").innerHTML=payload.responseText;
          }
        }
      });
  }
    
  function delPhase(id){
    var phaseId = id;
    var theUrl = "manageprojectajax.php?action=delphase&id="+phaseId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText == "Ok"){ 
          reloadPhase();
        }else{
          alert("del faild");
        }
      }
    });
  }
    
    
  function showPhaseDlg(ctx){
    var dlg = new Control.Modal("editPhaseDlg",{
                                "contents":ctx,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
   dlg.open();      
  }  
  
  function showEditPhaseDlg(id){
    var phaseId = id;
    var theUrl = "manageprojectajax.php?action=editPhase&id="+phaseId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
          showPhaseDlg(payload.responseText);
        }else{
          alert("del faild");
        }
      }
    });  
  }
    function addDeliverableItem(){
      var templateStr= '<tr class="newDeliverableItem"><td><input value = ""></input></td><td><input value = ""></input></td><td><input value = ""></input></td><td><a class="tool_del" href="javascript:void(0)" onclick="delDeliverableItem(this);"></a></td></tr>';
      var tRoot = $("deliverableItemTbody");
      tRoot.insert(templateStr);  
    }
              
</script>
{/literal}