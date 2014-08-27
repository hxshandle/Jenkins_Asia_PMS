<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#purchase#}</label>
  <input id="newPurchaseName"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 75px 0 0">{#quantity#}</label>
  <input id="newPurchaseQuantity" regexp="{literal}\d+{/literal}"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 75px 0 0">{#description#}</label>
  <textarea id="newPurchaseDesc"></textarea>
</div>
<div  style="margin:10px 0 0 0">
<button id="dlgBtnSavePurchase" onclick="savePurchase();">{#save#}</button>
</div>

{literal}
  <script type="text/javascript">
    function addPurchaseValidator(){
      var ret = true;
      var newPurchaseName = $('newPurchaseName').value;
      if(newPurchaseName.length<1){
        $('newPurchaseName').style.border="2px solid red";
        ret = false;
      }
       return ret;
    }  
      
      
    function savePurchase(){
       if(! addPurchaseValidator()){
           return false;
}
      var theUrl = "manageprojectajax.php";
      var thePost = "action=addPurchase&projectId="+__projectId;
      var jspurchaseName = $("newPurchaseName").value;
      thePost +="&purchaseName="+jspurchaseName;
      var jspurchaseQuantity = $("newPurchaseQuantity").value;
      thePost +="&purchaseQuantity="+jspurchaseQuantity;
      var jspurchaseDesc = $("newPurchaseDesc").value;
      thePost +="&purchaseDesc="+jspurchaseDesc;   
      new Ajax.Request(theUrl, {
		  method: 'post',
		  postBody:thePost,
		  onSuccess:function(payload) {
		    if (payload.responseText == "Ok"){ 
            reloadPurchase();
            Control.Modal.close();
          }
        }
      });
    }
      
      
  </script>
{/literal}