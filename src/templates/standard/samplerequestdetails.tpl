{config_load file=lng.conf section = "strings" scope="global" }
<table style="width: 100%" cellspadding=0 cellspacing=0>
    <tr>
        <td colspan="6">
        {#mysample#}
        </td>
    </tr>
    <tr>   
      <th>{#operate#}</th>
      <th>{#samplename#}</th>
      <th>{#projectname#}</th>
      <th>{#createby#}</th>
      <th>{#status#}</th>
      <th>{#createtime#}</th>
    <tr>
  {section name = sampleRequest loop = $sampleRequestTab}
    <tr>
      <td>
        <a class="tool_edit" title="{#approved#}" href=javascript:void(0);" onclick="approveRequestDlg({$sampleRequestTab[sampleRequest].ID});"></a>
        <a class="tool_del"  title="{#rejected#}" href="javascript:void(0);"onclick="rejectRequestDlg({$sampleRequestTab[sampleRequest].ID});"></a>
      </td>
      <td align  = "center">{$sampleRequestTab[sampleRequest].samplename}</td>
      <td  align  = "center">{$sampleRequestTab[sampleRequest].projectname}</td>
      <td  align  = "center">{$sampleRequestTab[sampleRequest].submit_by}</td>
      <td  align  = "center">{$sampleRequestTab[sampleRequest].approved}</td>
      <td  align  = "center">{$sampleRequestTab[sampleRequest].submit_time}</td>
    </tr>
  {/section}
</table>
<div id = "approveSampleDlg"></div>
{literal}
  <script type="text/javascript">

  function approveRequestDlg(){
        var dlgRequest = new Control.Modal("approveSampleDlg",{
                                "contents":"approve",
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
        dlgRequest.open();     
  }      

  </script>
   
{/literal}