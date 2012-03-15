{config_load file=lng.conf section = "strings" scope="global" }


<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#financename#}</label>
  <label style="margin:0 50px 0 0">{$finance.name}</label>
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#projectname#}</label>
  <label style="margin:0 50px 0 0">{$project.name}</label>
</div>
<div class="dlgRow">
    <label style="margin:0 50px 0 0">{#innercost#}</label>
    <select id = "targetFOBCurrencyInner" name="targetFOBCurrencyInner1" class="currency">
        {section name=curr loop=$currency}
        {if $currency[curr] == $finance.inner_cost_currency}
            <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
        {else}
            <option value="{$currency[curr]}">{$currency[curr]}</option>
        {/if}
        {/section}
    </select>
    <input id="newInnerCost" value={$finance.inner_cost}></input>
</div>
<div class="dlgRow">
    <label style="margin:0 50px 0 0">{#externalcost#}</label>
    <select id = "targetFOBCurrencyExt" name="targetFOBCurrencyExt1" class="currency">
        {section name=curr loop=$currency}
        {if $currency[curr] == $finance.external_cost_currency}
            <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
        {else}
            <option value="{$currency[curr]}">{$currency[curr]}</option>
        {/if}
        {/section}
    </select>
    <input id="newExternalCost" value = {$finance.external_cost}></input>
</div>
<div class="dlgRow">
    <label style="margin:0 50px 0 0">{#approved#}</label>
    <select id = "approvedFlag" name="approvedFlag1" class="currency">
        {section name=curr loop=$flag}
        {if $flag[curr] == $finance.approved}
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
<div class="dlgRow">
    <label style="margin:0 50px 0 0">{#published#}</label>
    <select id = "publishedFlag" name="publishedFlag1" class="currency">
        {section name=curr loop=$flag}
        {if $flag[curr] == $finance.published}
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

<button id="dlgBtnEditFinance" onclick="editFinance({$finance.ID});">{#save#}</button>

</div>
