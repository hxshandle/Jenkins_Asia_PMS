{config_load file=lng.conf section = "strings" scope="global" }


<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#order#}</label>
  <label style="margin:0 50px 0 0">{$order.name}</label>
</div>
<div class="dlgRow">
  <label style="margin:0 75px 0 0">{#quantity#}</label>
  <label style="margin:0 50px 0 0">{$order.quantity}</label>
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#orderdesc#}</label>
  <label style="margin:0 50px 0 0">{$order.desc}</label>
</div>
<div class="dlgRow">
    <label style="margin:0 50px 0 0">{#innercost#}</label>
    <select id = "targetFOBCurrencyInner" name="targetFOBCurrencyInner1" class="currency">
        {section name=curr loop=$currency}
        {if $currency[curr] == $order.inner_cost_currency}
            <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
        {else}
            <option value="{$currency[curr]}">{$currency[curr]}</option>
        {/if}
        {/section}
    </select>
    <input id="newInnerCost" value ="{$order.inner_cost}"  regexp="{literal}\d+{/literal}"></input>
</div>
<div class="dlgRow">
    <label style="margin:0 50px 0 0">{#externalcost#}</label>
    <select id = "targetFOBCurrencyExt" name="targetFOBCurrencyExt" class="currency">
        {section name=curr loop=$currency}
          <option value="{$currency[curr]}">{$currency[curr]}</option>
        {/section}
    </select>
    <input id="newExternalCost" value ="{$order.external_cost}" regexp="{literal}\d+{/literal}"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#endtime#}</label>
  <input id="newEndTime" value ={$order.end_time}></input>
</div>
<div class="dlgRow">
    <label style="margin:0 50px 0 0">{#published#}</label>
    <select id = "publishedFlag" name="publishedFlag1" class="currency">
        {section name=curr loop=$flag}
        {if $flag[curr] == $order.published}
            <option selected  value="{$flag[curr]}">
            {if $flag[curr] ==1}
                {#yes#}
            {else}
                {#no#}
            {/if}
            </option>
        {else}
            <option value="{$flag[curr]}">
            {if $flag[curr] ==1}
                {#yes#}
            {else}
                {#no#}
            {/if}
            </option>
        {/if}
        {/section}
    </select>
</div>
<div  style="margin:10px 0 0 0">

<button id="dlgBtnEditOrder" onclick="editOrder({$order.ID});">{#save#}</button>

</div>
