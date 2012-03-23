{config_load file=lng.conf section = "strings" scope="global" }

<table style="width: 100%" cellspadding=0 cellspacing=0>
    <tr>   
      <th>{#purchase#}</th>
      <th>{#quantity#}</th>
      <th>{#supplier#}</th>
      <th>{#price#}</th>
      <th>{#status#}</th>
    <tr>
  {section name = purchase loop = $purchaseTab}
    {if $smarty.section.purchase.index % 2 == 0}
      <tr class="color-a">
    {else}
      <tr class="color-b">
    {/if}
      <td align  = "center">{$purchaseTab[purchase].name}</td>
      <td  align  = "center">{$purchaseTab[purchase].quantity}</td>
      <td  align  = "center">{$purchaseTab[purchase].supplierlead}</td>
      <td  align  = "center">{$purchaseTab[purchase].price}</td>
      <td  align  = "center">{$purchaseTab[purchase].status}</td>
      <td>
        {if $purchaseTab[purchase].statusId == 32 || $purchaseTab[purchase].statusId == 35}
        <a class="tool_edit" title="{#price#}" href=javascript:void(0);" onclick="pricePurchaseDlg({$purchaseTab[purchase].ID});"></a>
        {elseif $purchaseTab[purchase].statusId == 33}
        <a class="tool_edit" title="{#agree#}" href=javascript:void(0);" onclick="agreePurchaseDlg({$purchaseTab[purchase].ID});"></a>
        <a class="tool_edit" title="{#reject#}" href=javascript:void(0);" onclick="rejectPurchaseDlg({$purchaseTab[purchase].ID});"></a>
        {/if}
        </td>
    </tr>
  {/section}
</table>

