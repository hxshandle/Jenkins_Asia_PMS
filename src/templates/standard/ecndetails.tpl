{config_load file=lng.conf section = "strings" scope="global" }
<table style="width: 100%" cellspadding=0 cellspacing=0>
    <tr>   
      <th>{#operate#}</th>
      <th>{#ecnname#}</th>
      <th>{#projectname#}</th>
      <th>{#createby#}</th>
      <th>{#status#}</th>
      <th>{#createtime#}</th>
    <tr>
  {section name = ecn loop = $ecnTab}
    {if $smarty.section.ecn.index % 2 == 0}
      <tr class="color-a">
    {else}
      <tr class="color-b">
    {/if}
      <td>
        {if $ecnTab[ecn].approveId == 1 && $editBaseInfo}
        <a class="tool_edit" title="{#approved#}" href=javascript:void(0);" onclick="approveEditEcnDlg({$ecnTab[ecn].ID});"></a>
        <a class="tool_del"  title="{#rejected#}" href="javascript:void(0);"onclick="rejectEditEcnDlg({$ecnTab[ecn].ID});"></a>
        {/if}
      </td>
      <td align  = "center">{$ecnTab[ecn].name}</td>
      <td  align  = "center">{$ecnTab[ecn].projectname}</td>
      <td  align  = "center">{$ecnTab[ecn].submit_by}</td>
      <td  align  = "center">{$ecnTab[ecn].approved}</td>
      <td  align  = "center">{$ecnTab[ecn].submit_time}</td>
    </tr>
  {/section}
</table>
<div id = "approveEcnDlg"></div>
<div id = "rejectEcnDlg"></div>

{literal}
  <script type="text/javascript">
      
   function approveEditEcnDlg(id){
    var ecnId = id;
    var theUrl = "manageprojectajax.php?action=editApproveEcn&id="+ecnId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
          approveEcnDlg(payload.responseText);
        }else{
          alert("show failed");
        }
      }
    });  
  }     
  function approveEcnDlg(ctx){
        var dlgRequest = new Control.Modal("approveEcnDlg",{
                                "contents":ctx,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
        dlgRequest.open();     
  }      
   function rejectEditEcnDlg(id){
    var ecnId = id;
    var theUrl = "manageprojectajax.php?action=editRejectEcn&id="+ecnId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
          rejectEcnDlg(payload.responseText);
        }else{
          alert("show failed");
        }
      }
    });  
  }     
  function rejectEcnDlg(ctx){
        var dlgRejectEcn = new Control.Modal("rejectEcnDlg",{
                                "contents":ctx,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
        dlgRejectEcn.open();     
  }    
  </script>
   
{/literal}