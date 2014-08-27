{config_load file=lng.conf section = "strings" scope="global" }

<table style="width: 1800px" cellspadding=0 cellspacing=0>
    <tr>   
      <th>{#order#}</th>
      <th>{#quantity#}</th>
      <th>{#customer#}</th>
      <th>{#customerPoNumber#}</th>
      <th>{#attachment1#}</th>
      <th>{#supplier#}</th>
      {if $smarty.session.userRole!=6} 
      <th>{#deliverydateone#}</th>
      <th>{#deliverystatusone#}</th>
      <th>{#deliverydatetwo#}</th>
      <th>{#deliverystatustwo#}</th>
      <th>{#jenkinsPoNumber#}</th>
      <th>{#factory#}</th>
      <th>{#terms#}</th>
      <th>{#accountPayment#}</th>
      <th>{#attachment2#}</th>
      <th>{#customerModelNumber#}</th>
      <th>{#customerPartNumber#}</th>
      <th>{#jenkinsModelNumber#}</th>
      <th>{#jenkinsPartNumber#}</th>
      <th>{#paymentOneSchedule#}</th>
      <th>{#paymentOneStatus#}</th>
      <th>{#paymentOneAttachment#}</th>
      <th>{#paymentTwoSchedule#}</th>
      <th>{#paymentTwoStatus#}</th>
      <th>{#paymentTwoAttachment#}</th>
      <th>{#paymentThreeSchedule#}</th>
      <th>{#paymentThreeStatus#}</th>
      <th>{#paymentThreeAttachment#}</th>
      <th>{#finalTotalAmountReceived#}</th>
      
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
      <td  align  = "center">{$orderTab[order].customer_po_number}</td>
      <td  align  = "center"><a href="{$orderTab[order].attachment1}" target="blank">{$orderTab[order].filename1}</a>
      </td>
       <td  align  = "center">{$orderTab[order].supplierlead}</td>
      {if $smarty.session.userRole!=6}
      <td  align  = "center">{$orderTab[order].inner_cost_currency}:{$orderTab[order].inner_cost}</td>
      <td  align  = "center">{$orderTab[order].delivery_date_one}</td>
      <td  align  = "center">{$orderTab[order].delivery_status_one}</td>
      <td  align  = "center">{$orderTab[order].delivery_date_two}</td>
      <td  align  = "center">{$orderTab[order].delivery_status_two}</td>
      <td  align  = "center">{$orderTab[order].jenkins_po_number}</td>  
      <td  align  = "center">{$orderTab[order].factory}</td>
      <td  align  = "center">{$orderTab[order].terms}</td>
      <td  align  = "center">{$orderTab[order].account_payment}</td>
      <td  align  = "center"><a href="{$orderTab[order].attachment2}" target="blank">{$orderTab[order].filename2}</a>
      </td>
      <td  align  = "center">{$orderTab[order].customer_model_number}</td>
      <td  align  = "center">{$orderTab[order].customer_part_number}</td>
      <td  align  = "center">{$orderTab[order].jenkins_model_number}</td>
      <td  align  = "center">{$orderTab[order].jenkins_part_number}</td>
      <td  align  = "center">{$orderTab[order].payment_one_schedule}</td>
      <td  align  = "center">{$orderTab[order].payment_one_status}</td>
      <td  align  = "center">
          <a href="{$orderTab[order].payment_one_attachment}" target="blank">{$orderTab[order].paymentfilename1}</a>
      </td>
      <td  align  = "center">{$orderTab[order].payment_two_schedule}</td>
      <td  align  = "center">{$orderTab[order].payment_two_status}</td>
      <td  align  = "center">
          <a href="{$orderTab[order].payment_two_attachment}" target="blank">{$orderTab[order].paymentfilename2}</a>
      </td>
      <td  align  = "center">{$orderTab[order].payment_three_schedule}</td>
      <td  align  = "center">{$orderTab[order].payment_three_status}</td>
      <td  align  = "center">
          <a href="{$orderTab[order].payment_three_attachment}" target="blank">{$orderTab[order].paymentfilename3}</a>
      </td>
      <td  align  = "center">{$orderTab[order].final_total_amount_received}</td>
   
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
        <a class="tool_edit" title="{#price#}" href="javascript:void(0);" onclick="priceOrderDlg({$orderTab[order].ID});"></a>
        <a class="tool_edit" title="{#edit#}" href="javascript:void(0);" onclick="editOrderDlg({$orderTab[order].ID});"></a>
         {/if}
        {/if}
        {if $orderTab[order].statusId == 15 and $smarty.session.userRole==6  and $orderTab[order].published==1}
        <a class="tool_edit" title="{#agree#}" href="javascript:void(0);" onclick="agreeOrderDlg({$orderTab[order].ID});"></a>
        <a class="tool_del" title="{#reject#}" href="javascript:void(0);" onclick="rejectOrderDlg({$orderTab[order].ID});"></a>
        {/if}
        
        </td>
    </tr>
  {/section}
</table>

