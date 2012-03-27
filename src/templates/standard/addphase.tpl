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

    function addPhaseValidator(){
      var ret = true;
      var newPhaseName = $('newPhaseName').value;
      if(newPhaseName.length<1){
        $('newPhaseName').style.border="2px solid red";
        ret = false;
      }
      $$(".newDeliverableItem").each(function(tr){
        var children=tr.childElements();
        var name = children[0].firstChild.value;
        if(name.length <1){
          children[0].firstChild.style.border="2px solid red";
          ret = false;
        }
        var startDate = children[1].firstChild.value;
        var endDate = children[2].firstChild.value;
        startDate = new Date(Date.parse(startDate));
        endDate = new Date(Date.parse(endDate));
        if(startDate > endDate){
          ret = false;
          children[2].firstChild.style.border="2px solid red";
        }
      });
      $$(".deliverableItem").each(function(tr){
        var children=tr.childElements();
        var name = children[0].firstChild.value;
        if(name.length <1){
          children[0].firstChild.style.border="2px solid red";
          ret = false;
        }
        var startDate = children[1].firstChild.value;
        var endDate = children[2].firstChild.value;
        startDate = new Date(Date.parse(startDate));
        endDate = new Date(Date.parse(endDate));
        if(startDate > endDate){
          ret = false;
          children[2].firstChild.style.border="2px solid red";
        }
      });
      
      return ret;
    }

    function savePhase(){
      if(!addPhaseValidator()){
        return;
      }
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