{config_load file=lng.conf section = "strings" scope="global" }

<table style="width: 100%" cellspadding=0 cellspacing=0>
    <tr>   
      <th>{#order#}</th>
      <th>{#quantity#}</th>
      <th>{#customer#}</th>
      <th>{#supplier#}</th>
      <th>{#innercost#}</th>
      <th>{#externalcost#}</th>
      <th>{#status#}</th>
    <tr>
  {section name = order loop = $orderTab}
    <tr>
      <td align  = "center">{$orderTab[order].name}</td>
      <td  align  = "center">{$orderTab[order].quantity}</td>
      <td  align  = "center">{$orderTab[order].customerlead}</td>
      <td  align  = "center">{$orderTab[order].supplierlead}</td>
      <td  align  = "center">{$orderTab[order].inner_cost_currency}{$orderTab[order].inner_cost}</td>
      <td  align  = "center">{$orderTab[order].external_cost_currency}{$orderTab[order].external_cost}</td>
      <td  align  = "center">{$orderTab[order].status}</td>
      <td>
        {if $orderTab[order].statusId == 14}
        <a class="tool_edit" title="{#price#}" href=javascript:void(0);" onclick="priceOrderDlg({$orderTab[order].ID});"></a>
        {elseif $orderTab[order].statusId == 15}
        <a class="tool_edit" title="{#agree#}" href=javascript:void(0);" onclick="agreeOrderDlg({$orderTab[order].ID});"></a>
        {elseif $orderTab[order].statusId == 16}
        <a class="tool_edit" title="{#close#}" href=javascript:void(0);" onclick="closeOrderDlg({$orderTab[order].ID});"></a>
        {/if}
        </td>
    </tr>
  {/section}
</table>

