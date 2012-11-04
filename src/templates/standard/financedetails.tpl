{config_load file=lng.conf section = "strings" scope="global" }
  


<div style="overflow:scroll">
<table style="width: 3000px" cellspadding=0 cellspacing=0>
    <tr>  
      <th>{#operate#}</th> 
      <th>{#incomingPaymentAmount#}</th>
      <th>{#customerSource#}</th>
      <th>{#outgoingPaymentAmount#}</th>
      <th>{#beneficiary#}</th>
      <th>{#productNo#}</th>
      <th>{#PONumber#}</th>
      <th>{#invoiceNumber#}</th>
      <th>{#reason#}</th>
      <th>{#plannedIncomingPaymentDate#}</th>
      <th>{#actualIncomingPaymentDate#}</th>
      <th>{#difference#}</th>
      <th>{#incomingPaymentStatus#}</th>
      <th>{#actualIncomingPaymentAmountReceived#}</th>
      <th>{#plannedOutgoingPaymentDate#}</th>
      <th>{#actualOutgoingPaymentDate#}</th>
      <th>{#difference#}</th>
      <th>{#outgoingPaymentSatus#}</th>
      <th>{#actualOutgoingPaymentAmountPaid#}</th>
    <tr>
  {section name = finance loop = $financeTab}
  {assign var="sumCost" value=$financeTab[finance].inner_cost+$sumCost}

    {if $smarty.section.finance.index % 2 == 0}
      <tr class="color-a">
    {else}
      <tr class="color-b">
    {/if}
      <td>
        {if $editBaseInfo}
        <a class="tool_edit" title="{#edit#}" href=javascript:void(0);" onclick="showEditFinanceDlg({$financeTab[finance].ID});"></a>
        {if 1==2}
        <a class="tool_del" href="javascript:void(0);"onclick="delFinance({$financeTab[finance].ID});"></a>
        {/if}
        {/if}
      </td>
      <td align  = "center">{$financeTab[finance].incoming_payment_amount}</td>
      <td align  = "center">{$financeTab[finance].customer_source}</td>
      <td align  = "center">{$financeTab[finance].outgoing_payment_amount}</td>
      <td align  = "center">{$financeTab[finance].beneficiary}</td>
      <td align  = "center">{$financeTab[finance].project_number}</td>
      <td align  = "center">{$financeTab[finance].PO_number}</td>
      <td align  = "center">{$financeTab[finance].invoice_number}</td>
      <td align  = "center">{$financeTab[finance].reason}</td>
      <td align  = "center">{$financeTab[finance].planned_incoming_payment_date|truncate:"10":""}</td>
      <td align  = "center">{$financeTab[finance].actual_incoming_payment_date|truncate:"10":""}</td>
      <td align  = "center">{$financeTab[finance].difference1}</td>

      <td align  = "center">{dispstatus statusId =$financeTab[finance].incoming_payment_status}</td>
      <td align  = "center">{$financeTab[finance].actual_incoming_payment_amount_received}</td>
      <td align  = "center">{$financeTab[finance].planned_outgoing_payment_date|truncate:"10":""}</td>
      <td align  = "center">{$financeTab[finance].actual_outgoing_payment_date|truncate:"10":""}</td>
      <td align  = "center">{$financeTab[finance].difference2}</td>
      <td align  = "center">{dispstatus statusId =$financeTab[finance].outgoing_payment_status}</td>
      <td align  = "center">{$financeTab[finance].actual_outgoing_payment_amount_paid}</td>
      
      
    </tr>
  {/section}
</table>
</div>
  
