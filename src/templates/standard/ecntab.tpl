<div class="phaseMenualBar">
  {if $addEcnInfo}
    <button id="btnAddEcn">{#add#}</button>
   {/if}
</div>
<div id="addEcnDlg" class="modalContainer">
  {include file="dlgmodal.tpl" templateName="addecn.tpl" title="add ecn"}
</div>
<div class="ecnList" id="ecnList">
  {if $editSampleRequestInfo}
    {include file = "ecndetails.tpl"}
  {/if}
</div>
<div id = "editEcnDlg"></div>

{literal}
<script type="text/javascript">
  if(!window.__addEcnDlgContent){
    window.__addEcnDlgContent=$("addEcnDlg").innerHTML;
    $("addEcnDlg").remove(); 
  }
  //altert("1"+$("addFinanceDlg").innerHTML);
  new Control.Modal("btnAddEcn",{
                                "contents":window.__addEcnDlgContent,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
                               
  function reloadEcn(){
    var theUrl = "manageprojectajax.php?action=reloadecn&id="+__projectId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {

		    if (payload.responseText != ""){ 
            $("ecnList").innerHTML=payload.responseText;
          }
        }
      });
  }
    
    
    
  function showEcnDlg(ctx){
    var dlg = new Control.Modal("editEcnDlg",{
                                "contents":ctx,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
   dlg.open();      
  }  
  
  function showEditEcnDlg(id){
    var ecnId = id;
    var theUrl = "manageprojectajax.php?action=editEcn&id="+ecnId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
          showEcnDlg(payload.responseText);
        }else{
          alert("faild");
        }
      }
    });  
  }

        
   function approveEcn(ecnId){
      var theUrl = "manageprojectajax.php";
      var thePost = "action=approveEcn&ecnId="+ecnId;
      var jsapproveEcnDescription = $("approveEcnDescription").value;
      thePost +="&commit="+jsapproveEcnDescription;
      new Ajax.Request(theUrl, {
		  method: 'post',
		  postBody:thePost,
		  onSuccess:function(payload) {
          if (payload.responseText == "Ok"){ 
            reloadEcn();
            Control.Modal.close();
          }else{
            alert("failed");
            return;
          }
        }
      });
    }

    function rejectEcn(ecnId){
      var theUrl = "manageprojectajax.php";
      var thePost = "action=rejectEcn&ecnId="+ecnId;
      var jsrejectEcnDescription = $("rejectEcnDescription").value;
      thePost +="&commit="+jsrejectEcnDescription;
      new Ajax.Request(theUrl, {
		  method: 'post',
		  postBody:thePost,
		  onSuccess:function(payload) {
          if (payload.responseText == "Ok"){ 
            reloadEcn();
            Control.Modal.close();
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
</script>
{/literal}