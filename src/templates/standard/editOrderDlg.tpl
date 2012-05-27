<div class="dlgRow">
  <label style="margin:0 75px 0 0" >{#order#}</label>
  <input id="newOrderName"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 75px 0 0">{#quantity#}</label>
  <input id="newOrderQuantity"   regexp="{literal}\d+{/literal}"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#ordertime#}</label>
  <input id="newOrderTime"></input>
</div>
<div class="dlgRow">
  <label style="margin:0 50px 0 0">{#orderdesc#}</label>
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
        if( addOrderValidator()){
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