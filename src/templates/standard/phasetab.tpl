<div class="phaseMenualBar">
  {if $project.status == 9}
  <button id="btnAddPhase">{#addphase#}</button>
  {/if}
</div>
<div id="addPhaseDlg" class="modalContainer">
  {include file="dlgmodal.tpl" templateName="addphase.tpl" title="add phase"}
</div>
<div class="phaseList" id="phaseList">
  {include file = "phasedetails.tpl"}
</div>
<div id = "editPhaseDlg"></div>
<div class="datepick" id = "addPhaseDatePickers"></div>

<script type="text/javascript">
  function bindDatePicker(idx,prefix){literal}{{/literal}
    //insert date picker div
    prefix = prefix || "";
    var pos1 = $(prefix+"deliverItemStartDate-"+idx).positionedOffset();
    var pickEl = document.createElement("div");
    pickEl.setAttribute("id",prefix+"deliverItemStartDatePicker-"+idx);
    pickEl.setAttribute("class","picker");

    var pickers = $("addPhaseDatePickers");
    pickers.insert(pickEl);

    startCal = new calendar({$theM},{$theY});
    startCal.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
    startCal.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
    startCal.relateTo = prefix+"deliverItemStartDate-"+idx;
    startCal.dateFormat = "{$settings.dateformat}";
    startCal.getDatepicker(prefix+"deliverItemStartDatePicker-"+idx);
    pickEl.style.display="none";

    var pickEndEl = document.createElement("div");
    pickEndEl.setAttribute("id",prefix+"deliverItemEndDatePicker-"+idx);
    pickEndEl.setAttribute("class","picker");
    pickers.insert(pickEndEl);

    endCal = new calendar({$theM},{$theY});
    endCal.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
    endCal.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
    endCal.relateTo = prefix+"deliverItemEndDate-"+idx;
    endCal.dateFormat = "{$settings.dateformat}";
    endCal.getDatepicker(prefix+"deliverItemEndDatePicker-"+idx);
    pickEndEl.style.display="none";

  {literal}}{/literal}
</script>


{literal}
<script type="text/javascript">

  function clearDatePickers(){
    $("addPhaseDatePickers").innerHTML="";
  }
  if(!window.__addPhaseDlgContent){
    window.__addPhaseDlgContent=$("addPhaseDlg").innerHTML;
    $("addPhaseDlg").remove(); 
  }
  new Control.Modal("btnAddPhase",{
                                "contents":window.__addPhaseDlgContent,
                                fade:true,
                                beforeOpen:clearDatePickers,
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
  
  function positionDatePicker(){
    $$(".deliverableItem").each(function(tr){
      var children=tr.childElements();
      var startDateEl = children[1].firstChild;
      var endDateEl = children[2].firstChild;
      var sPos = Element.positionedOffset($(startDateEl.id));
      var ePos = Element.positionedOffset($(endDateEl.id));
      var _ids = startDateEl.id.split('-');
      var sPicker = $(_ids[0]+"-deliverItemStartDatePicker-"+_ids[2]);
      var ePicker = $(_ids[0]+"-deliverItemEndDatePicker-"+_ids[2]);
      sPicker.style.left = sPos[0]+'px';
      sPicker.style.top = sPos[1]+'px';
      ePicker.style.left = ePos[0]+'px';
      ePicker.style.top = ePos[1]+'px';
    });
  }  
    
  function showPhaseDlg(ctx){
    $("addPhaseDatePickers").innerHTML="";
    
    var dlg = new Control.Modal("editPhaseDlg",{
                                "contents":ctx,
                                fade:true,
                                beforeOpen:clearDatePickers,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
   dlg.open();
   setTimeout(positionDatePicker,1000);      
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
    var count = $$(".newDeliverableItem").length;
    var templateStr= '<tr class="newDeliverableItem"><td><input id = "deliverItemName-'+count+'" value = ""></input></td><td><input id = "deliverItemStartDate-'+count+'" value = ""></input></td><td><input id = "deliverItemEndDate-'+count+'" value = ""></input></td><td><a class="tool_del" href="javascript:void(0)" onclick="delDeliverableItem(this);"></a></td></tr>';
    var tRoot = $("deliverableItemTbody");
    tRoot.insert(templateStr); 
    bindDatePicker(count); 
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