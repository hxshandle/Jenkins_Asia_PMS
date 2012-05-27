<div class="dlgRow">
  <label style="" >{#customerPoNumber#}</label>
  <input id="newCustomerPoNumber"></input>
</div>
<div class="dlgRow">
  <label style="" >{#order#}</label>
  <input id="newOrderName"></input>
</div>
<div class="dlgRow">
  <label style="">{#quantity#}</label>
  <input id="newOrderQuantity"   regexp="{literal}\d+{/literal}"></input>
</div>
<div class="dlgRow">
        <label for="uploadfile" style="float:left">{#upload#}:</label>

        {include file = "uploadfile.tpl" lazyLoad=true}

</div>
<input type = "hidden" id = "fileId" name = "fileId"></input>
<div class="dlgRow">
  <label style="">{#ordertime#}</label>
  <input id="newOrderTime"></input>
</div>
<div class="dlgRow">
  <label style="">{#deliverydateone#}</label>
  <input id="newDeliveryDateOne"></input>
</div>  
<div class="dlgRow">
  <label style="">{#deliverydatetwo#}</label>
  <input id="newDeliveryDateTwo"></input>
</div> 
  
<div class="dlgRow">
  <label style="">{#orderdesc#}</label>
  <textarea id="newOrderDesc"></textarea>
</div>

<div  style="margin:10px 0 0 0">
<button id="dlgBtnSaveOrder" onclick="saveOrder();">{#save#}</button>
</div>

{literal}
  <script type="text/javascript">

function addOrderValidator(){
      var ret = true;
      var newOrderName = $('newOrderName').value;
      if(newOrderName.length<1){
        $('newOrderName').style.border="2px solid red";
        ret = false;
      }
       return ret;
    }
      
      
    function saveOrder(){
        if(!addOrderValidator()){
               return false;
        }
      var theUrl = "manageprojectajax.php";
      var thePost = "action=addOrder&projectId="+__projectId;
      var jsorderName = $("newOrderName").value;
      thePost +="&orderName="+jsorderName;
      var jsorderQuantity = $("newOrderQuantity").value;
      thePost +="&orderQuantity="+jsorderQuantity;
      var jsorderTime = $("newOrderTime").value;
      thePost +="&orderTime="+jsorderTime;
      var jsorderDesc = $("newOrderDesc").value;
      thePost +="&orderDesc="+jsorderDesc;
      var jsattachment1 = $("fileId").value;
      thePost +="&attachment1="+jsattachment1; 
      var jsdeliveryDateOne = $("newDeliveryDateOne").value;
      thePost +="&deliveryDateOne="+jsdeliveryDateOne;
      var jsdeliveryDateTwo = $("newDeliveryDateTwo").value;
      thePost +="&deliveryDateTwo="+jsdeliveryDateTwo;
      var jscustomerPoNumber = $("newCustomerPoNumber").value;
      thePost +="&customerPoNumber="+jscustomerPoNumber;
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