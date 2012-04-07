{config_load file=lng.conf section = "strings" scope="global" }

<table style="width: 100%" cellspadding=0 cellspacing=0>
    <tr>
        <td colspan="4">
        {#availablesample#}
        </td>
    </tr>
    <tr>   
      <th>{#samplename#}</th>
      <th>{#totalcount#}</th>
      <th>{#availablecount#}</th>
    <tr>
  {section name = sample loop = $sampleTab}    
   {if $smarty.section.sample.index % 2 == 0}
      <tr class="color-a">
    {else}
      <tr class="color-b">
    {/if}
      <td align  = "center">{$sampleTab[sample].name}</td>
      <td  align  = "center">{$sampleTab[sample].total_count}</td>
      <td  align  = "center">{$sampleTab[sample].available_count}</td>
      <td>
      {if $editBaseInfo}
        <a class="tool_edit" title="{#edit#}" href=javascript:void(0);" onclick="showEditSampleDlg({$sampleTab[sample].ID});"></a>
        <a class="tool_del" href="javascript:void(0);"onclick="delSample({$sampleTab[sample].ID});"></a>
      {/if}
          </td>
    </tr>
  {/section}
</table>

