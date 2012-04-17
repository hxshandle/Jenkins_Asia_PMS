<div class="dlgRow">
  <label style="margin:0 50px 0 0" >{#ecnname#}</label>
  <input id="newEcnName"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#description#}</label>
  <textarea  id="newEcnDescription"></textarea>
</div>  
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#projectname#}</label>
  <label style="margin:0 50px 0 0">{$project.name}</label>
</div>
<div class="dlgRow">
  <label style="margin:0 35px 0 0" >{#deliverable#}</label>
     <select id = "targetFOBDeliverable" name="targetFOBDeliverable" class="currency">
        {section name=curr loop=$deliverables}
            <option value="{$deliverables[curr].ID}">{$deliverables[curr].name}</option>
        {/section}
    </select>
</div>



<div  style="margin:10px 0 0 0">
<button id="dlgBtnSaveEcn" onclick="saveEcn();">{#save#}</button>
</div>

{literal}
  <script type="text/javascript">
      
      
    function addEcnValidator(){
      var ret = true;
      var newEcnName = $('newEcnName').value;
      if(newEcnName.length<1){
        $('newEcnName').style.border="2px solid red";
        ret = false;
      }
       return ret;
    }
    function saveEcn(){
        if(!addEcnValidator()){
           return false;
        }
      var theUrl = "manageprojectajax.php";
      var thePost = "action=addEcn&projectId="+__projectId;
      var jsecnName = $("newEcnName").value;
      thePost +="&ecnName="+jsecnName;
      var jsecnDescription = $("newEcnDescription").value;
      thePost +="&ecnDescription="+jsecnDescription;
      var jstargetFOBDeliverable = $("targetFOBDeliverable").value;
      thePost +="&deliverable="+jstargetFOBDeliverable;    
      new Ajax.Request(theUrl, {
		  method: 'post',
		  postBody:thePost,
		  onSuccess:function(payload) {
		    if (payload.responseText == "Ok"){ 
            reloadEcn();
            Control.Modal.close();
          }
        }
      });
    }
        
        
        
  </script>
{/literal}