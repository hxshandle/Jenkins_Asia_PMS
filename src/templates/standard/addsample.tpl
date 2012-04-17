<div class="dlgRow">
  <label style="margin:0 35px 0 0" >{#samplename#}</label>
  <input id="newSampleName"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 23px 0 0">{#sampletag#}</label>
  <input id="newSampleTag"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#totalcount#}</label>
  <input id="newSampleTotalcount" regexp="{literal}\d+{/literal}"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 23px 0 0">{#availablecount#}</label>
  <input id="newSampleAvailablecount" regexp="{literal}\d+{/literal}"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#sampledescription#}</label>
  <textarea  id="newSampleDescription"></textarea>
</div>  
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#projectname#}</label>
  <label style="margin:0 50px 0 0">{$project.name}</label>
</div>

<div  style="margin:10px 0 0 0">
<button id="dlgBtnSaveSample" onclick="saveSample();">{#save#}</button>
</div>

{literal}
  <script type="text/javascript">
    function addSampleValidator(){
      var ret = true;
      var newSampleName = $('newSampleName').value;
      if(newSampleName.length<1){
        $('newSampleName').style.border="2px solid red";
        ret = false;
      }
       return ret;
    }    




function saveSample(){
      if(!addSampleValidator()){
         return false;
      }
      var theUrl = "manageprojectajax.php";
      var thePost = "action=addSample&projectId="+__projectId;
      var jssampleName = $("newSampleName").value;
      thePost +="&sampleName="+jssampleName;
      var jssampleTag = $("newSampleTag").value;
      thePost +="&sampleTag="+jssampleTag;
      var jssampleAvailablecount = $("newSampleAvailablecount").value;
      thePost +="&sampleAvailablecount="+jssampleAvailablecount;    
      var jssampleTotalcount = $("newSampleTotalcount").value;   
      thePost +="&sampleTotalcount="+jssampleTotalcount;   
      var jssampleDescription = $("newSampleDescription").value;
      thePost +="&sampleDescription="+jssampleDescription;           
      if(jssampleAvailablecount*1>jssampleTotalcount*1){
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
        
        
        
  </script>
{/literal}