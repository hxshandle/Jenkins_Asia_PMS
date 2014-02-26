<div class="phaseMenualBar">
  {if $editBaseInfo}
    <button id="btnAddSample" onclick="openAddSampleDlg()">{#addphase#}</button>
  {/if}
  </div>

<div class="sampleList" id="sampleList">
 {if $editSampleInfo}
    {include file = "sampledetails.tpl"}
 {/if}
</div>
<div class="phaseMenualBar">
  <button id="btnAddSampleRequest">{#addsamplerequest#}</button>
</div>
<div id="addSampleRequestDlg" class="modalContainer">
  {include file="dlgmodal.tpl" templateName="addsamplerequest.tpl" title="add Sample Request"}
</div>

<div class="sampleRequestList" id="sampleRequestList">
   {if $editSampleRequestInfo}
    {include file = "samplerequestdetails.tpl"}
   {/if}
</div>
<div id = "editsampleDlg"></div>

{literal}
<script type="text/javascript">
  if(!window.__addSampleRequestDlgContent){
    window.__addSampleRequestDlgContent=$("addSampleRequestDlg").innerHTML;
    $("addSampleRequestDlg").remove(); 
  }
    new Control.Modal("btnAddSampleRequest",{
                                "contents":window.__addSampleRequestDlgContent,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });                             
  function openAddSampleDlg(){
    J.openWindow('manageprojectajax.php?action=openAddSampleDlg&projectId='+__projectId);
  }
  function reloadSample(){
    var theUrl = "manageprojectajax.php?action=reloadsample&id="+__projectId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
            $("sampleList").innerHTML=payload.responseText;
            var accord_sample = new accordion('sample-table');
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
    var theUrl = "manageprojectajax.php?action=reloadsamplerequest&id="+__projectId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
            $("sampleRequestList").innerHTML=payload.responseText;
          }
        }
      });
  }
      
    function approveSample(sampleRequestId){
      var theUrl = "manageprojectajax.php";
      var thePost = "action=approveSample&sampleRequestId="+sampleRequestId;
      var jsapproveSampleDescription = $("approveSampleDescription").value;
      thePost +="&commit="+jsapproveSampleDescription;
      new Ajax.Request(theUrl, {
		  method: 'post',
		  postBody:thePost,
		  onSuccess:function(payload) {
          if (payload.responseText == "Ok"){ 
            reloadSample();
            reloadSampleRequest();
            Control.Modal.close();
          }else if(payload.responseText == notenough){
              alert("{/literal}{#notenough#}{literal}");
              return;
          }else{
            alert("failed");
            return;
          }
        }
      });
    }
    function closeWindows(){
        window.close();
    }     
    function rejectSample(sampleRequestId){
      var theUrl = "manageprojectajax.php";
      var thePost = "action=rejectSample&sampleRequestId="+sampleRequestId;
      var jsrejectSampleDescription = $("rejectSampleDescription").value;
      thePost +="&commit="+jsrejectSampleDescription;
      new Ajax.Request(theUrl, {
		  method: 'post',
		  postBody:thePost,
		  onSuccess:function(payload) {
          if (payload.responseText == "Ok"){ 
            reloadSampleRequest();
            Control.Modal.close();
          }else{
            alert("failed");
            return;
          }
        }
      });
    }
        
  function retrieveSample(id){
    var sampleRequestId = id;
    var theUrl = "manageprojectajax.php?action=retrievesample&id="+sampleRequestId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText == "Ok"){ 
          reloadSample();
          reloadSampleRequest();
        }else{
          alert("del faild");
        }
      }
    });
  }     
        
</script>
{/literal}
