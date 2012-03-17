<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#members#}</label>
</div>

<div  style="margin:10px 0 0 0">
   {section name = cur loop = $availableUsers}
    <input type="checkbox" name="members" value="{$availableUsers[cur].ID}"/>{$availableUsers[cur].name}&nbsp;&nbsp;&nbsp;
    {/section}
</div>
<div  style="margin:10px 0 0 0">
    <button id="dlgBtnSaveMembers" onclick="saveMember();">{#save#}</button>
</div>
{literal}
  <script type="text/javascript">
    function saveMember(){
    
      var theUrl = "manageprojectajax.php";
      var thePost = "action=addMember&projectId="+__projectId;
      var listMember = document.getElementsByName("members");
      var listCheckedMember = new Array();
      if(listMember!=null){
        for(var i=0;i<listMember.length;i++){
            if(listMember[i].checked){
                listCheckedMember.push(listMember[i].value);
            }
        }
        thePost +="&members="+listCheckedMember;
        new Ajax.Request(theUrl, {
                        method: 'post',
                        postBody:thePost,
                        onSuccess:function(payload) {
                            if (payload.responseText == "Ok"){ 
                    reloadMember();
                    Control.Modal.close();
                }
                }
            });
      }else{
          alert("failed")
      }
    }
      
      
  </script>
{/literal}