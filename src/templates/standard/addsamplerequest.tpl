<div class="dlgRow">
  <label >{#samplename#}</label>
     <select id = "targetFOBSampleExt" name="targetFOBSampleExt" class="currency">
        {section name=curr loop=$sampleTab}
            <option value="{$sampleTab[curr].ID}">{$sampleTab[curr].name}</option>
        {/section}
    </select>
</div>
<div class="dlgRow">
  <label >{#sampledescription#}</label>
  <textarea  id="newSampleRequestsDescription"></textarea>
</div>  
<div class="dlgRow">
  <label >{#projectname#}</label>
  <label >{$project.name}</label>
</div>

<div  style="margin:10px 0 0 0">
<button id="dlgBtnSaveSampleRequest" onclick="saveSampleRequest();">{#raise#}</button>
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
            reloadSampleRequest();
            Control.Modal.close();
          }
        }
      });
    }
  </script>
{/literal}