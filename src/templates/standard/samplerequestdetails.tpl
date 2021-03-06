{config_load file=lng.conf section = "strings" scope="global" }
<table style="width: 100%" cellspadding=0 cellspacing=0 id="sample-request-table">
    <tr>
        <td colspan="6">
        {#mysample#}
        </td>
    </tr>
    <tr>   
      <th>{#samplename#}</th>
      <th>{#projectname#}</th>
      <th>{#createby#}</th>
      <th>{#status#}</th>
      <th>{#createtime#}</th>
      <th>{#operate#}</th>
    <tr>
  {section name = sampleRequest loop = $sampleRequestTab}
    {if $smarty.section.sampleRequest.index % 2 == 0}
      <tr class="color-a">
    {else}
      <tr class="color-b">
    {/if}

      <!--
      <td align  = "center">{$sampleRequestTab[sampleRequest].samplename}</td>
      -->
      <td>
       <div class="toggle-in">
          <span class="acc-toggle" onclick="javascript:accord_sample_request.activate($$('#sample-request-table .accordion_toggle')[{$smarty.section.sampleRequest.index}]);toggleAccordeon('accord_sample_request',this);">{$sampleRequestTab[sampleRequest].samplename}</span>
        </div>
      </td>
      <td  align  = "center">{$sampleRequestTab[sampleRequest].projectname}</td>
      <td  align  = "center">{$sampleRequestTab[sampleRequest].submit_by}</td>
      <td  align  = "center">{$sampleRequestTab[sampleRequest].approved}</td>
      <td  align  = "center">{$sampleRequestTab[sampleRequest].submit_time}</td>
      <td>
        {if $sampleRequestTab[sampleRequest].approveId == 25  && $editBaseInfo}
        <a class="tool_edit" title="{#approved#}" href=javascript:void(0);" onclick="approveEditRequestDlg({$sampleRequestTab[sampleRequest].ID});"></a>
        <a class="tool_del"  title="{#rejected#}" href="javascript:void(0);"onclick="rejectEditRequestDlg({$sampleRequestTab[sampleRequest].ID});"></a>
        {/if}
        {if $sampleRequestTab[sampleRequest].approveId == 26 && $editBaseInfo}
          <a class="tool_del"  title="{#retrieve#}" href="javascript:void(0);"onclick="retrieveSample({$sampleRequestTab[sampleRequest].ID});"></a>
         {/if}
      </td>
    </tr>
    <tr class="acc">
      <td colspan="6">
        <div class="accordion_toggle"></div>
          <div class="accordion_content" style="padding-left:20px">
            <h5>{#comment#}</h5>
            <p>{$sampleRequestTab[sampleRequest].submitter_comments}</p>
          </div>
      </td>
    </tr>
  {/section}
</table>
<div id = "approveSampleDlg"></div>
<div id = "rejectSampleDlg"></div>

{literal}
  <script type="text/javascript">
      
   function approveEditRequestDlg(id){
    var sampleRequestId = id;
    var theUrl = "manageprojectajax.php?action=editApproveRequest&id="+sampleRequestId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
          approveRequestDlg(payload.responseText);
        }else{
          alert("show failed");
        }
      }
    });  
  }     
  function approveRequestDlg(ctx){
        var dlgRequest = new Control.Modal("approveSampleDlg",{
                                "contents":ctx,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
        dlgRequest.open();     
  }      
   function rejectEditRequestDlg(id){
    var sampleRequestId = id;
    var theUrl = "manageprojectajax.php?action=editRejectRequest&id="+sampleRequestId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
          rejectRequestDlg(payload.responseText);
        }else{
          alert("show failed");
        }
      }
    });  
  }     
  function rejectRequestDlg(ctx){
        var dlgRejectRequest = new Control.Modal("rejectSampleDlg",{
                                "contents":ctx,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
        dlgRejectRequest.open();     
  }    
  var accord_sample_request = new accordion('sample-request-table');
  </script>
   
{/literal}
