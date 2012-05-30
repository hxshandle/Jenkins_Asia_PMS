<div class="phaseMenualBar">
{if $addOrder}
   <button id="btnAddOrder">{#add#}</button>
{/if} 

</div>
<div id="addOrderDlg" class="modalContainer">
  {include file="dlgmodal.tpl" templateName="addorder.tpl" title="add order"}
</div>
<div class="orderList" id="orderList" style="overflow:scroll">
  {if $orderDetailInfo}
  {include file = "orderdetails.tpl"}
  {/if}
</div>
<div id = "priceOrderDlg"></div>

<script type="text/javascript">
  var __sesionId = "{$smarty.session.sessionId}";
  var __projectId = {$projectId};
  var __userId = "{$smarty.session.userid}";

</script>


{literal}
<script type="text/javascript">
  if(!window.__addOrderDlgContent){
    window.__addOrderDlgContent=$("addOrderDlg").innerHTML;
    $("addOrderDlg").remove(); 
  }
  function initOrderFileUploader(){
    var swfu_addOrder;
    J.initSwfUploader(
    "uploadfileajax.php",{"PHPSESSID" : __sesionId,"userId":__userId,'type':"order","id":__projectId},swfu_addOrder,"spanButtonPlaceHolder","btnCancel",orderFileUploadSuccess);
  }
    
  function initOrderFileUploader1(idx){
    var swfu_addOrder1,swfu_addOrder2,swfu_addOrder3,swfu_addOrder4;
    J.initSwfUploader(
    "uploadfileajax.php",{"PHPSESSID" : __sesionId,"userId":__userId,'type':"order","id":__projectId},swfu_addOrder1,"spanButtonPlaceHolder1","btnCancel1",upldateFileFiled2,upldateFileFiledInfo2,"fsUploadProgress1");
    J.initSwfUploader(
    "uploadfileajax.php",{"PHPSESSID" : __sesionId,"userId":__userId,'type':"order","id":__projectId},swfu_addOrder2,"spanButtonPlaceHolder2","btnCancel2",upldateFileFiled3,upldateFileFiledInfo3,"fsUploadProgress2");
    J.initSwfUploader(
    "uploadfileajax.php",{"PHPSESSID" : __sesionId,"userId":__userId,'type':"order","id":__projectId},swfu_addOrder3,"spanButtonPlaceHolder3","btnCancel3",upldateFileFiled4,upldateFileFiledInfo4,"fsUploadProgress3");
    J.initSwfUploader(
    "uploadfileajax.php",{"PHPSESSID" : __sesionId,"userId":__userId,'type':"order","id":__projectId},swfu_addOrder4,"spanButtonPlaceHolder","btnCancel",upldateFileFiled1,upldateFileFiledInfo1,"fsUploadProgress");
  }
    
  function upldateFileFiled1(id){
    if($("fileId1")){
      $("fileId1").value = id;  
    }
  }
    
  function upldateFileFiled2(id){
    if($("fileId2")){
      $("fileId2").value = id;  
    }
  }
     
  function upldateFileFiled3(id){
    if($("fileId3")){
      $("fileId3").value = id;  
    }
  }   
     
  function upldateFileFiled4(id){
    if($("fileId4")){
      $("fileId4").value = id;  
    }
  }  
  function orderFileUploadSuccess(file,id){
  }

  function upldateFileFiledInfo1(numFilesUploaded){
    if($("divStatus")){
      $("divStatus").innerHTML = numFilesUploaded + " file" + (numFilesUploaded === 1 ? "" : "s") + " uploaded.";
    }
  }
  function upldateFileFiledInfo2(numFilesUploaded){
    if($("divStatus1")){
      $("divStatus1").innerHTML = numFilesUploaded + " file" + (numFilesUploaded === 1 ? "" : "s") + " uploaded.";
    }
  }
  function upldateFileFiledInfo3(numFilesUploaded){
    if($("divStatus2")){
      $("divStatus2").innerHTML = numFilesUploaded + " file" + (numFilesUploaded === 1 ? "" : "s") + " uploaded.";
    }
  }
  function upldateFileFiledInfo4(numFilesUploaded){
    if($("divStatus3")){
      $("divStatus3").innerHTML = numFilesUploaded + " file" + (numFilesUploaded === 1 ? "" : "s") + " uploaded.";
    }
  }

  new Control.Modal("btnAddOrder",{
                                "contents":window.__addOrderDlgContent,
                                fade:true,
                                afterOpen:initOrderFileUploader,
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
   function showOrderDlg1(ctx){
    var dlg = new Control.Modal("priceOrderDlg",{
                                "contents":ctx,
                                fade:true,
                                afterOpen:initOrderFileUploader1,
                                opacity: 0.8,
                                containerClassName: 'dlgmodal',
                                overlayClassName: 'tasksoverlay'
                             });
   dlg.open();      
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

        
     //修改页面
    function editOrderDlg(id){
    var orderId = id;
    var theUrl = "manageprojectajax.php?action=editOrder&id="+orderId;
    new Ajax.Request(theUrl, {
      method: 'get',
      onSuccess:function(payload) {
        if (payload.responseText != ""){ 
                     showOrderDlg1(payload.responseText);
                     }else{
                         alert("faild");
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

      
      
    function saveEditOrder(orderId){
      var theUrl = "manageprojectajax.php";
      var thePost = "action=editOrderSave&orderId="+orderId;
      var jsorderTime = $("newOrderTime").value;
      thePost +="&orderTime="+jsorderTime;
      var jsorderDesc = $("newOrderDesc").value;
      thePost +="&orderDesc="+jsorderDesc;
      var jsjenkinsPoNumber = $("newJenkinsPoNumber").value;
      thePost +="&jenkinsPoNumber="+jsjenkinsPoNumber;
      var jsattachment2 = $("fileId1").value;
      thePost +="&attachment2="+jsattachment2;
      var jsfactory = $("newFactory").value;
      thePost +="&factory="+jsfactory;
      var jsterms = $("newTerms").value;
      thePost +="&terms="+jsterms;
      var jsaccountPayment = $("newAccountPayment").value;
      thePost +="&accountPayment="+jsaccountPayment;
      var jscustomerModelNumber = $("newCustomerModelNumber").value;
      thePost +="&customerModelNumber="+jscustomerModelNumber;
      var jscustomerPartNumber = $("newCustomerPartNumber").value;
      thePost +="&customerPartNumber="+jscustomerPartNumber;
      var jsjenkinsModelNumber = $("newJenkinsModelNumber").value;
      thePost +="&jenkinsModelNumber="+jsjenkinsModelNumber;
      var jsjenkinsPartNumber = $("newJenkinsPartNumber").value;
      thePost +="&jenkinsPartNumber="+jsjenkinsPartNumber;
      var jspaymentOneSchedule = $("newPaymentOneSchedule").value;
      thePost +="&paymentOneSchedule="+jspaymentOneSchedule;
      var jspaymentOneAttachment = $("fileId2").value;
      thePost +="&paymentOneAttachment="+jspaymentOneAttachment;
      var jstargetpaymentStatus1 = $("targetpaymentStatus1").value;
      thePost +="&paymentStatus1="+jstargetpaymentStatus1;
      var jspaymentTwoSchedule = $("newPaymentTwoSchedule").value;
      thePost +="&paymentTwoSchedule="+jspaymentTwoSchedule;
      var jspaymentTwoAttachment = $("fileId3").value;
      thePost +="&paymentTwoAttachment="+jspaymentTwoAttachment;
      var jstargetpaymentStatus2 = $("targetpaymentStatus2").value;
      thePost +="&paymentStatus2="+jstargetpaymentStatus2;
      var jspaymentThreeSchedule = $("newPaymentThreeSchedule").value;
      thePost +="&paymentThreeSchedule="+jspaymentThreeSchedule;
      var jspaymentThreeAttachment = $("fileId4").value;
      thePost +="&paymentThreeAttachment="+jspaymentThreeAttachment;
      var jstargetpaymentStatus3 = $("targetpaymentStatus3").value;
      thePost +="&paymentStatus3="+jstargetpaymentStatus3;
      var jsfinalTotalAmountReceived = $("newFinalTotalAmountReceived").value;
      thePost +="&finalTotalAmountReceived="+jsfinalTotalAmountReceived;
      var jsdeliveryDateOne = $("newDeliveryDateOne").value;
      thePost +="&deliveryDateOne="+jsdeliveryDateOne;
      var jstargetDeliveryStatus1 = $("targetDeliveryStatus1").value;
      thePost +="&deliveryStatus1="+jstargetDeliveryStatus1;
      var jsdeliveryDateTwo = $("newDeliveryDateTwo").value;
      thePost +="&deliveryDateTwo="+jsdeliveryDateTwo;
      var jstargetDeliveryStatus2 = $("targetDeliveryStatus2").value;
      thePost +="&deliveryStatus2="+jstargetDeliveryStatus2;
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
            
</script>
{/literal}