<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#phasename#}</label>
  <input id="newPhaseName"></input>
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

{literal}
  <script type="text/javascript">
    
    function delDeliverableItem(arg){
      var b = $(arg);
      b.parentNode.parentNode.remove();
    }
    function addDeliverableItem(){
      var templateStr= '<tr class="newDeliverableItem"><td><input value = ""></input></td><td><input value = ""></input></td><td><input value = ""></input></td><td><a class="tool_del" href="javascript:void(0);"onclick="delDeliverableItem(this);"></a></td></tr>';
      var tRoot = $("deliverableItemTbody");
      tRoot.insert(templateStr);  
    }
      
    function savePhase(){
      var theUrl = "manageprojectajax.php";
      var thePost = "action=addPhase&projectId="+__projectId;
      var phaseName = $("newPhaseName").value;
      thePost +="&phaseName="+phaseName;
      var newItems =$$("tr.newDeliverableItem");
      var newItemsStr="";
      newItems.each(function(tr){
        var children=tr.childElements();
        newItemsStr +=""+children[0].firstChild.value+":"+children[1].firstChild.value+":"+children[2].firstChild.value+","
      });
      thePost +="&newDeliverableItems="+ newItemsStr.substr(0,newItemsStr.length-1);
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
      
      
  </script>
{/literal}