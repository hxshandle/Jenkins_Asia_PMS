<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#sampledescription#}</label>
  <textarea  id="approveSampleDescription"></textarea>
</div> 
  
<div  style="margin:10px 0 0 0">
<button id="dlgBtnApproveSampleRequest" onclick="approveSample();">{#raise#}</button>
</div>

{literal}
  <script type="text/javascript">
    function saveSampleRequest(){
      
      var theUrl = "manageprojectajax.php";
      var thePost = "action=addSampleRequest&projectId="+__projectId;
      var jstargetFOBSampleExt = $("targetFOBSampleExt").value;
      thePost +="&sampleId="+jstargetFOBSampleExt;
      var jssampleRequestsDescription = $("newSampleRequestsDescription").value;
      thePost +="&samplerequestcomment="+jssampleRequestsDescription;
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
  </script>
{/literal}