<div class="phaseMenualBar">
  <button id="btnAddSample">{#addphase#}</button>
</div>
<div id="addSampleDlg" class="modalContainer">
  {include file="dlgmodal.tpl" templateName="addsample.tpl" title="add Sample"}
</div>
<div class="sampleList" id="sampleList">
  {include file = "sampledetails.tpl"}
</div>
<div class="phaseMenualBar">
  <button id="btnAddSampleRequest">{#addsamplerequest#}</button>
</div>
<div id="addSampleRequestDlg" class="modalContainer">
  {include file="dlgmodal.tpl" templateName="addsamplerequest.tpl" title="add Sample Request"}
</div>

<div class="sampleRequestList" id="sampleRequestList">
  {include file = "samplerequestdetails.tpl"}
</div>
<div id = "editsampleDlg"></div>

{literal}
<script type="text/javascript">
  if(!window.__addSampleDlgContent){
    window.__addSampleDlgContent=$("addSampleDlg").innerHTML;
    $("addSampleDlg").remove(); 
  }
  if(!window.__addSampleRequestDlgContent){
    window.__addSampleRequestDlgContent=$("addSampleRequestDlg").innerHTML;
    $("addSampleRequestDlg").remove(); 
  }
  //altert("1"+$("addFinanceDlg").innerHTML);
  new Control.Modal("btnAddSample",{
                                "contents":window.__addSampleDlgContent,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
    new Control.Modal("btnAddSampleRequest",{
                                "contents":window.__addSampleRequestDlgContent,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });                             
  function reloadSample(){
    var theUrl = "manageprojectajax.php?action=reloadsample&id="+__projectId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
            $("sampleList").innerHTML=payload.responseText;
          }
        }
      });
  }
    
  function delSample(id){
    var sampleId = id;
    var theUrl = "manageprojectajax.php?action=delsample&id="+sampleId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText == "Ok"){ 
          reloadSample();
        }else{
          alert("del faild");
        }
      }
    });
  }
    
    
  function showSampleDlg(ctx){
    var dlg = new Control.Modal("editSampleDlg",{
                                "contents":ctx,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
   dlg.open();      
  }  
  
  function showEditSampleDlg(id){
    var sampleId = id;
    var theUrl = "manageprojectajax.php?action=editSample&id="+sampleId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
          showSampleDlg(payload.responseText);
        }else{
          alert("show failed");
        }
      }
    });  
  }
        
     //修改页面的保存js
    function editSample(sampleId){
      var theUrl = "manageprojectajax.php";
      var thePost = "action=updateSample&projectId="+__projectId;
      thePost +="&sampleId="+sampleId;
      var jseditSampleAvailablecount = $("editSampleAvailablecount").value;
      thePost +="&sampleAvailablecount="+jseditSampleAvailablecount;
      var jseditSampleTotalcount = $("editSampleTotalcount").value;    
      thePost +="&sampleTotalcount="+jseditSampleTotalcount;    
      if(jseditSampleAvailablecount*1>jseditSampleTotalcount*1){
          alert('{/literal}{#samplelengthvalidate#}{literal}');
          return;
      }
      new Ajax.Request(theUrl, {
		  method: 'post',
		  postBody:thePost,
		  onSuccess:function(payload) {
		    if (payload.responseText == "Ok"){ 
            reloadSample();
            Control.Modal.close();
          }
        }
      });
    }
        
  function reloadSampleRequest(){
    var theUrl = "manageprojectajax.php?action=reloadsamplesample&id="+__projectId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
            $("sampleRequestList").innerHTML=payload.responseText;
          }
        }
      });
  }
</script>
{/literal}