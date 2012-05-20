<div class="phaseMenualBar">
  <button id="btnAddPhase" onclick="showAddQualityDlg('add')">{#addphase#}</button>
</div>

<div class="qualityList dataTable" id="qualityList">
  {include file = "qualitylist.tpl"}
</div>
<div id = "editQuailtyDlg"></div>
<div class="datepick" id = "editQualityDatePickers"></div>

{literal}
<script>
  function showQualityDlg(ctx){
    //$("editQualityDatePickers").innerHTML="";
    
    var dlg = new Control.Modal("editQuailtyDlg",{
                                "contents":ctx,
                                fade:true,
                                beforeOpen:clearDatePickers,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
   dlg.open();
   //setTimeout(editQualityDatePickers,1000);      
  }

  function showAddQualityDlg(mode){

    var theUrl = "manageprojectajax.php?action=getAddQualityDlgContent&projectId="+__projectId+"&mode="+mode;
    new Ajax.Request(theUrl, {
      method: 'get',
      onSuccess:function(payload) {
        if (payload.responseText != ""){ 
          showPhaseDlg(payload.responseText);
        }else{
          alert("faild");
        }
      }
    });
  }

function reloadQuality(){
  alert("reloadQuality");
} 
function saveQuality(){
  var __mode = $("qMode").value;
  var _qId = $("qId").value;
  var theUrl = "manageprojectajax.php";
  var thePost = "action=saveQuality&projectId="+__projectId+"&mode="+__mode;
  if(__mode == "edit"){
    thePost += "&qId="+__qId;
  }
  thePost += "&"+$("editQuality").serialize();

  new Ajax.Request(theUrl, {
  method: 'post',
  postBody:thePost,
  onSuccess:function(payload) {
    if (payload.responseText == "Ok"){ 
        reloadQuality();
        Control.Modal.close();
      }
    }
  });
}
</script>
{/literal}