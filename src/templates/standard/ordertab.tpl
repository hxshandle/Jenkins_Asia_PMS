<div class="phaseMenualBar">
  {if $addOrder}
    <button id="btnAddOrder">{#add#}</button>
   {/if}
  </div>
<div id="addOrderDlg" class="modalContainer">
  {include file="dlgmodal.tpl" templateName="addorder.tpl" title="add order"}
</div>
<div class="orderList" id="orderList">
  {if $orderDetailInfo}
  {include file = "orderdetails.tpl"}
  {/if}
</div>
<div id = "priceOrderDlg"></div>

{literal}
<script type="text/javascript">
  if(!window.__addOrderDlgContent){
    window.__addOrderDlgContent=$("addOrderDlg").innerHTML;
    $("addOrderDlg").remove(); 
  }
  //altert("1"+$("addFinanceDlg").innerHTML);
  new Control.Modal("btnAddOrder",{
                                "contents":window.__addOrderDlgContent,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
                               
  function reloadOrder(){  
var theUrl = "manageprojectajax.php?action=reloadorder&id="+__projectId;
    new Ajax.Request(theUrl, {
      method: 'get',
      onSuccess:function(payload) {
        if (payload.responseText != ""){ 
            $("orderList").innerHTML=payload.responseText;
          }
        }
      });
  }
    
    
  function showOrderDlg(ctx){
    var dlg = new Control.Modal("priceOrderDlg",{
                                "contents":ctx,
                                fade:true,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
   dlg.open();      
  }  
  
  function priceOrderDlg(id){
    var orderId = id;
    var theUrl = "manageprojectajax.php?action=priceOrder&id="+orderId;
    new Ajax.Request(theUrl, {
      method: 'get',
      onSuccess:function(payload) {
        if (payload.responseText != ""){ 
                     showOrderDlg(payload.responseText);
                     }else{
                         alert("faild");
                        }
                    }
                    });  
  }

        
     //修改页面的保存js
    function editOrder(orderId){
      var theUrl = "manageprojectajax.php";
      var thePost = "action=saveOrder&projectId="+__projectId;
      thePost +="&orderId="+orderId;
      var jstargetFOBCurrencyInner = $("targetFOBCurrencyInner").value;
      thePost +="&currencyInner="+jstargetFOBCurrencyInner;
      var jsnewExternalCost = $("newExternalCost").value;    
      thePost +="&externalCost="+jsnewExternalCost;    
      var jsnewInnerCost = $("newInnerCost").value;   
      thePost +="&innerCost="+jsnewInnerCost;   
      var jstargetFOBCurrencyExt = $("targetFOBCurrencyExt").value;
      thePost +="&currencyExt="+jstargetFOBCurrencyExt;
      var jspublishedFlag = $("publishedFlag").value;
      thePost +="&published="+jspublishedFlag;      
      var jspublishedFlag = $("publishedFlag").value;
      thePost +="&published="+jspublishedFlag;  
      var jsendTime = $("newEndTime").value;
      thePost +="&endTime="+jsendTime;
         new Ajax.Request(theUrl, {
      method: 'post',
      postBody:thePost,
      onSuccess:function(payload) {
        if (payload.responseText == "Ok"){ 
            reloadOrder();
            Control.Modal.close();
          }
        }
      });
    }
        
  function agreeOrderDlg(orderId){
    var theUrl = "manageprojectajax.php?action=agreeOrder&orderId="+orderId;
    new Ajax.Request(theUrl, {
      method: 'get',
      onSuccess:function(payload) {
        if (payload.responseText == "Ok"){ 
          reloadOrder();
        }else{
          alert("del faild");
        }
      }
    });
  }   
      
   function rejectOrderDlg(orderId){
    var theUrl = "manageprojectajax.php?action=rejectOrder&orderId="+orderId;
    new Ajax.Request(theUrl, {
      method: 'get',
      onSuccess:function(payload) {
        if (payload.responseText == "Ok"){ 
          reloadOrder();
        }else{
          alert("del faild");
        }
      }
    });
  }         
</script>
{/literal}