{config_load file=lng.conf section = "strings" scope="global" }

<table style="width: 100%" cellspadding=0 cellspacing=0>
    <tr>   
      <th>{#order#}</th>
      <th>{#quantity#}</th>
      <th>{#customer#}</th>
      <th>{#supplier#}</th>
      {if $smarty.session.userRole!=6}
      <th>{#innercost#}</th>
      {/if}
      {if $smarty.session.userRole!=4}
      <th>{#externalcost#}</th>
      {/if}
      <th>{#status#}</th>
    <tr>
  {section name = order loop = $orderTab}
    {if $smarty.section.order.index % 2 == 0}
      <tr class="color-a">
    {else}
      <tr class="color-b">
    {/if}
      <td align  = "center">{$orderTab[order].name}</td>
      <td  align  = "center">{$orderTab[order].quantity}</td>
      <td  align  = "center">{$orderTab[order].customerlead}</td>
      <td  align  = "center">{$orderTab[order].supplierlead}</td>
      {if $smarty.session.userRole!=6}
      <td  align  = "center">{$orderTab[order].inner_cost_currency}:{$orderTab[order].inner_cost}</td>
      {/if}
      {if $smarty.session.userRole!=4}
        {if $smarty.session.userRole==6 and $orderTab[order].published==1}
          <td  align  = "center">{$orderTab[order].external_cost_currency}:{$orderTab[order].external_cost}</td>
        {elseif  $smarty.session.userRole!=6}
          <td  align  = "center">{$orderTab[order].external_cost_currency}:{$orderTab[order].external_cost}</td>
        {else}
          <td></td>
        {/if}
      {else}
      <td></td>
      {/if}
      <td  align  = "center">{$orderTab[order].status}</td>
      <td>
        {if $orderTab[order].statusId == 14 || $orderTab[order].statusId == 17 || $orderTab[order].statusId == 15}
         {if $smarty.session.userRole == 1 || $smarty.session.userRole ==3}
        <a class="tool_edit" title="{#price#}" href=javascript:void(0);" onclick="priceOrderDlg({$orderTab[order].ID});"></a>
         {/if}
        {/if}
        {if $orderTab[order].statusId == 15 and $smarty.session.userRole==6  and $orderTab[order].published==1}
        <a class="tool_edit" title="{#agree#}" href=javascript:void(0);" onclick="agreeOrderDlg({$orderTab[order].ID});"></a>
        <a class="tool_del" title="{#reject#}" href=javascript:void(0);" onclick="rejectOrderDlg({$orderTab[order].ID});"></a>
        {/if}
        </td>
    </tr>
  {/section}
</table>

