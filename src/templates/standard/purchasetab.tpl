<div class="phaseMenualBar">
 {if editBaseInfo}
    <button id="btnAddPurchase">{#add#}</button>
 {/if}
</div>
<div id="addPurchaseDlg" class="modalContainer">
  {include file="dlgmodal.tpl" templateName="addpurchase.tpl" title="add Purchase"}
</div>
<div class="purchaseList" id="purchaseList">
 {if $editPurchaseInfo}
    {include file = "purchasedetails.tpl"}
 {if}
</div>
<div id = "pricePurchaseDlg"></div>

{literal}
<script type="text/javascript">
  if(!window.__addPurchaseDlgContent){
    window.__addPurchaseDlgContent=$("addPurchaseDlg").innerHTML;
    $("addPurchaseDlg").remove(); 
  }
  //altert("1"+$("addFinanceDlg").innerHTML);
  new Control.Modal("btnAddPurchase",{
                                "contents":window.__addPurchaseDlgContent,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
                               
  function reloadPurchase(){  
var theUrl = "manageprojectajax.php?action=reloadpurchase&id="+__projectId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
            $("purchaseList").innerHTML=payload.responseText;
          }
        }
      });
  }
    
    
  function showPurchaseDlg(ctx){
    var dlg = new Control.Modal("pricePurchaseDlg",{
                                "contents":ctx,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
   dlg.open();      
  }  
  
  function pricePurchaseDlg(id){
    var orderId = id;
    var theUrl = "manageprojectajax.php?action=pricePurchase&id="+orderId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText != ""){ 
                     showPurchaseDlg(payload.responseText);
                     }else{
                         alert("faild");
                        }
                    }
                    });  
  }

        
     //修改页面的保存js
    function editPurchase(purchaseId){
      var theUrl = "manageprojectajax.php";
      var thePost = "action=savePurchase&projectId="+__projectId;
      thePost +="&purchaseId="+purchaseId;
      var jstargetFOBCurrencyPrice = $("targetFOBCurrencyPrice").value;
      thePost +="&currencyPrice="+jstargetFOBCurrencyPrice;
      var jsnewPrice = $("newPrice").value;   
      thePost +="&price="+jsnewPrice;   
      var jsendTime = $("newEndTime").value;
      thePost +="&endTime="+jsendTime;
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
        
  function agreePurchaseDlg(purchaseId){
    var theUrl = "manageprojectajax.php?action=agreePurchase&purchaseId="+purchaseId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText == "Ok"){ 
          reloadPurchase();
        }else{
          alert("del faild");
        }
      }
    });
  }   
      
   function rejectPurchaseDlg(purchaseId){
    var theUrl = "manageprojectajax.php?action=rejectPurchase&purchaseId="+purchaseId;
    new Ajax.Request(theUrl, {
		  method: 'get',
		  onSuccess:function(payload) {
		    if (payload.responseText == "Ok"){ 
          reloadPurchase();
        }else{
          alert("del faild");
        }
      }
    });
  }         
</script>
{/literal}