{config_load file=lng.conf section = "strings" scope="global" }
{*Document table*}
<div class="documentTableWrapper">
<table id="documentsTable" cellspacing="0" cellpadding="0" border="0" style="width:5500px">
  <thead>
    <tr>   
      <th>{#order#}</th>
      <th>{#quantity#}</th>
      <th>{#project#}</th>
      <th>{#customer#}</th>
      <th>{#customerPoNumber#}</th>
      <th>{#supplier#}</th>
      {if $smarty.session.userRole!=6} 
      <th>{#deliverydateone#}</th>
      <th>{#deliverystatusone#}</th>
      <th>{#deliverydatetwo#}</th>
      <th>{#deliverystatustwo#}</th>
      <th>{#jenkinsPiNumber#}</th>
      <th>{#jenkinsPoNumber#}</th>
      <th>{#factory#}</th>
      <th>{#terms#}</th>
      <th>{#accountPayment#}</th>
      <th>{#customerModelNumber#}</th>
      <th>{#customerPartNumber#}</th>
      <th>{#jenkinsModelNumber#}</th>
      <th>{#jenkinsPartNumber#}</th>
      <th>{#paymentOneSchedule#}</th>
      <th>{#paymentOneStatus#}</th>
      <th>{#paymentTwoSchedule#}</th>
      <th>{#paymentTwoStatus#}</th>
      <th>{#paymentThreeSchedule#}</th>
      <th>{#paymentThreeStatus#}</th>
      <th>{#finalTotalAmountReceived#}</th>
      <th>{#innercost#}</th>
      {/if}
      {if $smarty.session.userRole != 4}
      <th>{#externalcost#}</th>
      {/if}
      <th>{#status#}</th>
  </thead>
  <tbody id="documentTBody">
  {section name = order loop = $orderTab}
    {if $smarty.section.order.index % 2 == 0}
      <tr class="color-a">
    {else}
      <tr class="color-b">
    {/if}
      <td align  = "center" style="cursor:pointer" onclick="">
        <span class="acc-toggle" onclick="javascript:accord_order.activate($$('#documentsTable .accordion_toggle')[{$smarty.section.order.index}]);toggleAccordeon('accord_order',this);"><a onclick="javascript:showOrderSubInfo({$orderTab[order].ID});return false;">{$orderTab[order].name|default:'N/A'}</a></span>
      </td>
      <td  align  = "center">{$orderTab[order].quantity}</td>
      <td  align  = "left">{$orderTab[order].projectName}</td>
      <td  align  = "center">{$orderTab[order].customerName}</td>
      <td  align  = "center">{$orderTab[order].customer_po_number}</td>
       <td  align  = "center">{$orderTab[order].supplierlead}</td>
      {if $smarty.session.userRole!=6}
      
      <td  align  = "center">{$orderTab[order].delivery_date_one}</td>
      <td  align  = "center">{$orderTab[order].delivery_status_one}</td>
      <td  align  = "center">{$orderTab[order].delivery_date_two}</td>
      <td  align  = "center">{$orderTab[order].delivery_status_two}</td>
      <td  align  = "center">{$orderTab[order].jenkins_pi_number}</td>  
      <td  align  = "center">{$orderTab[order].jenkins_po_number}</td>  
      <td  align  = "center">{$orderTab[order].factory}</td>
      <td  align  = "center">{$orderTab[order].terms}</td>
      <td  align  = "center">{$orderTab[order].account_payment}</td>
      <td  align  = "center">{$orderTab[order].customer_model_number}</td>
      <td  align  = "center">{$orderTab[order].customer_part_number}</td>
      <td  align  = "center">{$orderTab[order].jenkins_model_number}</td>
      <td  align  = "center">{$orderTab[order].jenkins_part_number}</td>
      <td  align  = "center">{$orderTab[order].payment_one_schedule}</td>
      <td  align  = "center">{$orderTab[order].payment_one_status}</td>
      <td  align  = "center">{$orderTab[order].payment_two_schedule}</td>
      <td  align  = "center">{$orderTab[order].payment_two_status}</td>
      <td  align  = "center">{$orderTab[order].payment_three_schedule}</td>
      <td  align  = "center">{$orderTab[order].payment_three_status}</td>
      <td  align  = "center">{$orderTab[order].final_total_amount_received}</td>
      <td  align  = "center">{$orderTab[order].inner_cost_currency}:{$orderTab[order].inner_cost}</td>
      {/if}
      {if $smarty.session.userRole != 4}
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
         {if $smarty.session.userRole == 1 || $smarty.session.userRole ==3 ||$smarty.session.userRole == 5}
        <a class="" title="{#price#}" href="javascript:void(0);" onclick="priceOrderDlg({$orderTab[order].ID});"><i class="fa fa-usd"></i></a>
        <a class="" title="{#edit#}" href="javascript:void(0);" onclick="editOrderDlg({$orderTab[order].ID});"><i class="fa fa-pencil-square-o"></i></a>
         {/if}
        {/if}
        {if $orderTab[order].statusId == 15 and $smarty.session.userRole==6  and $orderTab[order].published==1}
        <a class="" title="{#agree#}" href="javascript:void(0);" onclick="agreeOrderDlg({$orderTab[order].ID});"><i class="fa fa-pencil-square-o"></i></a>
        <a class="tool_del" title="{#reject#}" href="javascript:void(0);" onclick="rejectOrderDlg({$orderTab[order].ID});"><i class="fa fa-times"></i></a>
        {/if}
        
        </td>
    </tr>
    <tr class="acc">
        <td colspan="6">
          <div class="accordion_toggle"></div>
          <div class="accordion_content">
            <p>
              {$orderTab[order].desc}
            </p>
          </div>
        </td>
      </tr>
  {/section}
  </tbody>
</table>
</div>
<script>
 var accord_order = new accordion('documentsTable');
</script>