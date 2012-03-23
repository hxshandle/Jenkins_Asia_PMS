{config_load file=lng.conf section = "strings" scope="global" }


<div class="dlgRow">
  <label style="margin:0 50px 0 0" >{#purchase#}</label>
  <label style="margin:0 50px 0 0">{$purchase.name}</label>
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#quantity#}</label>
  <label style="margin:0 50px 0 0">{$purchase.quantity}</label>
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#description#}</label>
  <label style="margin:0 50px 0 0">{$purchase.desc}</label>
</div>
<div class="dlgRow">
    <label style="margin:0 50px 0 0">{#price#}</label>
    <select id = "targetFOBCurrencyPrice" name="targetFOBCurrencyPrice" class="currency">
        {section name=curr loop=$currency}
        {if $currency[curr] == $purchase.price_currency}
            <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
        {else}
            <option value="{$currency[curr]}">{$currency[curr]}</option>
        {/if}
        {/section}
    </select>
    <input id="newPrice" value ={$purchase.price}></input>
</div>

<div class="dlgRow">
  <label style="margin:0 25px 0 0">{#endtime#}</label>
  <input id="newEndTime" value ={$purchase.end_time}></input>
</div>

<div  style="margin:10px 0 0 0">

<button id="dlgBtnEditPrice" onclick="editPurchase({$purchase.ID});">{#save#}</button>

</div>
