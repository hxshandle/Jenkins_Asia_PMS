{config_load file=lng.conf section = "strings" scope="global" }
  



<table style="width: 100%" cellspadding=0 cellspacing=0>
    <tr>   
      <th>{#financename#}</th>
      <th>{#innercost#}</th>
      <th>{#externalcost#}</th>
      <th>{#approved#}</th>
      <th>{#published#}</th>
    <tr>
  {section name = finance loop = $financeTab}
  {assign var="sumCost" value=$financeTab[finance].inner_cost+$sumCost}

    {if $smarty.section.finance.index % 2 == 0}
      <tr class="color-a">
    {else}
      <tr class="color-b">
    {/if}
      <td align  = "center">{$financeTab[finance].name}</td>
      <td  align  = "center">{$financeTab[finance].inner_cost_currency}{$financeTab[finance].inner_cost}</td>
      <td  align  = "center">{$financeTab[finance].external_cost_currency}{$financeTab[finance].external_cost}</td>
      <td  align  = "center">
        {if $financeTab[finance].approved ==1}
            {#yes#}
        {else}
            {#no#}
        {/if}
      </td>
      <td  align  = "center">
        {if $financeTab[finance].published ==1}
            {#yes#}
        {else}
            {#no#}
        {/if}
      </td>
      <td>
        <a class="tool_edit" title="{#edit#}" href=javascript:void(0);" onclick="showEditFinanceDlg({$financeTab[finance].ID});"></a>
        <a class="tool_del" href="javascript:void(0);"onclick="delFinance({$financeTab[finance].ID});"></a>
      </td>
    </tr>
  {/section}
  <tr>
      <td colspan='5' align=right> {#total#}:{$sumCost} </td>
 </tr> 
</table>
  
