{config_load file=lng.conf section = "strings" scope="global" }

<table style="width: 100%" cellspadding=0 cellspacing=0 id="sample-table">
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
      <td align  = "center">
       <div class="toggle-in">
          <span class="acc-toggle" onclick="javascript:accord_sample.activate($$('#sample-table .accordion_toggle')[{$smarty.section.sample.index}]);toggleAccordeon('accord_sample',this);">{$sampleTab[sample].name}</span>
        </div>
      </td>
      <td  align  = "center">{$sampleTab[sample].total_count}</td>
      <td  align  = "center">{$sampleTab[sample].available_count}</td>
      <td>
      {if $editBaseInfo}
        <a class="tool_edit" title="{#edit#}" href="javascript:void(0);" onclick="showEditSampleDlg({$sampleTab[sample].ID});"></a>
        <a class="tool_del" href="javascript:void(0);" onclick="delSample({$sampleTab[sample].ID});"></a>
      {/if}
          </td>
    </tr>
    <tr class="acc">
        <td colspan="6">
          <div class="accordion_toggle"></div>
          <div class="accordion_content">
            {if $sampleTab[sample].datei == '' }
              <p></p>
            {else}
              <img src="/thumb.php?pic={$sampleTab[sample].datei}&width=480"></img>
            {/if}
            <h3>{#description#}</h3>
            <p>{$sampleTab[sample].description}<p>
            <h3>{#samplelocation#}</h3>
            <p>{$sampleTab[sample].location}<p>
          </div>
        </td>
      </tr>
  {/section}
</table>


<script>
  var accord_sample = new accordion('sample-table');
</script>

