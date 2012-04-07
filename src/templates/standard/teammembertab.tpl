<div class="phaseMenualBar">
  {if $editBaseInfo}
    <button id="btnAddMember">{#add#}</button>
  {/if}
</div>
<div id="addMemberDlg" class="modalContainer">
  {include file="dlgmodal.tpl" templateName="addmember.tpl" title="add member"}
</div>
<div class="memberList" id="memberList">
    {if $editTeamInfo}
    {include file = "memberdetails.tpl"}
    {/if}
</div>


{literal}
<script type="text/javascript">
  if(!window.__addMemberDlgContent){
    window.__addMemberDlgContent=$("addMemberDlg").innerHTML;
    $("addMemberDlg").remove(); 
  }
  //altert("1"+$("addFinanceDlg").innerHTML);
  new Control.Modal("btnAddMember",{
                                "contents":window.__addMemberDlgContent,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
                               
  function reloadMember(){
    var theUrl = "manageprojectajax.php?action=reloadmember&id="+__projectId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
            $("memberList").innerHTML=payload.responseText;
          }
        }
      });
  }
    
  function delMember(user,project){
    var userId = user;
    var projectId = project;
    var theUrl = "manageprojectajax.php?action=delmember&userId="+userId+"&projectId="+projectId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText == "Ok"){ 
          reloadMember();
        }else{
          alert("del faild");
        }
      }
    });
  }      
</script>
{/literal}