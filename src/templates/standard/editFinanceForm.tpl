


<form onsubmit="return validateCompleteForm(this);" action="managefinance.php?action={$actionType}" method="post" class="main">
  <input type="hidden" name="projectId" id="projectId" value="{$projectId}"></input>
  <input type="hidden" name="financeId" id="financeId" value="{$finance.ID}"></input>
  <div class="row">
    <label style="width:240px;" >{#incomingPaymentAmount#}</label>
    <input style = "width:247px;" id="incoming_payment_amount" name="incoming_payment_amount" value = {$finance.incoming_payment_amount}></input>
    <select style="width:60px" id = "incoming_payment_amount_currency" name="incoming_payment_amount_currency" class="currency">
        {section name=curr loop=$currency}
        {if $currency[curr] == $finance.incoming_payment_amount_currency}
            <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
        {else}
            <option value="{$currency[curr]}">{$currency[curr]}</option>
        {/if}
        {/section}
    </select>
  </div>


  <div class="row">
    <label style="width:240px;" >{#customerSource#}</label>
    <input id = "customer_source" name ="customer_source" value="{$finance.customer_source}"></input>
  </div>

  <div class="row">
    <label style="width:240px;" >{#outgoingPaymentAmount#}</label>
    <input style = "width:247px;" id="outgoing_payment_amount" name="outgoing_payment_amount" value = {$finance.outgoing_payment_amount}></input>
    <select style="width:60px" id = "outgoing_payment_amount_currency" name="outgoing_payment_amount_currency" class="currency">
        {section name=curr loop=$currency}
        {if $currency[curr] == $finance.outgoing_payment_amount_currency}
            <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
        {else}
            <option value="{$currency[curr]}">{$currency[curr]}</option>
        {/if}
        {/section}
    </select>
  </div>

  <div class="row">
    <label style="width:240px;" >{#beneficiary#}</label>
    <textarea id = "beneficiary" name ="beneficiary" value = "{$finance.beneficiary}">{$finance.beneficiary}</textarea>
  </div>

  <div class="row">
    <label style="width:240px;" >{#productNo#}</label>
    <input id="project_number" name="project_number" value = "{$finance.project_number}"></input>
  </div>

  <div class="row">
    <label style="width:240px;" >{#PONumber#}</label>
    <input id="PO_number" name="PO_number" value="{$finance.PO_number}"></input>
  </div>

  <div class="row">
    <label style="width:240px;" >{#invoiceNumber#}</label>
    <input id="invoice_number" name="invoice_number" value="{$finance.invoice_number}"></input>
  </div>

  <div class="row">
    <label style="width:240px;" >{#reason#}</label>
    <input id="reason" name="reason" value="{$finance.reason}"></input>
  </div>

  <div class="row">
    <label style="width:240px;" >{#plannedIncomingPaymentDate#}</label>
    <input id="planned_incoming_payment_date" name="planned_incoming_payment_date" value="{$finance.planned_incoming_payment_date|truncate:"10":""}"></input>
    <div class="datepick">
      <div id = "planned_incoming_payment_datePicker" class="picker" style = "display:none;"></div>
    </div>
  </div>

  <div class="row">
    <label style="width:240px;" >{#actualIncomingPaymentDate#}</label>
    <input id="actual_incoming_payment_date" name="actual_incoming_payment_date" value="{$finance.actual_incoming_payment_date|truncate:"10":""}"></input>
    <div class="datepick">
      <div id = "actual_incoming_payment_datePicker" class="picker" style = "display:none;"></div>
    </div>
  </div>

  <div class="row">
    <label style="width:240px;" >{#difference#}</label>
    <input id= "difference1" name="difference1" value="{$finance.difference1}"></input>
  </div>

  <div class="row">
    <label style="width:240px;" >{#incomingPaymentStatus#}</label>
    <select id="incoming_payment_status" name="incoming_payment_status" >
      <option value="-1" selected="selected">{#chooseone#}</option>
    {section name = idx loop=$financeStatus}
        {if $financeStatus[idx].id == $finance.incoming_payment_status}
          <option selected value = "{$financeStatus[idx].id}">{$financeStatus[idx].value}</option>
        {else}
          <option value = "{$financeStatus[idx].id}" >{$financeStatus[idx].value}</option>
        {/if}
      {/section}
    </select>
  </div>

  <div class="row">
    <label style="width:240px;" >{#actualIncomingPaymentAmountReceived#}</label>
    <input id="actual_incoming_payment_amount_received" name="actual_incoming_payment_amount_received" value="{$finance.actual_incoming_payment_amount_received}"></input>
  </div>

  <div class="row">
    <label style="width:240px;" >{#plannedOutgoingPaymentDate#}</label>
    <input id="planned_outgoing_payment_date" name="planned_outgoing_payment_date" value="{$finance.planned_outgoing_payment_date|truncate:"10":""}"></input>
    <div class="datepick">
      <div id = "planned_outgoing_payment_datePicker" class="picker" style = "display:none;"></div>
    </div>
  </div>

  <div class="row">
    <label style="width:240px;" >{#actualOutgoingPaymentDate#}</label>
    <input id="actual_outgoing_payment_date" name="actual_outgoing_payment_date" value="{$finance.actual_outgoing_payment_date|truncate:"10":""}"</input>
    <div class="datepick">
      <div id = "actual_outgoing_payment_datePicker" class="picker" style = "display:none;"></div>
    </div>
  </div>

  <div class="row">
    <label style="width:240px;" >{#difference#}</label>
    <input id="difference2" name="difference2" value="{$finance.difference2}"></input>
  </div>

  <div class="row">
    <label style="width:240px;" >{#outgoingPaymentSatus#}</label>
    <select id="outgoing_payment_status" name="outgoing_payment_status" >
      <option value="-1" selected="selected">{#chooseone#}</option>
      {section name = idx loop=$financeStatus}
        {if $financeStatus[idx].id == $finance.outgoing_payment_status}
          <option selected value = "{$financeStatus[idx].id}">{$financeStatus[idx].value}</option>
        {else}
          <option value = "{$financeStatus[idx].id}" >{$financeStatus[idx].value}</option>
        {/if}
      {/section}
    </select>

  </div>

  <div class="row">
    <label style="width:240px;">{#actualOutgoingPaymentAmountPaid#}</label>
    <input id="actual_outgoing_payment_amount_paid" name="actual_outgoing_payment_amount_paid" value="{$finance.actual_outgoing_payment_amount_paid}"></input>
  </div>

  <div class="row-butn-bottom">
    <label></label>
    <button onfocus="this.blur();" type="submit">{#save#}</button>
    <button onfocus="this.blur();" onclick="self.close()" type="reset">{#cancel#}</button>
  </div>

</form>

<script>
{literal}
  function bindDateOPicker(relateTo,target){
{/literal}
    
    theCal = new calendar({$theM},{$theY});
    theCal.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
    theCal.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
    theCal.relateTo = relateTo;
    theCal.dateFormat = "{$settings.dateformat}";
    theCal.getDatepicker(target);

{literal}
  }
  (function(){
    bindDateOPicker('actual_outgoing_payment_date','actual_outgoing_payment_datePicker');
    bindDateOPicker('planned_outgoing_payment_date','planned_outgoing_payment_datePicker');
    bindDateOPicker('actual_incoming_payment_date','actual_incoming_payment_datePicker');
    bindDateOPicker('planned_incoming_payment_date','planned_incoming_payment_datePicker');
  })();
{/literal}
</script>