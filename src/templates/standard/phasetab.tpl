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
      
      
  function updatePhase(id){
    var newItems =$$("tr.newDeliverableItem");
    var newItemsStr="";
    newItems.each(function(tr){
        var children=tr.childElements();
        newItemsStr +=""+children[0].firstChild.value+":"+children[1].firstChild.value+":"+children[2].firstChild.value+","
      });
    newItemsStr = newItemsStr.substr(0,newItemsStr.length-1);
        
    var updatedItem = $$("tr.deliverableItem");
    var updatedItemsStr="";
    updatedItem.each(function(tr){
        var children=tr.childElements();
        updatedItemsStr +=""+children[0].lastChild.value+":"+children[0].firstChild.value+":"+children[1].firstChild.value+":"+children[2].firstChild.value+","
      });
    updatedItemsStr = updatedItemsStr.substr(0,updatedItemsStr.length-1);
    
    var theUrl = "manageprojectajax.php";
    var thePost = "action=updatePhase&projectId="+__projectId+"&id="+id+"&newItems="+newItemsStr+"&updatedItems="+updatedItemsStr;
    new Ajax.Request(theUrl, {
            method: 'post',
            postBody:thePost,
            onSuccess:function(payload) {
              if (payload.responseText == "Ok"){
                reloadPhase();
                Control.Modal.close();
              }
            }
        });
  }
    
  function delDeliverableItemViaAjax(id,el){
    var element=el;
    var theUrl = "manageprojectajax.php?action=delDeliverableItem&&id="+id;
    new Ajax.Request(theUrl, {
            method: 'get',
            onSuccess:function(payload) {
              if (payload.responseText == "Ok"){
                reloadPhase();
                var b = $(element);
                b.parentNode.parentNode.remove();
              }
            }
        });    
  }
              
</script>
{/literal}