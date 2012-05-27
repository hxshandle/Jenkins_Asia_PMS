{config_load file=lng.conf section = "strings" scope="global" }
<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#order#}</label>
  <label style="margin:0 50px 0 0">{$order.name}</label>
</div>
<div class="dlgRow">
  <label style="margin:0 75px 0 0">{#quantity#}</label>
  <label style="margin:0 50px 0 0">{$order.quantity}</label>
</div>
<!-- add new start-->
<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#customerPoNumber#}</label>
  <label style="margin:0 50px 0 0">{$order.customer_po_number}</label>
</div>
<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#jenkinsPoNumber#}</label>
  <input id="newJenkinsPoNumber" value="{$order.jenkins_po_number}"></input>
</div>
<div class="dlgRow">
   <div class="dlgRow">
        <label for="uploadfile" >{#upload#}:</label>
        {include file = "uploadfile.tpl"}
   </div>
<input type = "hidden" id = "fileId" name = "fileId"></input> 
</div>
<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#factory#}</label>
  <input id="newFactory" value="{$order.factory}"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#terms#}</label>
  <input id="newTerms" value="{$order.terms}"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#accountPayment#}</label>
  <input id="newAccountPayment" value="{$order.account_payment}"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#customerModelNumber#}</label>
  <input id="newCustomerModelNumber"  value="{$order.customer_model_number}"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#customerPartNumber#}</label>
  <input id="newCustomerPartNumber" value="{$order.customer_part_number}"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#jenkinsModelNumber#}</label>
  <input id="newJenkinsModelNumber" value="{$order.jenkins_model_number}" ></input>
</div>
<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#jenkinsPartNumber#}</label>
  <input id="newJenkinsPartNumber" value="{$order.jenkins_part_number}"></input>
</div>
  <div class="dlgRow">
  <label style="margin:0 50px 0 0">{#deliverydateone#}</label>
  <input id="newDeliveryDateOne" value="{$order.delivery_date_one}"></input>
</div>
<div class="dlgRow">
    <label style="margin:0 50px 0 0">{#deliverystatus#}</label>
    <select id = "targetDeliveryStatus1" name="targetDeliveryStatus1" class="currency">
        {section name=curr loop=$status}
        {if $status[curr].id == $order.delivery_status_one}
            <option selected  value="{$status[curr].id}">{$status[curr].value}</option>
        {else}
            <option value="{$status[curr].id}">{$status[curr].value}</option>
        {/if}
        {/section}
    </select>
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#deliverydatetwo#}</label>
  <input id="newDeliveryDateTwo" value="{$order.delivery_date_two}"></input>
</div>
<div class="dlgRow">
    <label style="margin:0 50px 0 0">{#deliverystatus#}</label>
    <select id = "targetDeliveryStatus2" name="targetDeliveryStatus2" class="currency">
        {section name=curr loop=$status}
        {if $status[curr].id == $order.delivery_status_two}
            <option selected  value="{$status[curr].id}">{$status[curr].value}</option>
        {else}
            <option value="{$status[curr].id}">{$status[curr].value}</option>
        {/if}
        {/section}
    </select>
</div>
<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#paymentOneSchedule#}</label>
  <input id="newPaymentOneSchedule" value="{$order.payment_one_schedule}"></input>
</div>
<div class="dlgRow">
    <label style="margin:0 50px 0 0">{#paymentOneStatus#}</label>
    <select id = "targetpaymentStatus1" name="targetpaymentStatus1" class="currency">
        {section name=curr loop=$status}
        {if $status[curr].id == $order.payment_one_status}
            <option selected  value="{$status[curr].id}">{$status[curr].value}</option>
        {else}
            <option value="{$status[curr].id}">{$status[curr].value}</option>
        {/if}
        {/section}
    </select>
</div>
<div class="dlgRow">
     <div class="dlgRow">
        <label for="uploadfile" >{#upload#}:</label>
        {include file = "uploadfile.tpl"}
   </div>
<input type = "hidden" id = "fileId2" name = "fileId2"></input>   
    
</div>
  <div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#paymentTwoSchedule#}</label>
  <input id="newPaymentTwoSchedule" value="{$order.payment_two_schedule}"></input>
</div>
<div class="dlgRow">
    <label style="margin:0 50px 0 0">{#paymentTwoStatus#}</label>
    <select id = "targetpaymentStatus2" name="targetpaymentStatus2" class="currency">
        {section name=curr loop=$status}
        {if $status[curr].id == $order.payment_two_status}
            <option selected  value="{$status[curr].id}">{$status[curr].value}</option>
        {else}
            <option value="{$status[curr].id}">{$status[curr].value}</option>
        {/if}
        {/section}
    </select>
</div>
<div class="dlgRow">
      <div class="dlgRow">
        <label for="uploadfile" >{#upload#}:</label>
        {include file = "uploadfile.tpl"}
     </div>
    <input type = "hidden" id = "fileId3" name = "fileId3"></input>      
</div>
  <div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#paymentThreeSchedule#}</label>
  <input id="newPaymentThreeSchedule" value="{$order.payment_three_schedule}"></input>
</div>
<div class="dlgRow">
    <label style="margin:0 50px 0 0">{#paymentThreeStatus#}</label>
    <select id = "targetpaymentStatus3" name="targetpaymentStatus3" class="currency">
        {section name=curr loop=$status}
        {if $status[curr].id == $order.payment_three_status}
            <option selected  value="{$status[curr].id}">{$status[curr].value}</option>
        {else}
            <option value="{$status[curr].id}">{$status[curr].value}</option>
        {/if}
        {/section}
    </select>
</div>
<div class="dlgRow">
     <div class="dlgRow">
        <label for="uploadfile" >{#upload#}:</label>
        {include file = "uploadfile.tpl"}
     </div>
    <input type = "hidden" id = "fileId4" name = "fileId4"></input>         

</div>  
<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#finalTotalAmountReceived#}</label>
  <input id="newFinalTotalAmountReceived" value="{$order.final_total_amount_received}"></input>
</div>  
<!--add new end-->  
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#ordertime#}</label>
  <input id="newOrderTime"  value="{$order.end_time}"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#orderdesc#}</label>
  <textarea id="newOrderDesc">{$order.desc}</textarea>
</div>
<div  style="margin:10px 0 0 0">
<button id="dlgBtnSaveOrder1" onclick="saveEditOrder('{$order.ID}');">{#save#}</button>
</div>

{literal}
  <script type="text/javascript">
    
 
      
  </script>
{/literal}