<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#financename#}</label>
  <input id="newFinanceName"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#projectname#}</label>
  <label style="margin:0 50px 0 0">{$project.name}</label>
</div>
<div class="dlgRow">
    <label style="margin:0 50px 0 0">{#innercost#}</label>
    <select id = "targetFOBCurrencyInner" name="targetFOBCurrencyInner" class="currency">
        {section name=curr loop=$currency}
        {if $currency[curr] == $project.target_fob_currency}
            <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
        {else}
            <option value="{$currency[curr]}">{$currency[curr]}</option>
        {/if}
        {/section}
    </select>
    <input id="newInnerCost" regexp="{literal}\d+{/literal}"></input>
</div>

<div class="dlgRow" {if $smarty.session.userRole != 1 and $smarty.session.userRole != 3}style="display:none"{/if}>
    <label style="margin:0 50px 0 0">{#externalcost#}</label>
    <select id = "targetFOBCurrencyExt" name="targetFOBCurrencyExt" class="currency">
        {section name=curr loop=$currency}
        {if $currency[curr] == $project.target_fob_currency}
            <option selected  value="{$currency[curr]}">{$currency[curr]}</option>
        {else}
            <option value="{$currency[curr]}">{$currency[curr]}</option>
        {/if}
        {/section}
    </select>
    <input id="newExternalCost" regexp="{literal}\d+{/literal}"></input>
</div>
<div class="dlgRow">
    <label style="margin:0 50px 0 0">{#approved#}</label>
    <select id = "approvedFlag" name="approvedFlag" class="currency">
        {section name=curr loop=$flag}
        {if $flag[curr] == $project.approved}
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
    <select id = "publishedFlag" name="publishedFlag" class="currency">
        {section name=curr loop=$flag}
        {if $flag[curr] == $project.published}
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
<button id="dlgBtnSaveFinance" onclick="saveFinance();">{#save#}</button>

</div>

{literal}
  <script type="text/javascript">

    function addFinanceValidator(){
      var ret = true;
      var newFinanceName = $('newFinanceName').value;
      if(newFinanceName.length<1){
        $('newFinanceName').style.border="2px solid red";
        ret = false;
      }
       return ret;
    }

function saveFinance(){
    if(!addFinanceValidator()){
        return false;
    }
      var theUrl = "manageprojectajax.php";
      var thePost = "action=addFinance&projectId="+__projectId;
      var jsfinanceName = $("newFinanceName").value;
      thePost +="&financeName="+jsfinanceName;
      var jstargetFOBCurrencyInner = $("targetFOBCurrencyInner").value;
      thePost +="&currencyInner="+jstargetFOBCurrencyInner;
      var jsnewExternalCost = $("newExternalCost").value;    
      thePost +="&externalCost="+jsnewExternalCost;    
      var jsnewInnerCost = $("newInnerCost").value;   
      thePost +="&innerCost="+jsnewInnerCost;   
      var jstargetFOBCurrencyExt = $("targetFOBCurrencyExt").value;
      thePost +="&currencyExt="+jstargetFOBCurrencyExt;
      var jspublishedFlag = $("publishedFlag").value;
      thePost +="&publishedFlag="+jspublishedFlag;          
      var jsapprovedFlag = $("approvedFlag").value;
      thePost +="&approvedFlag="+jsapprovedFlag;                    
      new Ajax.Request(theUrl, {
		  method: 'post',
		  postBody:thePost,
		  onSuccess:function(payload) {
		    if (payload.responseText == "Ok"){ 
            reloadFinance();
            Control.Modal.close();
          }
        }
      });
    }
      
      
  </script>
{/literal}