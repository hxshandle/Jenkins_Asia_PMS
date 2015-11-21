{config_load file=lng.conf section = "strings" scope="global" }
<div class="dlgRow">
  <label style="" >{#order#}</label>
  <label style="">{$order.name}</label>
</div>
<div class="dlgRow">
  <label style="">{#quantity#}</label>
  <label style="">{$order.quantity}</label>
</div>
<!-- add new start-->
<div class="dlgRow">
  <label style="" >{#customerPoNumber#}</label>
  <label style="">{$order.customer_po_number}</label>
</div>
<div class="dlgRow">
  <label style="" >{#jenkinsPiNumber#}</label>
  <input id="newJenkinsPiNumber" value="{$order.jenkins_pi_number}"></input>
</div>
<div class="dlgRow">
  <label style="" >{#jenkinsPoNumber#}</label>
  <input id="newJenkinsPoNumber" value="{$order.jenkins_po_number}"></input>
</div>
 <div class="dlgRow">
        <label for="uploadfile" style="float:left">{#upload#}:</label>
        {include file = "uploadfile.tpl" lazyLoad=true}
 </div>
<input type = "hidden" id = "fileId1" name = "fileId1"></input> 
<div class="dlgRow">
  <label style="" >{#factory#}</label>
  <input id="newFactory" value="{$order.factory}"></input>
</div>
<div class="dlgRow">
  <label style="" >{#terms#}</label>
  <input id="newTerms" value="{$order.terms}"></input>
</div>
<div class="dlgRow">
  <label style="" >{#accountPayment#}</label>
  <input id="newAccountPayment" value="{$order.account_payment}"></input>
</div>
<div class="dlgRow">
  <label style="" >{#customerModelNumber#}</label>
  <input id="newCustomerModelNumber"  value="{$order.customer_model_number}"></input>
</div>
<div class="dlgRow">
  <label style="" >{#customerPartNumber#}</label>
  <input id="newCustomerPartNumber" value="{$order.customer_part_number}"></input>
</div>
<div class="dlgRow">
  <label style="" >{#jenkinsModelNumber#}</label>
  <input id="newJenkinsModelNumber" value="{$order.jenkins_model_number}" ></input>
</div>
<div class="dlgRow">
  <label style="" >{#jenkinsPartNumber#}</label>
  <input id="newJenkinsPartNumber" value="{$order.jenkins_part_number}"></input>
</div>
  <div class="dlgRow">
  <label style="">{#deliverydateone#}</label>
  <input id="newDeliveryDateOne" value="{$order.delivery_date_one}"></input>
</div>
<div class="dlgRow">
    <label style="">{#deliverystatus#}</label>
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
  <label style="">{#deliverydatetwo#}</label>
  <input id="newDeliveryDateTwo" value="{$order.delivery_date_two}"></input>
</div>
<div class="dlgRow">
    <label style="">{#deliverystatus#}</label>
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
  <label style="" >{#paymentOneSchedule#}</label>
  <input id="newPaymentOneSchedule" value="{$order.payment_one_schedule}"></input>
</div>
<div class="dlgRow">
    <label style="">{#paymentOneStatus#}</label>
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
        <label for="uploadfile" style="float:left">{#upload#}:</label>

        {include file = "uploadfile2.tpl" lazyLoad=true}

</div>
<input type = "hidden" id = "fileId2" name = "fileId2"></input>   

  <div class="dlgRow">
  <label style="" >{#paymentTwoSchedule#}</label>
  <input id="newPaymentTwoSchedule" value="{$order.payment_two_schedule}"></input>
</div>
<div class="dlgRow">
    <label style="">{#paymentTwoStatus#}</label>
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
        <label for="uploadfile" style="float:left">{#upload#}:</label>

        {include file = "uploadfile3.tpl" lazyLoad=true}

</div>
    <input type = "hidden" id = "fileId3" name = "fileId3"></input>      
  <div class="dlgRow">
  <label style="" >{#paymentThreeSchedule#}</label>
  <input id="newPaymentThreeSchedule" value="{$order.payment_three_schedule}"></input>
</div>
<div class="dlgRow">
    <label style="">{#paymentThreeStatus#}</label>
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
        <label for="uploadfile" style="float:left">{#upload#}:</label>

        {include file = "uploadfile4.tpl" lazyLoad=true}

</div>
<input type = "hidden" id = "fileId4" name = "fileId4"></input>         

<div class="dlgRow">
  <label style="" >{#finalTotalAmountReceived#}</label>
  <input id="newFinalTotalAmountReceived" value="{$order.final_total_amount_received}"></input>
</div>  
<!--add new end-->  
<div class="dlgRow">
  <label style="">{#ordertime#}</label>
  <input id="newOrderTime"  value="{$order.end_time|truncate:"10":""}"></input>
</div>
<div class="dlgRow">
  <label style="">{#orderdesc#}</label>
  <textarea id="newOrderDesc">{$order.desc}</textarea>
</div>
<div  style="margin:10px 0 0 0">
<button id="dlgBtnSaveOrder1" onclick="saveEditOrder('{$order.ID}');">{#save#}</button>
</div>

{literal}
  <script type="text/javascript">
    
 
      
  </script>
{/literal}